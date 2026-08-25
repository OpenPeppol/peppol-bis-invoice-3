#!/bin/sh

PROJECT=$(dirname $(readlink -f "$0"))
BUILD_LOG="$PROJECT/build.log"

# Keep the complete output of every build step, while reserving the original
# stdout for the warning/error summary printed at the end.
exec 3>&1
: > "$BUILD_LOG" || {
    echo "Unable to create build log: $BUILD_LOG" >&3
    exit 1
}
exec >> "$BUILD_LOG" 2>&1

if [ -e $PROJECT/target ]; then
    docker run --rm -i -v $PROJECT:/src alpine:3.11 rm -rf /src/target
fi

# Structure
docker run --rm -i \
    -v $PROJECT:/src \
    -v $PROJECT/target:/target \
    difi/vefa-structure:0.7


# Validator
docker run --rm -i -v $PROJECT:/src phelger/vefa-validator:2.4.3 build -x -t -n eu.peppol.postaward.v3.billing -a rules,guide -target target/validator /src


# Generate adoc-files from rules

# CEN-EN16931-CII
#docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/CEN-EN16931-CII.sch -q:tools/xquery/rules_asciidoc_cen.xquery -o:/target/CEN-EN16931-CII-GENERAL.sch.adoc
#docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/CEN-EN16931-CII.sch -q:tools/xquery/rules_asciidoc_cen_syntax.xquery -o:/target/CEN-EN16931-CII-SYNTAX.sch.adoc

# CEN-EN16931-UBL
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/CEN-EN16931-UBL.sch -q:tools/xquery/rules_asciidoc_cen.xquery -o:/target/CEN-EN16931-UBL-GENERAL.sch.adoc
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/CEN-EN16931-UBL.sch -q:tools/xquery/rules_asciidoc_cen_syntax.xquery -o:/target/CEN-EN16931-UBL-SYNTAX.sch.adoc

# PEPPOL-EN16931-UBL
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/PEPPOL-EN16931-UBL-SB.sch -q:tools/xquery/rules_asciidoc_peppol.xquery -o:/target/PEPPOL-EN16931-UBL-SB-GENERAL.sch.adoc
docker run --rm -i -v $PROJECT:/src -v $PROJECT/target/generated:/target --entrypoint java klakegg/saxon:9.8.0-7 -cp /saxon.jar net.sf.saxon.Query -s:/src/rules/sch/PEPPOL-EN16931-UBL-SB.sch -q:tools/xquery/rules_asciidoc_peppol_national.xquery -o:/target/PEPPOL-EN16931-UBL-SB-NATIONAL.sch.adoc

# Example files
rm -rf $PROJECT/target/site/files/BIS-SelfBilling-Examples.zip

cd $PROJECT
zip -r target/site/files/BIS-SelfBilling-Examples.zip rules/examples

# Guides
docker run --rm -i -v $PROJECT:/documents -v $PROJECT/target:/target difi/asciidoctor


# Fix ownership
docker run --rm -i -v $PROJECT:/src alpine:3.11 chown -R $(id -g $USER).$(id -g $USER) /src/target
BUILD_RESULT=$?

printf '\nWarnings and errors from %s:\n' "$BUILD_LOG" >&3
if ! grep -nEi '([0-9]{2}:[0-9]{2}:[0-9]{2}([.,][0-9]{1,3})?[[:space:]]+(\|[[:space:]]*-?)?(WARN(ING)?|ERROR).+)' "$BUILD_LOG" >&3; then
    echo "None." >&3
fi

printf '\nBuild log from the last "tests performed" line:\n' >&3
if grep -qi 'tests performed' "$BUILD_LOG"; then
    awk 'tolower($0) ~ /tests performed/ { summary = ""; found = 1 } found { summary = summary $0 ORS } END { if (found) printf "%s", summary }' "$BUILD_LOG" >&3
else
    echo "No test summary found." >&3
fi

exit "$BUILD_RESULT"
