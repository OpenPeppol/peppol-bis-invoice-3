@echo off
setlocal EnableDelayedExpansion

set PROJECT=%~dp0
set "PROJECT=%PROJECT:~0,-1%"  :: Remove trailing backslash if any
set "BUILD_LOG=%PROJECT%\build.log"

call :build > "%BUILD_LOG%" 2>&1
set "BUILD_RESULT=%ERRORLEVEL%"
call :report "%BUILD_LOG%"
endlocal & exit /b %BUILD_RESULT%

:build
call :dashed "Set the project directory"
echo PROJECT folder = %PROJECT%

call :dashed "Check if target directory exists, and if so, remove it"
if exist "%PROJECT%/target" (
    echo Remove src/target and bind to %PROJECT%/target
    docker run --rm -v "%PROJECT%:/src" alpine:3.11 rm -rf /src/target
)

call :dashed "Structure"
docker run --rm -v "%PROJECT%:/src" -v "%PROJECT%/target:/target" difi/vefa-structure:0.7

call :dashed "Validator"
docker run --rm -v "%PROJECT%:/src" phelger/vefa-validator:2.4.3 build -x -t -n eu.peppol.postaward.v3.billing -a rules,guide -target target/validator /src

call :dashed "Generate adoc-files from rules"
ECHO CEN-EN16931-UBL
docker run --rm -v "%PROJECT%:/src" -v "%PROJECT%/target/generated:/target" --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/CEN-EN16931-UBL.sch -q:tools/xquery/rules_asciidoc_cen.xquery -o:/target/CEN-EN16931-UBL-GENERAL.sch.adoc
docker run --rm -v "%PROJECT%:/src" -v "%PROJECT%/target/generated:/target" --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/CEN-EN16931-UBL.sch -q:tools/xquery/rules_asciidoc_cen_syntax.xquery -o:/target/CEN-EN16931-UBL-SYNTAX.sch.adoc

ECHO PEPPOL-EN16931-UBL
docker run --rm -v "%PROJECT%:/src" -v "%PROJECT%/target/generated:/target" --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/PEPPOL-EN16931-UBL.sch -q:tools/xquery/rules_asciidoc_peppol.xquery -o:/target/PEPPOL-EN16931-UBL-GENERAL.sch.adoc
docker run --rm -v "%PROJECT%:/src" -v "%PROJECT%/target/generated:/target" --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/PEPPOL-EN16931-UBL.sch -q:tools/xquery/rules_asciidoc_peppol_national.xquery -o:/target/PEPPOL-EN16931-UBL-NATIONAL.sch.adoc

call :dashed "Remove old example files if they exist"
set zip="%PROJECT%\target\site\files\BIS-Billing3-Examples.zip"
if exist %zip% (
    echo remove %zip%
    del %zip%
)

call :dashed "Create zip of examples"
powershell -command "Compress-Archive -Path '%PROJECT%/rules/examples' -DestinationPath '%PROJECT%/target/site/files/BIS-Billing3-Examples.zip' -Force"

call :dashed "Create Guides"
docker run --rm -i -v "%PROJECT%:/documents" -v "%PROJECT%/target:/target" difi/asciidoctor

REM Ownership fix is Linux-specific and skipped
exit /b %ERRORLEVEL%

:report
powershell -NoProfile -Command "$matches = Select-String -LiteralPath '%~1' -Pattern '(?i)(\d{2}:\d{2}:\d{2}(?:[.,]\d{1,3})?\s+(?:\|\s*-?)?(?:WARN(?:ING)?|ERROR).+)'; if ($matches) { Write-Host ''; Write-Host 'Warnings and errors from %~1:'; foreach ($match in $matches) { '{0}: {1}' -f $match.LineNumber, $match.Line } } else { Write-Host ''; Write-Host 'Warnings and errors from %~1: None.' }; $testSummary = @(Select-String -LiteralPath '%~1' -Pattern '(?i)tests performed'); Write-Host ''; Write-Host 'Build log from the last tests performed line:'; if ($testSummary.Count -gt 0) { Get-Content -LiteralPath '%~1' | Select-Object -Skip ($testSummary[$testSummary.Count - 1].LineNumber - 1) } else { Write-Host 'No test summary found.' }"
goto :eof

:dashed
REM Function to print text with surrounding dashes, up to 80 characters total
set "text=%~1"
set "maxLength=80"

REM Calculate the length of the text
set "len=0"
for /l %%i in (12,-1,0) do (
    set /a "len|=1<<%%i"
    for %%j in (!len!) do if "!text:~%%j,1!"=="" set /a "len&=~1<<%%i"
)

REM Calculate the number of dashes needed on each side
set /a "totalDashes=maxLength-len-2"
set /a "sideDashes=totalDashes/2"

REM Create the dash strings for each side
set "leftDashes="
for /l %%i in (1,1,%sideDashes%) do set "leftDashes=!leftDashes!-"

set "rightDashes=%leftDashes%"
if %totalDashes% neq %sideDashes% set "rightDashes=%rightDashes%-"

REM Print the final line with dashes, text, and additional dashes
echo !leftDashes! %text% !rightDashes!
goto :eof
