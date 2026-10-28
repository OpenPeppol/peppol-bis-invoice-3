<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cn="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:in="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:u="utils" version="2.0" exclude-result-prefixes="cac cbc u cn in xs">
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="no" />
	<xsl:param name="stylesheet_url" select="'NONE'" />
	<xsl:template name="doc-head">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<xsl:choose>
			<xsl:when test="$stylesheet_url = 'NONE'">
				<style>/*! normalize.css v3.0.3 | MIT License | github.com/necolas/normalize.css */html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}article,aside,details,figcaption,figure,footer,header,hgroup,main,menu,nav,section,summary{display:block}audio,canvas,progress,video{display:inline-block;vertical-align:baseline}audio:not([controls]){display:none;height:0}[hidden],template{display:none}a{background-color:transparent}a:active,a:hover{outline:0}abbr[title]{border-bottom:1px dotted}b,strong{font-weight:bold}dfn{font-style:italic}h1{font-size:2em;margin:0.67em 0}mark{background:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sup{top:-0.5em}sub{bottom:-0.25em}img{border:0}svg:not(:root){overflow:hidden}figure{margin:1em 40px}hr{box-sizing:content-box;height:0}pre{overflow:auto}code,kbd,pre,samp{font-family:monospace, monospace;font-size:1em}button,input,optgroup,select,textarea{color:inherit;font:inherit;margin:0}button{overflow:visible}button,select{text-transform:none}button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer}button[disabled],html input[disabled]{cursor:default}button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0}input{line-height:normal}input[type="checkbox"],input[type="radio"]{box-sizing:border-box;padding:0}input[type="number"]::-webkit-inner-spin-button,input[type="number"]::-webkit-outer-spin-button{height:auto}input[type="search"]{-webkit-appearance:textfield;box-sizing:content-box}input[type="search"]::-webkit-search-cancel-button,input[type="search"]::-webkit-search-decoration{-webkit-appearance:none}fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:0.35em 0.625em 0.75em}legend{border:0;padding:0}textarea{overflow:auto}optgroup{font-weight:bold}table{border-collapse:collapse;border-spacing:0}td,th{padding:0}/*! Source: https://github.com/h5bp/html5-boilerplate/blob/master/src/css/main.css */@media print{*,*:before,*:after{background:transparent !important;color:#000 !important;box-shadow:none !important;text-shadow:none !important}a,a:visited{text-decoration:underline}a[href]:after{content:" (" attr(href) ")"}abbr[title]:after{content:" (" attr(title) ")"}a[href^="#"]:after,a[href^="javascript:"]:after{content:""}pre,blockquote{border:1px solid #999;page-break-inside:avoid}thead{display:table-header-group}tr,img{page-break-inside:avoid}img{max-width:100% !important}p,h2,h3{orphans:3;widows:3}h2,h3{page-break-after:avoid}.navbar{display:none}.btn&gt;.caret,.dropup&gt;.btn&gt;.caret{border-top-color:#000 !important}.label{border:1px solid #000}.table,#tax table{border-collapse:collapse !important}.table td,#tax table td,.table th,#tax table th{background-color:#fff !important}.table-bordered th,.table-bordered td{border:1px solid #ddd !important}}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}*:before,*:after{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}html{font-size:10px;-webkit-tap-highlight-color:transparent}body{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:1.42857;color:#333;background-color:#eee}input,button,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}a{color:#337ab7;text-decoration:none}a:hover,a:focus{color:#23527c;text-decoration:underline}a:focus{outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}figure{margin:0}img{vertical-align:middle}.img-responsive{display:block;max-width:100%;height:auto}.img-rounded{border-radius:6px}.img-thumbnail{padding:4px;line-height:1.42857;background-color:#eee;border:1px solid #ddd;border-radius:4px;-webkit-transition:all 0.2s ease-in-out;-o-transition:all 0.2s ease-in-out;transition:all 0.2s ease-in-out;display:inline-block;max-width:100%;height:auto}.img-circle{border-radius:50%}hr{margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eee}.sr-only{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0}.sr-only-focusable:active,.sr-only-focusable:focus{position:static;width:auto;height:auto;margin:0;overflow:visible;clip:auto}[role="button"]{cursor:pointer}h1,h2,h3,h4,h5,h6,.h1,.h2,.h3,.h4,.h5,.h6{font-family:inherit;font-weight:500;line-height:1.1;color:inherit}h1 small,h1 .small,h1 dt,h1 #footer,h1 #tax table th,#tax table h1 th,h2 small,h2 .small,h2 dt,h2 #footer,h2 #tax table th,#tax table h2 th,h3 small,h3 .small,h3 dt,h3 #footer,h3 #tax table th,#tax table h3 th,h4 small,h4 .small,h4 dt,h4 #footer,h4 #tax table th,#tax table h4 th,h5 small,h5 .small,h5 dt,h5 #footer,h5 #tax table th,#tax table h5 th,h6 small,h6 .small,h6 dt,h6 #footer,h6 #tax table th,#tax table h6 th,.h1 small,.h1 .small,.h1 dt,.h1 #footer,.h1 #tax table th,#tax table .h1 th,.h2 small,.h2 .small,.h2 dt,.h2 #footer,.h2 #tax table th,#tax table .h2 th,.h3 small,.h3 .small,.h3 dt,.h3 #footer,.h3 #tax table th,#tax table .h3 th,.h4 small,.h4 .small,.h4 dt,.h4 #footer,.h4 #tax table th,#tax table .h4 th,.h5 small,.h5 .small,.h5 dt,.h5 #footer,.h5 #tax table th,#tax table .h5 th,.h6 small,.h6 .small,.h6 dt,.h6 #footer,.h6 #tax table th,#tax table .h6 th{font-weight:normal;line-height:1;color:#777}h1,.h1,h2,.h2,h3,.h3{margin-top:20px;margin-bottom:10px}h1 small,h1 .small,h1 dt,h1 #footer,h1 #tax table th,#tax table h1 th,.h1 small,.h1 .small,.h1 dt,.h1 #footer,.h1 #tax table th,#tax table .h1 th,h2 small,h2 .small,h2 dt,h2 #footer,h2 #tax table th,#tax table h2 th,.h2 small,.h2 .small,.h2 dt,.h2 #footer,.h2 #tax table th,#tax table .h2 th,h3 small,h3 .small,h3 dt,h3 #footer,h3 #tax table th,#tax table h3 th,.h3 small,.h3 .small,.h3 dt,.h3 #footer,.h3 #tax table th,#tax table .h3 th{font-size:65%}h4,.h4,h5,.h5,h6,.h6{margin-top:10px;margin-bottom:10px}h4 small,h4 .small,h4 dt,h4 #footer,h4 #tax table th,#tax table h4 th,.h4 small,.h4 .small,.h4 dt,.h4 #footer,.h4 #tax table th,#tax table .h4 th,h5 small,h5 .small,h5 dt,h5 #footer,h5 #tax table th,#tax table h5 th,.h5 small,.h5 .small,.h5 dt,.h5 #footer,.h5 #tax table th,#tax table .h5 th,h6 small,h6 .small,h6 dt,h6 #footer,h6 #tax table th,#tax table h6 th,.h6 small,.h6 .small,.h6 dt,.h6 #footer,.h6 #tax table th,#tax table .h6 th{font-size:75%}h1,.h1{font-size:36px}h2,.h2{font-size:30px}h3,.h3{font-size:24px}h4,.h4{font-size:18px}h5,.h5{font-size:14px}h6,.h6{font-size:12px}p{margin:0 0 10px}.lead{margin-bottom:20px;font-size:16px;font-weight:300;line-height:1.4}@media (min-width: 535px){.lead{font-size:21px}}small,.small,dt,#footer,#tax table th{font-size:85%}mark,.mark{background-color:#fcf8e3;padding:.2em}.text-left{text-align:left}.text-right,#totals dl dd{text-align:right}.text-center,.line .number{text-align:center}.text-justify{text-align:justify}.text-nowrap{white-space:nowrap}.text-lowercase{text-transform:lowercase}.text-uppercase,.initialism{text-transform:uppercase}.text-capitalize{text-transform:capitalize}.text-muted{color:#777}.text-primary{color:#337ab7}a.text-primary:hover,a.text-primary:focus{color:#286090}.text-success{color:#3c763d}a.text-success:hover,a.text-success:focus{color:#2b542c}.text-info{color:#31708f}a.text-info:hover,a.text-info:focus{color:#245269}.text-warning{color:#8a6d3b}a.text-warning:hover,a.text-warning:focus{color:#66512c}.text-danger{color:#a94442}a.text-danger:hover,a.text-danger:focus{color:#843534}.bg-primary{color:#fff}.bg-primary{background-color:#337ab7}a.bg-primary:hover,a.bg-primary:focus{background-color:#286090}.bg-success{background-color:#dff0d8}a.bg-success:hover,a.bg-success:focus{background-color:#c1e2b3}.bg-info{background-color:#d9edf7}a.bg-info:hover,a.bg-info:focus{background-color:#afd9ee}.bg-warning{background-color:#fcf8e3}a.bg-warning:hover,a.bg-warning:focus{background-color:#f7ecb5}.bg-danger{background-color:#f2dede}a.bg-danger:hover,a.bg-danger:focus{background-color:#e4b9b9}.page-header{padding-bottom:9px;margin:40px 0 20px;border-bottom:1px solid #eee}ul,ol{margin-top:0;margin-bottom:10px}ul ul,ul ol,ol ul,ol ol{margin-bottom:0}.list-unstyled{padding-left:0;list-style:none}.list-inline{padding-left:0;list-style:none;margin-left:-5px}.list-inline&gt;li{display:inline-block;padding-left:5px;padding-right:5px}dl{margin-top:0;margin-bottom:20px}dt,dd{line-height:1.42857}dt{font-weight:bold}dd{margin-left:0}.dl-horizontal dd:before,.dl-horizontal dd:after{content:" ";display:table}.dl-horizontal dd:after{clear:both}@media (min-width: 535px){.dl-horizontal dt{float:left;width:160px;clear:left;text-align:right;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.dl-horizontal dd{margin-left:180px}}abbr[title],abbr[data-original-title]{cursor:help;border-bottom:1px dotted #777}.initialism{font-size:90%}blockquote{padding:10px 20px;margin:0 0 20px;font-size:17.5px;border-left:5px solid #eee}blockquote p:last-child,blockquote ul:last-child,blockquote ol:last-child{margin-bottom:0}blockquote footer,blockquote small,blockquote .small,blockquote dt,blockquote #footer,blockquote #tax table th,#tax table blockquote th{display:block;font-size:80%;line-height:1.42857;color:#777}blockquote footer:before,blockquote small:before,blockquote .small:before,blockquote dt:before,blockquote #footer:before,blockquote #tax table th:before,#tax table blockquote th:before{content:'\2014 \00A0'}.blockquote-reverse,blockquote.pull-right{padding-right:15px;padding-left:0;border-right:5px solid #eee;border-left:0;text-align:right}.blockquote-reverse footer:before,.blockquote-reverse small:before,.blockquote-reverse .small:before,.blockquote-reverse dt:before,.blockquote-reverse #footer:before,.blockquote-reverse #tax table th:before,#tax table .blockquote-reverse th:before,blockquote.pull-right footer:before,blockquote.pull-right small:before,blockquote.pull-right .small:before,blockquote.pull-right dt:before,blockquote.pull-right #footer:before,blockquote.pull-right #tax table th:before,#tax table blockquote.pull-right th:before{content:''}.blockquote-reverse footer:after,.blockquote-reverse small:after,.blockquote-reverse .small:after,.blockquote-reverse dt:after,.blockquote-reverse #footer:after,.blockquote-reverse #tax table th:after,#tax table .blockquote-reverse th:after,blockquote.pull-right footer:after,blockquote.pull-right small:after,blockquote.pull-right .small:after,blockquote.pull-right dt:after,blockquote.pull-right #footer:after,blockquote.pull-right #tax table th:after,#tax table blockquote.pull-right th:after{content:'\00A0 \2014'}address{margin-bottom:20px;font-style:normal;line-height:1.42857}.container,#document{margin-right:auto;margin-left:auto;padding-left:15px;padding-right:15px}.container:before,#document:before,.container:after,#document:after{content:" ";display:table}.container:after,#document:after{clear:both}@media (min-width: 535px){.container,#document{width:750px}}@media (min-width: 992px){.container,#document{width:970px}}@media (min-width: 1200px){.container,#document{width:1170px}}.container-fluid{margin-right:auto;margin-left:auto;padding-left:15px;padding-right:15px}.container-fluid:before,.container-fluid:after{content:" ";display:table}.container-fluid:after{clear:both}.row,div.line,#parties dl,#metadata dl,#delivery dl,#payment dl,#totals dl,#tax dl,.line,.line .details dl,.line .info dl{margin-left:-15px;margin-right:-15px}.row:before,#parties dl:before,#metadata dl:before,#delivery dl:before,#payment dl:before,#totals dl:before,#tax dl:before,.line:before,.line .details dl:before,.line .info dl:before,.row:after,#parties dl:after,#metadata dl:after,#delivery dl:after,#payment dl:after,#totals dl:after,#tax dl:after,.line:after,.line .details dl:after,.line .info dl:after{content:" ";display:table}.row:after,#parties dl:after,#metadata dl:after,#delivery dl:after,#payment dl:after,#totals dl:after,#tax dl:after,.line:after,.line .details dl:after,.line .info dl:after{clear:both}.col-xs-1,.col-sm-1,.line .number,.col-md-1,.col-lg-1,.col-xs-2,.col-sm-2,.col-md-2,.col-lg-2,.col-xs-3,.col-sm-3,.col-md-3,.col-lg-3,.col-xs-4,.col-sm-4,#metadata dl dt,.col-md-4,.col-lg-4,.col-xs-5,#parties dl dt,#metadata dl dt,#delivery dl dt,#payment dl dt,#totals dl dt,#tax dl dt,.line .details dl dt,.line .info dl dt,.col-sm-5,.col-md-5,#metadata dl dt,.col-lg-5,.col-xs-6,.col-sm-6,.col-md-6,.col-lg-6,.col-xs-7,#parties dl dd,#metadata dl dd,#delivery dl dd,#payment dl dd,#totals dl dd,#tax dl dd,.line .details dl dd,.line .info dl dd,.col-sm-7,.col-md-7,#metadata dl dd,.col-lg-7,.col-xs-8,.col-sm-8,#metadata dl dd,.col-md-8,.col-lg-8,.col-xs-9,.col-sm-9,.col-md-9,.col-lg-9,.col-xs-10,.col-sm-10,.col-md-10,.col-lg-10,.col-xs-11,.col-sm-11,.col-md-11,.col-lg-11,.col-xs-12,.col-sm-12,.col-md-12,.col-lg-12{position:relative;min-height:1px;padding-left:15px;padding-right:15px}.col-xs-1,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,#parties dl dt,#metadata dl dt,#delivery dl dt,#payment dl dt,#totals dl dt,#tax dl dt,.line .details dl dt,.line .info dl dt,.col-xs-6,.col-xs-7,#parties dl dd,#metadata dl dd,#delivery dl dd,#payment dl dd,#totals dl dd,#tax dl dd,.line .details dl dd,.line .info dl dd,.col-xs-8,.col-xs-9,.col-xs-10,.col-xs-11,.col-xs-12{float:left}.col-xs-1{width:8.33333%}.col-xs-2{width:16.66667%}.col-xs-3{width:25%}.col-xs-4{width:33.33333%}.col-xs-5,#parties dl dt,#metadata dl dt,#delivery dl dt,#payment dl dt,#totals dl dt,#tax dl dt,.line .details dl dt,.line .info dl dt{width:41.66667%}.col-xs-6{width:50%}.col-xs-7,#parties dl dd,#metadata dl dd,#delivery dl dd,#payment dl dd,#totals dl dd,#tax dl dd,.line .details dl dd,.line .info dl dd{width:58.33333%}.col-xs-8{width:66.66667%}.col-xs-9{width:75%}.col-xs-10{width:83.33333%}.col-xs-11{width:91.66667%}.col-xs-12{width:100%}.col-xs-pull-0{right:auto}.col-xs-pull-1{right:8.33333%}.col-xs-pull-2{right:16.66667%}.col-xs-pull-3{right:25%}.col-xs-pull-4{right:33.33333%}.col-xs-pull-5{right:41.66667%}.col-xs-pull-6{right:50%}.col-xs-pull-7{right:58.33333%}.col-xs-pull-8{right:66.66667%}.col-xs-pull-9{right:75%}.col-xs-pull-10{right:83.33333%}.col-xs-pull-11{right:91.66667%}.col-xs-pull-12{right:100%}.col-xs-push-0{left:auto}.col-xs-push-1{left:8.33333%}.col-xs-push-2{left:16.66667%}.col-xs-push-3{left:25%}.col-xs-push-4{left:33.33333%}.col-xs-push-5{left:41.66667%}.col-xs-push-6{left:50%}.col-xs-push-7{left:58.33333%}.col-xs-push-8{left:66.66667%}.col-xs-push-9{left:75%}.col-xs-push-10{left:83.33333%}.col-xs-push-11{left:91.66667%}.col-xs-push-12{left:100%}.col-xs-offset-0{margin-left:0%}.col-xs-offset-1{margin-left:8.33333%}.col-xs-offset-2{margin-left:16.66667%}.col-xs-offset-3{margin-left:25%}.col-xs-offset-4{margin-left:33.33333%}.col-xs-offset-5{margin-left:41.66667%}.col-xs-offset-6{margin-left:50%}.col-xs-offset-7{margin-left:58.33333%}.col-xs-offset-8{margin-left:66.66667%}.col-xs-offset-9{margin-left:75%}.col-xs-offset-10{margin-left:83.33333%}.col-xs-offset-11{margin-left:91.66667%}.col-xs-offset-12{margin-left:100%}@media (min-width: 535px){.col-sm-1,.line .number,.col-sm-2,.col-sm-3,.col-sm-4,#metadata dl dt,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,#metadata dl dd,.col-sm-9,.col-sm-10,.col-sm-11,.col-sm-12{float:left}.col-sm-1,.line .number{width:8.33333%}.col-sm-2{width:16.66667%}.col-sm-3{width:25%}.col-sm-4,#metadata dl dt{width:33.33333%}.col-sm-5{width:41.66667%}.col-sm-6{width:50%}.col-sm-7{width:58.33333%}.col-sm-8,#metadata dl dd{width:66.66667%}.col-sm-9{width:75%}.col-sm-10{width:83.33333%}.col-sm-11{width:91.66667%}.col-sm-12{width:100%}.col-sm-pull-0{right:auto}.col-sm-pull-1{right:8.33333%}.col-sm-pull-2{right:16.66667%}.col-sm-pull-3{right:25%}.col-sm-pull-4{right:33.33333%}.col-sm-pull-5{right:41.66667%}.col-sm-pull-6{right:50%}.col-sm-pull-7{right:58.33333%}.col-sm-pull-8{right:66.66667%}.col-sm-pull-9{right:75%}.col-sm-pull-10{right:83.33333%}.col-sm-pull-11{right:91.66667%}.col-sm-pull-12{right:100%}.col-sm-push-0{left:auto}.col-sm-push-1{left:8.33333%}.col-sm-push-2{left:16.66667%}.col-sm-push-3{left:25%}.col-sm-push-4{left:33.33333%}.col-sm-push-5{left:41.66667%}.col-sm-push-6{left:50%}.col-sm-push-7{left:58.33333%}.col-sm-push-8{left:66.66667%}.col-sm-push-9{left:75%}.col-sm-push-10{left:83.33333%}.col-sm-push-11{left:91.66667%}.col-sm-push-12{left:100%}.col-sm-offset-0{margin-left:0%}.col-sm-offset-1{margin-left:8.33333%}.col-sm-offset-2{margin-left:16.66667%}.col-sm-offset-3{margin-left:25%}.col-sm-offset-4{margin-left:33.33333%}.col-sm-offset-5{margin-left:41.66667%}.col-sm-offset-6{margin-left:50%}.col-sm-offset-7{margin-left:58.33333%}.col-sm-offset-8{margin-left:66.66667%}.col-sm-offset-9{margin-left:75%}.col-sm-offset-10{margin-left:83.33333%}.col-sm-offset-11{margin-left:91.66667%}.col-sm-offset-12{margin-left:100%}}@media (min-width: 992px){.col-md-1,.col-md-2,.col-md-3,.col-md-4,.col-md-5,#metadata dl dt,.col-md-6,.col-md-7,#metadata dl dd,.col-md-8,.col-md-9,.col-md-10,.col-md-11,.col-md-12{float:left}.col-md-1{width:8.33333%}.col-md-2{width:16.66667%}.col-md-3{width:25%}.col-md-4{width:33.33333%}.col-md-5,#metadata dl dt{width:41.66667%}.col-md-6{width:50%}.col-md-7,#metadata dl dd{width:58.33333%}.col-md-8{width:66.66667%}.col-md-9{width:75%}.col-md-10{width:83.33333%}.col-md-11{width:91.66667%}.col-md-12{width:100%}.col-md-pull-0{right:auto}.col-md-pull-1{right:8.33333%}.col-md-pull-2{right:16.66667%}.col-md-pull-3{right:25%}.col-md-pull-4{right:33.33333%}.col-md-pull-5{right:41.66667%}.col-md-pull-6{right:50%}.col-md-pull-7{right:58.33333%}.col-md-pull-8{right:66.66667%}.col-md-pull-9{right:75%}.col-md-pull-10{right:83.33333%}.col-md-pull-11{right:91.66667%}.col-md-pull-12{right:100%}.col-md-push-0{left:auto}.col-md-push-1{left:8.33333%}.col-md-push-2{left:16.66667%}.col-md-push-3{left:25%}.col-md-push-4{left:33.33333%}.col-md-push-5{left:41.66667%}.col-md-push-6{left:50%}.col-md-push-7{left:58.33333%}.col-md-push-8{left:66.66667%}.col-md-push-9{left:75%}.col-md-push-10{left:83.33333%}.col-md-push-11{left:91.66667%}.col-md-push-12{left:100%}.col-md-offset-0{margin-left:0%}.col-md-offset-1{margin-left:8.33333%}.col-md-offset-2{margin-left:16.66667%}.col-md-offset-3{margin-left:25%}.col-md-offset-4{margin-left:33.33333%}.col-md-offset-5{margin-left:41.66667%}.col-md-offset-6{margin-left:50%}.col-md-offset-7{margin-left:58.33333%}.col-md-offset-8{margin-left:66.66667%}.col-md-offset-9{margin-left:75%}.col-md-offset-10{margin-left:83.33333%}.col-md-offset-11{margin-left:91.66667%}.col-md-offset-12{margin-left:100%}}@media (min-width: 1200px){.col-lg-1,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9,.col-lg-10,.col-lg-11,.col-lg-12{float:left}.col-lg-1{width:8.33333%}.col-lg-2{width:16.66667%}.col-lg-3{width:25%}.col-lg-4{width:33.33333%}.col-lg-5{width:41.66667%}.col-lg-6{width:50%}.col-lg-7{width:58.33333%}.col-lg-8{width:66.66667%}.col-lg-9{width:75%}.col-lg-10{width:83.33333%}.col-lg-11{width:91.66667%}.col-lg-12{width:100%}.col-lg-pull-0{right:auto}.col-lg-pull-1{right:8.33333%}.col-lg-pull-2{right:16.66667%}.col-lg-pull-3{right:25%}.col-lg-pull-4{right:33.33333%}.col-lg-pull-5{right:41.66667%}.col-lg-pull-6{right:50%}.col-lg-pull-7{right:58.33333%}.col-lg-pull-8{right:66.66667%}.col-lg-pull-9{right:75%}.col-lg-pull-10{right:83.33333%}.col-lg-pull-11{right:91.66667%}.col-lg-pull-12{right:100%}.col-lg-push-0{left:auto}.col-lg-push-1{left:8.33333%}.col-lg-push-2{left:16.66667%}.col-lg-push-3{left:25%}.col-lg-push-4{left:33.33333%}.col-lg-push-5{left:41.66667%}.col-lg-push-6{left:50%}.col-lg-push-7{left:58.33333%}.col-lg-push-8{left:66.66667%}.col-lg-push-9{left:75%}.col-lg-push-10{left:83.33333%}.col-lg-push-11{left:91.66667%}.col-lg-push-12{left:100%}.col-lg-offset-0{margin-left:0%}.col-lg-offset-1{margin-left:8.33333%}.col-lg-offset-2{margin-left:16.66667%}.col-lg-offset-3{margin-left:25%}.col-lg-offset-4{margin-left:33.33333%}.col-lg-offset-5{margin-left:41.66667%}.col-lg-offset-6{margin-left:50%}.col-lg-offset-7{margin-left:58.33333%}.col-lg-offset-8{margin-left:66.66667%}.col-lg-offset-9{margin-left:75%}.col-lg-offset-10{margin-left:83.33333%}.col-lg-offset-11{margin-left:91.66667%}.col-lg-offset-12{margin-left:100%}}table{background-color:transparent}caption{padding-top:8px;padding-bottom:8px;color:#777;text-align:left}th{text-align:left}.table,#tax table{width:100%;max-width:100%;margin-bottom:20px}.table&gt;thead&gt;tr&gt;th,#tax table&gt;thead&gt;tr&gt;th,.table&gt;thead&gt;tr&gt;td,#tax table&gt;thead&gt;tr&gt;td,.table&gt;tbody&gt;tr&gt;th,#tax table&gt;tbody&gt;tr&gt;th,.table&gt;tbody&gt;tr&gt;td,#tax table&gt;tbody&gt;tr&gt;td,.table&gt;tfoot&gt;tr&gt;th,#tax table&gt;tfoot&gt;tr&gt;th,.table&gt;tfoot&gt;tr&gt;td,#tax table&gt;tfoot&gt;tr&gt;td{padding:8px;line-height:1.42857;vertical-align:top;border-top:1px solid #ddd}.table&gt;thead&gt;tr&gt;th,#tax table&gt;thead&gt;tr&gt;th{vertical-align:bottom;border-bottom:2px solid #ddd}.table&gt;caption+thead&gt;tr:first-child&gt;th,#tax table&gt;caption+thead&gt;tr:first-child&gt;th,.table&gt;caption+thead&gt;tr:first-child&gt;td,#tax table&gt;caption+thead&gt;tr:first-child&gt;td,.table&gt;colgroup+thead&gt;tr:first-child&gt;th,#tax table&gt;colgroup+thead&gt;tr:first-child&gt;th,.table&gt;colgroup+thead&gt;tr:first-child&gt;td,#tax table&gt;colgroup+thead&gt;tr:first-child&gt;td,.table&gt;thead:first-child&gt;tr:first-child&gt;th,#tax table&gt;thead:first-child&gt;tr:first-child&gt;th,.table&gt;thead:first-child&gt;tr:first-child&gt;td,#tax table&gt;thead:first-child&gt;tr:first-child&gt;td{border-top:0}.table&gt;tbody+tbody,#tax table&gt;tbody+tbody{border-top:2px solid #ddd}.table .table,#tax table .table,.table #tax table,#tax .table table,#tax table table{background-color:#eee}.table-condensed&gt;thead&gt;tr&gt;th,#tax table&gt;thead&gt;tr&gt;th,.table-condensed&gt;thead&gt;tr&gt;td,#tax table&gt;thead&gt;tr&gt;td,.table-condensed&gt;tbody&gt;tr&gt;th,#tax table&gt;tbody&gt;tr&gt;th,.table-condensed&gt;tbody&gt;tr&gt;td,#tax table&gt;tbody&gt;tr&gt;td,.table-condensed&gt;tfoot&gt;tr&gt;th,#tax table&gt;tfoot&gt;tr&gt;th,.table-condensed&gt;tfoot&gt;tr&gt;td,#tax table&gt;tfoot&gt;tr&gt;td{padding:5px}.table-bordered{border:1px solid #ddd}.table-bordered&gt;thead&gt;tr&gt;th,.table-bordered&gt;thead&gt;tr&gt;td,.table-bordered&gt;tbody&gt;tr&gt;th,.table-bordered&gt;tbody&gt;tr&gt;td,.table-bordered&gt;tfoot&gt;tr&gt;th,.table-bordered&gt;tfoot&gt;tr&gt;td{border:1px solid #ddd}.table-bordered&gt;thead&gt;tr&gt;th,.table-bordered&gt;thead&gt;tr&gt;td{border-bottom-width:2px}.table-striped&gt;tbody&gt;tr:nth-of-type(odd),#tax table&gt;tbody&gt;tr:nth-of-type(odd){background-color:#f9f9f9}.table-hover&gt;tbody&gt;tr:hover{background-color:#f5f5f5}table col[class*="col-"]{position:static;float:none;display:table-column}table td[class*="col-"],table th[class*="col-"]{position:static;float:none;display:table-cell}.table&gt;thead&gt;tr&gt;td.active,#tax table&gt;thead&gt;tr&gt;td.active,.table&gt;thead&gt;tr&gt;th.active,#tax table&gt;thead&gt;tr&gt;th.active,.table&gt;thead&gt;tr.active&gt;td,#tax table&gt;thead&gt;tr.active&gt;td,.table&gt;thead&gt;tr.active&gt;th,#tax table&gt;thead&gt;tr.active&gt;th,.table&gt;tbody&gt;tr&gt;td.active,#tax table&gt;tbody&gt;tr&gt;td.active,.table&gt;tbody&gt;tr&gt;th.active,#tax table&gt;tbody&gt;tr&gt;th.active,.table&gt;tbody&gt;tr.active&gt;td,#tax table&gt;tbody&gt;tr.active&gt;td,.table&gt;tbody&gt;tr.active&gt;th,#tax table&gt;tbody&gt;tr.active&gt;th,.table&gt;tfoot&gt;tr&gt;td.active,#tax table&gt;tfoot&gt;tr&gt;td.active,.table&gt;tfoot&gt;tr&gt;th.active,#tax table&gt;tfoot&gt;tr&gt;th.active,.table&gt;tfoot&gt;tr.active&gt;td,#tax table&gt;tfoot&gt;tr.active&gt;td,.table&gt;tfoot&gt;tr.active&gt;th,#tax table&gt;tfoot&gt;tr.active&gt;th{background-color:#f5f5f5}.table-hover&gt;tbody&gt;tr&gt;td.active:hover,.table-hover&gt;tbody&gt;tr&gt;th.active:hover,.table-hover&gt;tbody&gt;tr.active:hover&gt;td,.table-hover&gt;tbody&gt;tr:hover&gt;.active,.table-hover&gt;tbody&gt;tr.active:hover&gt;th{background-color:#e8e8e8}.table&gt;thead&gt;tr&gt;td.success,#tax table&gt;thead&gt;tr&gt;td.success,.table&gt;thead&gt;tr&gt;th.success,#tax table&gt;thead&gt;tr&gt;th.success,.table&gt;thead&gt;tr.success&gt;td,#tax table&gt;thead&gt;tr.success&gt;td,.table&gt;thead&gt;tr.success&gt;th,#tax table&gt;thead&gt;tr.success&gt;th,.table&gt;tbody&gt;tr&gt;td.success,#tax table&gt;tbody&gt;tr&gt;td.success,.table&gt;tbody&gt;tr&gt;th.success,#tax table&gt;tbody&gt;tr&gt;th.success,.table&gt;tbody&gt;tr.success&gt;td,#tax table&gt;tbody&gt;tr.success&gt;td,.table&gt;tbody&gt;tr.success&gt;th,#tax table&gt;tbody&gt;tr.success&gt;th,.table&gt;tfoot&gt;tr&gt;td.success,#tax table&gt;tfoot&gt;tr&gt;td.success,.table&gt;tfoot&gt;tr&gt;th.success,#tax table&gt;tfoot&gt;tr&gt;th.success,.table&gt;tfoot&gt;tr.success&gt;td,#tax table&gt;tfoot&gt;tr.success&gt;td,.table&gt;tfoot&gt;tr.success&gt;th,#tax table&gt;tfoot&gt;tr.success&gt;th{background-color:#dff0d8}.table-hover&gt;tbody&gt;tr&gt;td.success:hover,.table-hover&gt;tbody&gt;tr&gt;th.success:hover,.table-hover&gt;tbody&gt;tr.success:hover&gt;td,.table-hover&gt;tbody&gt;tr:hover&gt;.success,.table-hover&gt;tbody&gt;tr.success:hover&gt;th{background-color:#d0e9c6}.table&gt;thead&gt;tr&gt;td.info,#tax table&gt;thead&gt;tr&gt;td.info,.table&gt;thead&gt;tr&gt;th.info,#tax table&gt;thead&gt;tr&gt;th.info,.table&gt;thead&gt;tr.info&gt;td,#tax table&gt;thead&gt;tr.info&gt;td,.table&gt;thead&gt;tr.info&gt;th,#tax table&gt;thead&gt;tr.info&gt;th,.table&gt;tbody&gt;tr&gt;td.info,#tax table&gt;tbody&gt;tr&gt;td.info,.table&gt;tbody&gt;tr&gt;th.info,#tax table&gt;tbody&gt;tr&gt;th.info,.table&gt;tbody&gt;tr.info&gt;td,#tax table&gt;tbody&gt;tr.info&gt;td,.table&gt;tbody&gt;tr.info&gt;th,#tax table&gt;tbody&gt;tr.info&gt;th,.table&gt;tfoot&gt;tr&gt;td.info,#tax table&gt;tfoot&gt;tr&gt;td.info,.table&gt;tfoot&gt;tr&gt;th.info,#tax table&gt;tfoot&gt;tr&gt;th.info,.table&gt;tfoot&gt;tr.info&gt;td,#tax table&gt;tfoot&gt;tr.info&gt;td,.table&gt;tfoot&gt;tr.info&gt;th,#tax table&gt;tfoot&gt;tr.info&gt;th{background-color:#d9edf7}.table-hover&gt;tbody&gt;tr&gt;td.info:hover,.table-hover&gt;tbody&gt;tr&gt;th.info:hover,.table-hover&gt;tbody&gt;tr.info:hover&gt;td,.table-hover&gt;tbody&gt;tr:hover&gt;.info,.table-hover&gt;tbody&gt;tr.info:hover&gt;th{background-color:#c4e3f3}.table&gt;thead&gt;tr&gt;td.warning,#tax table&gt;thead&gt;tr&gt;td.warning,.table&gt;thead&gt;tr&gt;th.warning,#tax table&gt;thead&gt;tr&gt;th.warning,.table&gt;thead&gt;tr.warning&gt;td,#tax table&gt;thead&gt;tr.warning&gt;td,.table&gt;thead&gt;tr.warning&gt;th,#tax table&gt;thead&gt;tr.warning&gt;th,.table&gt;tbody&gt;tr&gt;td.warning,#tax table&gt;tbody&gt;tr&gt;td.warning,.table&gt;tbody&gt;tr&gt;th.warning,#tax table&gt;tbody&gt;tr&gt;th.warning,.table&gt;tbody&gt;tr.warning&gt;td,#tax table&gt;tbody&gt;tr.warning&gt;td,.table&gt;tbody&gt;tr.warning&gt;th,#tax table&gt;tbody&gt;tr.warning&gt;th,.table&gt;tfoot&gt;tr&gt;td.warning,#tax table&gt;tfoot&gt;tr&gt;td.warning,.table&gt;tfoot&gt;tr&gt;th.warning,#tax table&gt;tfoot&gt;tr&gt;th.warning,.table&gt;tfoot&gt;tr.warning&gt;td,#tax table&gt;tfoot&gt;tr.warning&gt;td,.table&gt;tfoot&gt;tr.warning&gt;th,#tax table&gt;tfoot&gt;tr.warning&gt;th{background-color:#fcf8e3}.table-hover&gt;tbody&gt;tr&gt;td.warning:hover,.table-hover&gt;tbody&gt;tr&gt;th.warning:hover,.table-hover&gt;tbody&gt;tr.warning:hover&gt;td,.table-hover&gt;tbody&gt;tr:hover&gt;.warning,.table-hover&gt;tbody&gt;tr.warning:hover&gt;th{background-color:#faf2cc}.table&gt;thead&gt;tr&gt;td.danger,#tax table&gt;thead&gt;tr&gt;td.danger,.table&gt;thead&gt;tr&gt;th.danger,#tax table&gt;thead&gt;tr&gt;th.danger,.table&gt;thead&gt;tr.danger&gt;td,#tax table&gt;thead&gt;tr.danger&gt;td,.table&gt;thead&gt;tr.danger&gt;th,#tax table&gt;thead&gt;tr.danger&gt;th,.table&gt;tbody&gt;tr&gt;td.danger,#tax table&gt;tbody&gt;tr&gt;td.danger,.table&gt;tbody&gt;tr&gt;th.danger,#tax table&gt;tbody&gt;tr&gt;th.danger,.table&gt;tbody&gt;tr.danger&gt;td,#tax table&gt;tbody&gt;tr.danger&gt;td,.table&gt;tbody&gt;tr.danger&gt;th,#tax table&gt;tbody&gt;tr.danger&gt;th,.table&gt;tfoot&gt;tr&gt;td.danger,#tax table&gt;tfoot&gt;tr&gt;td.danger,.table&gt;tfoot&gt;tr&gt;th.danger,#tax table&gt;tfoot&gt;tr&gt;th.danger,.table&gt;tfoot&gt;tr.danger&gt;td,#tax table&gt;tfoot&gt;tr.danger&gt;td,.table&gt;tfoot&gt;tr.danger&gt;th,#tax table&gt;tfoot&gt;tr.danger&gt;th{background-color:#f2dede}.table-hover&gt;tbody&gt;tr&gt;td.danger:hover,.table-hover&gt;tbody&gt;tr&gt;th.danger:hover,.table-hover&gt;tbody&gt;tr.danger:hover&gt;td,.table-hover&gt;tbody&gt;tr:hover&gt;.danger,.table-hover&gt;tbody&gt;tr.danger:hover&gt;th{background-color:#ebcccc}.table-responsive{overflow-x:auto;min-height:0.01%}@media screen and (max-width: 534px){.table-responsive{width:100%;margin-bottom:15px;overflow-y:hidden;-ms-overflow-style:-ms-autohiding-scrollbar;border:1px solid #ddd}.table-responsive&gt;.table,#tax .table-responsive&gt;table{margin-bottom:0}.table-responsive&gt;.table&gt;thead&gt;tr&gt;th,#tax .table-responsive&gt;table&gt;thead&gt;tr&gt;th,.table-responsive&gt;.table&gt;thead&gt;tr&gt;td,#tax .table-responsive&gt;table&gt;thead&gt;tr&gt;td,.table-responsive&gt;.table&gt;tbody&gt;tr&gt;th,#tax .table-responsive&gt;table&gt;tbody&gt;tr&gt;th,.table-responsive&gt;.table&gt;tbody&gt;tr&gt;td,#tax .table-responsive&gt;table&gt;tbody&gt;tr&gt;td,.table-responsive&gt;.table&gt;tfoot&gt;tr&gt;th,#tax .table-responsive&gt;table&gt;tfoot&gt;tr&gt;th,.table-responsive&gt;.table&gt;tfoot&gt;tr&gt;td,#tax .table-responsive&gt;table&gt;tfoot&gt;tr&gt;td{white-space:nowrap}.table-responsive&gt;.table-bordered{border:0}.table-responsive&gt;.table-bordered&gt;thead&gt;tr&gt;th:first-child,.table-responsive&gt;.table-bordered&gt;thead&gt;tr&gt;td:first-child,.table-responsive&gt;.table-bordered&gt;tbody&gt;tr&gt;th:first-child,.table-responsive&gt;.table-bordered&gt;tbody&gt;tr&gt;td:first-child,.table-responsive&gt;.table-bordered&gt;tfoot&gt;tr&gt;th:first-child,.table-responsive&gt;.table-bordered&gt;tfoot&gt;tr&gt;td:first-child{border-left:0}.table-responsive&gt;.table-bordered&gt;thead&gt;tr&gt;th:last-child,.table-responsive&gt;.table-bordered&gt;thead&gt;tr&gt;td:last-child,.table-responsive&gt;.table-bordered&gt;tbody&gt;tr&gt;th:last-child,.table-responsive&gt;.table-bordered&gt;tbody&gt;tr&gt;td:last-child,.table-responsive&gt;.table-bordered&gt;tfoot&gt;tr&gt;th:last-child,.table-responsive&gt;.table-bordered&gt;tfoot&gt;tr&gt;td:last-child{border-right:0}.table-responsive&gt;.table-bordered&gt;tbody&gt;tr:last-child&gt;th,.table-responsive&gt;.table-bordered&gt;tbody&gt;tr:last-child&gt;td,.table-responsive&gt;.table-bordered&gt;tfoot&gt;tr:last-child&gt;th,.table-responsive&gt;.table-bordered&gt;tfoot&gt;tr:last-child&gt;td{border-bottom:0}}.label{display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:bold;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em}.label:empty{display:none}.btn .label{position:relative;top:-1px}a.label:hover,a.label:focus{color:#fff;text-decoration:none;cursor:pointer}.label-default{background-color:#777}.label-default[href]:hover,.label-default[href]:focus{background-color:#5e5e5e}.label-primary{background-color:#337ab7}.label-primary[href]:hover,.label-primary[href]:focus{background-color:#286090}.label-success{background-color:#5cb85c}.label-success[href]:hover,.label-success[href]:focus{background-color:#449d44}.label-info{background-color:#5bc0de}.label-info[href]:hover,.label-info[href]:focus{background-color:#31b0d5}.label-warning{background-color:#f0ad4e}.label-warning[href]:hover,.label-warning[href]:focus{background-color:#ec971f}.label-danger{background-color:#d9534f}.label-danger[href]:hover,.label-danger[href]:focus{background-color:#c9302c}.badge{display:inline-block;min-width:10px;padding:3px 7px;font-size:12px;font-weight:bold;color:#fff;line-height:1;vertical-align:middle;white-space:nowrap;text-align:center;background-color:#777;border-radius:10px}.badge:empty{display:none}.btn .badge{position:relative;top:-1px}.btn-xs .badge,.btn-group-xs&gt;.btn .badge{top:0;padding:1px 5px}.list-group-item.active&gt;.badge,.nav-pills&gt;.active&gt;a&gt;.badge{color:#337ab7;background-color:#fff}.list-group-item&gt;.badge{float:right}.list-group-item&gt;.badge+.badge{margin-right:5px}.nav-pills&gt;li&gt;a&gt;.badge{margin-left:3px}a.badge:hover,a.badge:focus{color:#fff;text-decoration:none;cursor:pointer}.clearfix:before,.clearfix:after{content:" ";display:table}.clearfix:after{clear:both}.center-block{display:block;margin-left:auto;margin-right:auto}.pull-right{float:right !important}.pull-left{float:left !important}.hide{display:none !important}.show{display:block !important}.invisible{visibility:hidden}.text-hide{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.hidden{display:none !important}.affix{position:fixed}@-ms-viewport{width:device-width}.visible-xs{display:none !important}.visible-sm{display:none !important}.visible-md{display:none !important}.visible-lg{display:none !important}.visible-xs-block,.visible-xs-inline,.visible-xs-inline-block,.visible-sm-block,.visible-sm-inline,.visible-sm-inline-block,.visible-md-block,.visible-md-inline,.visible-md-inline-block,.visible-lg-block,.visible-lg-inline,.visible-lg-inline-block{display:none !important}@media (max-width: 534px){.visible-xs{display:block !important}table.visible-xs{display:table !important}tr.visible-xs{display:table-row !important}th.visible-xs,td.visible-xs{display:table-cell !important}}@media (max-width: 534px){.visible-xs-block{display:block !important}}@media (max-width: 534px){.visible-xs-inline{display:inline !important}}@media (max-width: 534px){.visible-xs-inline-block{display:inline-block !important}}@media (min-width: 535px) and (max-width: 991px){.visible-sm{display:block !important}table.visible-sm{display:table !important}tr.visible-sm{display:table-row !important}th.visible-sm,td.visible-sm{display:table-cell !important}}@media (min-width: 535px) and (max-width: 991px){.visible-sm-block{display:block !important}}@media (min-width: 535px) and (max-width: 991px){.visible-sm-inline{display:inline !important}}@media (min-width: 535px) and (max-width: 991px){.visible-sm-inline-block{display:inline-block !important}}@media (min-width: 992px) and (max-width: 1199px){.visible-md{display:block !important}table.visible-md{display:table !important}tr.visible-md{display:table-row !important}th.visible-md,td.visible-md{display:table-cell !important}}@media (min-width: 992px) and (max-width: 1199px){.visible-md-block{display:block !important}}@media (min-width: 992px) and (max-width: 1199px){.visible-md-inline{display:inline !important}}@media (min-width: 992px) and (max-width: 1199px){.visible-md-inline-block{display:inline-block !important}}@media (min-width: 1200px){.visible-lg{display:block !important}table.visible-lg{display:table !important}tr.visible-lg{display:table-row !important}th.visible-lg,td.visible-lg{display:table-cell !important}}@media (min-width: 1200px){.visible-lg-block{display:block !important}}@media (min-width: 1200px){.visible-lg-inline{display:inline !important}}@media (min-width: 1200px){.visible-lg-inline-block{display:inline-block !important}}@media (max-width: 534px){.hidden-xs{display:none !important}}@media (min-width: 535px) and (max-width: 991px){.hidden-sm{display:none !important}}@media (min-width: 992px) and (max-width: 1199px){.hidden-md{display:none !important}}@media (min-width: 1200px){.hidden-lg{display:none !important}}.visible-print{display:none !important}@media print{.visible-print{display:block !important}table.visible-print{display:table !important}tr.visible-print{display:table-row !important}th.visible-print,td.visible-print{display:table-cell !important}}.visible-print-block{display:none !important}@media print{.visible-print-block{display:block !important}}.visible-print-inline{display:none !important}@media print{.visible-print-inline{display:inline !important}}.visible-print-inline-block{display:none !important}@media print{.visible-print-inline-block{display:inline-block !important}}@media print{.hidden-print{display:none !important}}#document{background-color:#fff;border-left:1px solid #ccc;border-right:1px solid #ccc}@media print{#document{width:100%;padding:0;border:0}}hr{display:none;margin:5pt 0}div.row,div.line{clear:both;page-break-inside:avoid}div.line{margin-bottom:5pt}dt{padding-top:2pt;clear:both;margin-bottom:3pt}dd{margin-bottom:3pt}div.linesupport{background-color:#eee !important;padding:4pt 5pt 2pt;margin:2pt 0}@media print{div.linesupport{background-color:#eee !important;-webkit-print-color-adjust:exact}}div.linetotal{border-bottom:1px solid #999;border-top:1px solid #f0f0f0;padding:4pt 0 2pt;margin:5pt 0 10pt}div.total{border-bottom:2px solid #999;font-weight:bold;padding:4pt 0 2pt;margin:-5pt 0 15pt}p.note{font-style:italic}#footer{margin:20pt 0 5pt}@media print{#footer{display:none}}@media print{a[href]:after{content:"" !important}}h3{border-bottom:1px solid #ccc}#logo{max-height:60pt;max-width:250pt;float:right;margin-bottom:10pt;margin-top:10pt}@media (max-width: 535px){#logo{max-height:35pt;max-width:125pt;margin-right:5pt;margin-bottom:10pt}}#attachments ul{padding-left:0}#attachments ul li{list-style-type:none;margin-bottom:5pt}#totals dl dd{margin-bottom:10pt}.line .details dl,.line .info dl{margin-bottom:10pt}span.mtr{color:#c9302c}</style>
			</xsl:when>
			<xsl:otherwise>
				<link rel="stylesheet" href="{$stylesheet_url}" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="doc-footer">
		<div id="footer">
			<div>Document: <xsl:value-of select="namespace-uri()" />::<xsl:value-of select="local-name()" />
			</div>
			<div>Customization: <xsl:value-of select="cbc:CustomizationID" />
			</div>
			<div>Profile: <xsl:value-of select="cbc:ProfileID" />
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cn:CreditNote[starts-with(normalize-space(cbc:CustomizationID/text()), 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:billing:3.0')]" mode="document" priority="1000">
		<html lang="{$language}">
			<head>
				<xsl:call-template name="doc-head" />
				<title>
					<xsl:value-of select="u:label('document', local-name())" />
				</title>
			</head>
			<body>
				<div id="document">
					<h1>
						<xsl:copy-of select="u:label('document', local-name())" />
						<br />
						<small>
							<xsl:value-of select="u:codelist('uncl1001-cn', cbc:CreditNoteTypeCode/text())" />
						</small>
					</h1>
					<div class="row">
						<div id="parties" class="col-sm-6 col-md-7">
							<h3>
								<xsl:copy-of select="u:label('party', 'Supplier')" />
							</h3>
							<xsl:apply-templates select="cac:AccountingSupplierParty/cac:Party" mode="party-with-contact" />
							<h3>
								<xsl:copy-of select="u:label('party', 'Customer')" />
							</h3>
							<xsl:apply-templates select="cac:AccountingCustomerParty/cac:Party" mode="party-with-contact" />
						</div>
						<div id="metadata" class="col-sm-6 col-md-5">
							<xsl:call-template name="metadata" />
							<xsl:apply-templates select="cbc:Note" mode="common" />
						</div>
					</div>
					<div class="row">
						<div id="totals" class="col-sm-4">
							<xsl:apply-templates select="cac:LegalMonetaryTotal" mode="total" />
						</div>
						<div id="delivery" class="col-sm-4">
							<xsl:call-template name="delivery-block" />
						</div>
						<div id="attachments" class="col-sm-4">
							<xsl:call-template name="attachments-block" />
						</div>
					</div>
					<div class="row">
						<div id="tax" class="col-sm-6">
							<h3>
								<xsl:copy-of select="u:label('tax', 'Tax')" />
							</h3>
							<xsl:apply-templates select="cac:TaxTotal[cac:TaxSubtotal]" mode="tax" />
							<xsl:apply-templates select="cac:TaxRepresentativeParty" mode="party" />
						</div>
						<div id="payment" class="col-sm-6">
							<h3>
								<xsl:copy-of select="u:label('payment', 'Payment')" />
							</h3>
							<xsl:apply-templates select="cac:PaymentMeans" mode="payment" />
							<xsl:apply-templates select="cac:PayeeParty" mode="party" />
							<xsl:apply-templates select="cac:PaymentTerms" mode="payment" />
						</div>
					</div>
					<hr />
					<div id="details">
						<h3>Details</h3>
						<xsl:apply-templates select="cac:AllowanceCharge[cbc:ChargeIndicator='true']" mode="line" />
						<xsl:apply-templates select="cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" mode="line" />
						<xsl:apply-templates select="cac:AllowanceCharge[cbc:ChargeIndicator='false']" mode="line" />
						<xsl:apply-templates select="cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount" mode="line" />
						<xsl:apply-templates select="cac:CreditNoteLine" mode="line" />
						<xsl:apply-templates select="cac:LegalMonetaryTotal/cbc:LineExtensionAmount" mode="line" />
					</div>
					<xsl:call-template name="doc-footer" />
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="in:Invoice[starts-with(normalize-space(cbc:CustomizationID/text()), 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:billing:3.0')]" mode="document" priority="1000">
		<html lang="{$language}">
			<head>
				<xsl:call-template name="doc-head" />
				<title>
					<xsl:value-of select="u:label('document', local-name())" />
				</title>
			</head>
			<body>
				<div id="document">
					<h1>
						<xsl:copy-of select="u:label('document', local-name())" />
						<br />
						<small>
							<xsl:value-of select="u:codelist('uncl1001invoice', cbc:InvoiceTypeCode/text())" />
						</small>
					</h1>
					<div class="row">
						<div id="parties" class="col-sm-6 col-md-7">
							<h3>
								<xsl:copy-of select="u:label('party', 'Supplier')" />
							</h3>
							<xsl:apply-templates select="cac:AccountingSupplierParty/cac:Party" mode="party-with-contact" />
							<h3>
								<xsl:copy-of select="u:label('party', 'Customer')" />
							</h3>
							<xsl:apply-templates select="cac:AccountingCustomerParty/cac:Party" mode="party-with-contact" />
						</div>
						<div id="metadata" class="col-sm-6 col-md-5">
							<xsl:call-template name="metadata" />
							<xsl:apply-templates select="cbc:Note" mode="common" />
						</div>
					</div>
					<div class="row">
						<div id="totals" class="col-sm-4">
							<xsl:apply-templates select="cac:LegalMonetaryTotal" mode="total" />
						</div>
						<div id="delivery" class="col-sm-4">
							<xsl:call-template name="delivery-block" />
						</div>
						<div id="attachments" class="col-sm-4">
							<xsl:call-template name="attachments-block" />
						</div>
					</div>
					<div class="row">
						<div id="tax" class="col-sm-6">
							<h3>
								<xsl:copy-of select="u:label('tax', 'Tax')" />
							</h3>
							<xsl:apply-templates select="cac:TaxTotal[cac:TaxSubtotal]" mode="tax" />
							<xsl:apply-templates select="cac:TaxRepresentativeParty" mode="party" />
						</div>
						<div id="payment" class="col-sm-6">
							<h3>
								<xsl:copy-of select="u:label('payment', 'Payment')" />
							</h3>
							<xsl:apply-templates select="cac:PaymentMeans" mode="payment" />
							<xsl:apply-templates select="cac:PayeeParty" mode="party" />
							<xsl:apply-templates select="cac:PaymentTerms" mode="payment" />
						</div>
					</div>
					<hr />
					<div id="details">
						<h3>Details</h3>
						<xsl:apply-templates select="cac:AllowanceCharge[cbc:ChargeIndicator='true']" mode="line" />
						<xsl:apply-templates select="cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" mode="line" />
						<xsl:apply-templates select="cac:AllowanceCharge[cbc:ChargeIndicator='false']" mode="line" />
						<xsl:apply-templates select="cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount" mode="line" />
						<xsl:apply-templates select="cac:InvoiceLine" mode="line" />
						<xsl:apply-templates select="cac:LegalMonetaryTotal/cbc:LineExtensionAmount" mode="line" />
					</div>
					<xsl:call-template name="doc-footer" />
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:function name="u:codelist">
		<xsl:param name="codelist" />
		<xsl:param name="code" />
		<xsl:choose>
			<xsl:when test="$codelists/cl[@id=$codelist]/c[@id=$code]/t[@id=$language]">
				<xsl:value-of select="$codelists/cl[@id=$codelist]/c[@id=$code]/t[@id=$language]/text()" />
			</xsl:when>
			<xsl:otherwise>
				<span class="mtr">[code:<xsl:value-of select="$codelist" />:<xsl:value-of select="$code" />]</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<xsl:variable name="codelists">
		<cl id="iso3166">
			<c id="1A">
				<t id="en">Kosovo</t>
			</c>
			<c id="AD">
				<t id="en">Andorra</t>
			</c>
			<c id="AE">
				<t id="en">United Arab Emirates</t>
			</c>
			<c id="AF">
				<t id="en">Afghanistan</t>
			</c>
			<c id="AG">
				<t id="en">Antigua and Barbuda</t>
			</c>
			<c id="AI">
				<t id="en">Anguilla</t>
			</c>
			<c id="AL">
				<t id="en">Albania</t>
			</c>
			<c id="AM">
				<t id="en">Armenia</t>
			</c>
			<c id="AO">
				<t id="en">Angola</t>
			</c>
			<c id="AQ">
				<t id="en">Antarctica</t>
			</c>
			<c id="AR">
				<t id="en">Argentina</t>
			</c>
			<c id="AS">
				<t id="en">American Samoa</t>
			</c>
			<c id="AT">
				<t id="en">Austria</t>
			</c>
			<c id="AU">
				<t id="en">Australia</t>
			</c>
			<c id="AW">
				<t id="en">Aruba</t>
			</c>
			<c id="AX">
				<t id="en">Åland Islands</t>
			</c>
			<c id="AZ">
				<t id="en">Azerbaijan</t>
			</c>
			<c id="BA">
				<t id="en">Bosnia and Herzegovina</t>
			</c>
			<c id="BB">
				<t id="en">Barbados</t>
			</c>
			<c id="BD">
				<t id="en">Bangladesh</t>
			</c>
			<c id="BE">
				<t id="en">Belgium</t>
			</c>
			<c id="BF">
				<t id="en">Burkina Faso</t>
			</c>
			<c id="BG">
				<t id="en">Bulgaria</t>
			</c>
			<c id="BH">
				<t id="en">Bahrain</t>
			</c>
			<c id="BI">
				<t id="en">Burundi</t>
			</c>
			<c id="BJ">
				<t id="en">Benin</t>
			</c>
			<c id="BL">
				<t id="en">Saint Barthélemy</t>
			</c>
			<c id="BM">
				<t id="en">Bermuda</t>
			</c>
			<c id="BN">
				<t id="en">Brunei Darussalam</t>
			</c>
			<c id="BO">
				<t id="en">Bolivia, Plurinational State of</t>
			</c>
			<c id="BQ">
				<t id="en">Bonaire, Sint Eustatius and Saba</t>
			</c>
			<c id="BR">
				<t id="en">Brazil</t>
			</c>
			<c id="BS">
				<t id="en">Bahamas (The)</t>
			</c>
			<c id="BT">
				<t id="en">Bhutan</t>
			</c>
			<c id="BV">
				<t id="en">Bouvet Island</t>
			</c>
			<c id="BW">
				<t id="en">Botswana</t>
			</c>
			<c id="BY">
				<t id="en">Belarus</t>
			</c>
			<c id="BZ">
				<t id="en">Belize</t>
			</c>
			<c id="CA">
				<t id="en">Canada</t>
			</c>
			<c id="CC">
				<t id="en">Cocos (Keeling) Islands</t>
			</c>
			<c id="CD">
				<t id="en">Congo, the Democratic Republic of the</t>
			</c>
			<c id="CF">
				<t id="en">Central African Republic</t>
			</c>
			<c id="CG">
				<t id="en">Congo</t>
			</c>
			<c id="CH">
				<t id="en">Switzerland</t>
			</c>
			<c id="CI">
				<t id="en">Côte d'Ivoire</t>
			</c>
			<c id="CK">
				<t id="en">Cook Islands</t>
			</c>
			<c id="CL">
				<t id="en">Chile</t>
			</c>
			<c id="CM">
				<t id="en">Cameroon</t>
			</c>
			<c id="CN">
				<t id="en">China</t>
			</c>
			<c id="CO">
				<t id="en">Colombia</t>
			</c>
			<c id="CR">
				<t id="en">Costa Rica</t>
			</c>
			<c id="CU">
				<t id="en">Cuba</t>
			</c>
			<c id="CV">
				<t id="en">Cabo Verde</t>
			</c>
			<c id="CW">
				<t id="en">Curaçao</t>
			</c>
			<c id="CX">
				<t id="en">Christmas Island</t>
			</c>
			<c id="CY">
				<t id="en">Cyprus</t>
			</c>
			<c id="CZ">
				<t id="en">Czechia</t>
			</c>
			<c id="DE">
				<t id="en">Germany</t>
			</c>
			<c id="DJ">
				<t id="en">Djibouti</t>
			</c>
			<c id="DK">
				<t id="en">Denmark</t>
			</c>
			<c id="DM">
				<t id="en">Dominica</t>
			</c>
			<c id="DO">
				<t id="en">Dominican Republic</t>
			</c>
			<c id="DZ">
				<t id="en">Algeria</t>
			</c>
			<c id="EC">
				<t id="en">Ecuador</t>
			</c>
			<c id="EE">
				<t id="en">Estonia</t>
			</c>
			<c id="EG">
				<t id="en">Egypt</t>
			</c>
			<c id="EH">
				<t id="en">Western Sahara</t>
			</c>
			<c id="ER">
				<t id="en">Eritrea</t>
			</c>
			<c id="ES">
				<t id="en">Spain</t>
			</c>
			<c id="ET">
				<t id="en">Ethiopia</t>
			</c>
			<c id="FI">
				<t id="en">Finland</t>
			</c>
			<c id="FJ">
				<t id="en">Fiji</t>
			</c>
			<c id="FK">
				<t id="en">Falkland Islands (Malvinas)</t>
			</c>
			<c id="FM">
				<t id="en">Micronesia, Federated States of</t>
			</c>
			<c id="FO">
				<t id="en">Faroe Islands</t>
			</c>
			<c id="FR">
				<t id="en">France</t>
			</c>
			<c id="GA">
				<t id="en">Gabon</t>
			</c>
			<c id="GB">
				<t id="en">United Kingdom of Great Britain and Northern Ireland</t>
			</c>
			<c id="GD">
				<t id="en">Grenada</t>
			</c>
			<c id="GE">
				<t id="en">Georgia</t>
			</c>
			<c id="GF">
				<t id="en">French Guiana</t>
			</c>
			<c id="GG">
				<t id="en">Guernsey</t>
			</c>
			<c id="GH">
				<t id="en">Ghana</t>
			</c>
			<c id="GI">
				<t id="en">Gibraltar</t>
			</c>
			<c id="GL">
				<t id="en">Greenland</t>
			</c>
			<c id="GM">
				<t id="en">Gambia</t>
			</c>
			<c id="GN">
				<t id="en">Guinea</t>
			</c>
			<c id="GP">
				<t id="en">Guadeloupe</t>
			</c>
			<c id="GQ">
				<t id="en">Equatorial Guinea</t>
			</c>
			<c id="GR">
				<t id="en">Greece</t>
			</c>
			<c id="GS">
				<t id="en">South Georgia and the South Sandwich Islands</t>
			</c>
			<c id="GT">
				<t id="en">Guatemala</t>
			</c>
			<c id="GU">
				<t id="en">Guam</t>
			</c>
			<c id="GW">
				<t id="en">Guinea-Bissau</t>
			</c>
			<c id="GY">
				<t id="en">Guyana</t>
			</c>
			<c id="HK">
				<t id="en">Hong Kong</t>
			</c>
			<c id="HM">
				<t id="en">Heard Island and McDonald Islands</t>
			</c>
			<c id="HN">
				<t id="en">Honduras</t>
			</c>
			<c id="HR">
				<t id="en">Croatia</t>
			</c>
			<c id="HT">
				<t id="en">Haiti</t>
			</c>
			<c id="HU">
				<t id="en">Hungary</t>
			</c>
			<c id="ID">
				<t id="en">Indonesia</t>
			</c>
			<c id="IE">
				<t id="en">Ireland</t>
			</c>
			<c id="IL">
				<t id="en">Israel</t>
			</c>
			<c id="IM">
				<t id="en">Isle of Man</t>
			</c>
			<c id="IN">
				<t id="en">India</t>
			</c>
			<c id="IO">
				<t id="en">British Indian Ocean Territory</t>
			</c>
			<c id="IQ">
				<t id="en">Iraq</t>
			</c>
			<c id="IR">
				<t id="en">Iran, Islamic Republic of</t>
			</c>
			<c id="IS">
				<t id="en">Iceland</t>
			</c>
			<c id="IT">
				<t id="en">Italy</t>
			</c>
			<c id="JE">
				<t id="en">Jersey</t>
			</c>
			<c id="JM">
				<t id="en">Jamaica</t>
			</c>
			<c id="JO">
				<t id="en">Jordan</t>
			</c>
			<c id="JP">
				<t id="en">Japan</t>
			</c>
			<c id="KE">
				<t id="en">Kenya</t>
			</c>
			<c id="KG">
				<t id="en">Kyrgyzstan</t>
			</c>
			<c id="KH">
				<t id="en">Cambodia</t>
			</c>
			<c id="KI">
				<t id="en">Kiribati</t>
			</c>
			<c id="KM">
				<t id="en">Comoros</t>
			</c>
			<c id="KN">
				<t id="en">Saint Kitts and Nevis</t>
			</c>
			<c id="KP">
				<t id="en">Korea, Democratic People's Republic of</t>
			</c>
			<c id="KR">
				<t id="en">Korea, Republic of</t>
			</c>
			<c id="KW">
				<t id="en">Kuwait</t>
			</c>
			<c id="KY">
				<t id="en">Cayman Islands</t>
			</c>
			<c id="KZ">
				<t id="en">Kazakhstan</t>
			</c>
			<c id="LA">
				<t id="en">Lao People's Democratic Republic</t>
			</c>
			<c id="LB">
				<t id="en">Lebanon</t>
			</c>
			<c id="LC">
				<t id="en">Saint Lucia</t>
			</c>
			<c id="LI">
				<t id="en">Liechtenstein</t>
			</c>
			<c id="LK">
				<t id="en">Sri Lanka</t>
			</c>
			<c id="LR">
				<t id="en">Liberia</t>
			</c>
			<c id="LS">
				<t id="en">Lesotho</t>
			</c>
			<c id="LT">
				<t id="en">Lithuania</t>
			</c>
			<c id="LU">
				<t id="en">Luxembourg</t>
			</c>
			<c id="LV">
				<t id="en">Latvia</t>
			</c>
			<c id="LY">
				<t id="en">Libya</t>
			</c>
			<c id="MA">
				<t id="en">Morocco</t>
			</c>
			<c id="MC">
				<t id="en">Monaco</t>
			</c>
			<c id="MD">
				<t id="en">Moldova, Republic of</t>
			</c>
			<c id="ME">
				<t id="en">Montenegro</t>
			</c>
			<c id="MF">
				<t id="en">Saint Martin (French part)</t>
			</c>
			<c id="MG">
				<t id="en">Madagascar</t>
			</c>
			<c id="MH">
				<t id="en">Marshall Islands</t>
			</c>
			<c id="MK">
				<t id="en">Macedonia, the former Yugoslav Republic of</t>
			</c>
			<c id="ML">
				<t id="en">Mali</t>
			</c>
			<c id="MM">
				<t id="en">Myanmar</t>
			</c>
			<c id="MN">
				<t id="en">Mongolia</t>
			</c>
			<c id="MO">
				<t id="en">Macao</t>
			</c>
			<c id="MP">
				<t id="en">Northern Mariana Islands</t>
			</c>
			<c id="MQ">
				<t id="en">Martinique</t>
			</c>
			<c id="MR">
				<t id="en">Mauritania</t>
			</c>
			<c id="MS">
				<t id="en">Montserrat</t>
			</c>
			<c id="MT">
				<t id="en">Malta</t>
			</c>
			<c id="MU">
				<t id="en">Mauritius</t>
			</c>
			<c id="MV">
				<t id="en">Maldives</t>
			</c>
			<c id="MW">
				<t id="en">Malawi</t>
			</c>
			<c id="MX">
				<t id="en">Mexico</t>
			</c>
			<c id="MY">
				<t id="en">Malaysia</t>
			</c>
			<c id="MZ">
				<t id="en">Mozambique</t>
			</c>
			<c id="NA">
				<t id="en">Namibia</t>
			</c>
			<c id="NC">
				<t id="en">New Caledonia</t>
			</c>
			<c id="NE">
				<t id="en">Niger</t>
			</c>
			<c id="NF">
				<t id="en">Norfolk Island</t>
			</c>
			<c id="NG">
				<t id="en">Nigeria</t>
			</c>
			<c id="NI">
				<t id="en">Nicaragua</t>
			</c>
			<c id="NL">
				<t id="en">Netherlands</t>
			</c>
			<c id="NO">
				<t id="en">Norway</t>
			</c>
			<c id="NP">
				<t id="en">Nepal</t>
			</c>
			<c id="NR">
				<t id="en">Nauru</t>
			</c>
			<c id="NU">
				<t id="en">Niue</t>
			</c>
			<c id="NZ">
				<t id="en">New Zealand</t>
			</c>
			<c id="OM">
				<t id="en">Oman</t>
			</c>
			<c id="PA">
				<t id="en">Panama</t>
			</c>
			<c id="PE">
				<t id="en">Peru</t>
			</c>
			<c id="PF">
				<t id="en">French Polynesia</t>
			</c>
			<c id="PG">
				<t id="en">Papua New Guinea</t>
			</c>
			<c id="PH">
				<t id="en">Philippines</t>
			</c>
			<c id="PK">
				<t id="en">Pakistan</t>
			</c>
			<c id="PL">
				<t id="en">Poland</t>
			</c>
			<c id="PM">
				<t id="en">Saint Pierre and Miquelon</t>
			</c>
			<c id="PN">
				<t id="en">Pitcairn</t>
			</c>
			<c id="PR">
				<t id="en">Puerto Rico</t>
			</c>
			<c id="PS">
				<t id="en">Palestine, State of</t>
			</c>
			<c id="PT">
				<t id="en">Portugal</t>
			</c>
			<c id="PW">
				<t id="en">Palau</t>
			</c>
			<c id="PY">
				<t id="en">Paraguay</t>
			</c>
			<c id="QA">
				<t id="en">Qatar</t>
			</c>
			<c id="RE">
				<t id="en">Réunion</t>
			</c>
			<c id="RO">
				<t id="en">Romania</t>
			</c>
			<c id="RS">
				<t id="en">Serbia</t>
			</c>
			<c id="RU">
				<t id="en">Russian Federation</t>
			</c>
			<c id="RW">
				<t id="en">Rwanda</t>
			</c>
			<c id="SA">
				<t id="en">Saudi Arabia</t>
			</c>
			<c id="SB">
				<t id="en">Solomon Islands</t>
			</c>
			<c id="SC">
				<t id="en">Seychelles</t>
			</c>
			<c id="SD">
				<t id="en">Sudan</t>
			</c>
			<c id="SE">
				<t id="en">Sweden</t>
			</c>
			<c id="SG">
				<t id="en">Singapore</t>
			</c>
			<c id="SH">
				<t id="en">Saint Helena, Ascension and Tristan da Cunha</t>
			</c>
			<c id="SI">
				<t id="en">Slovenia</t>
			</c>
			<c id="SJ">
				<t id="en">Svalbard and Jan Mayen</t>
			</c>
			<c id="SK">
				<t id="en">Slovakia</t>
			</c>
			<c id="SL">
				<t id="en">Sierra Leone</t>
			</c>
			<c id="SM">
				<t id="en">San Marino</t>
			</c>
			<c id="SN">
				<t id="en">Senegal</t>
			</c>
			<c id="SO">
				<t id="en">Somalia</t>
			</c>
			<c id="SR">
				<t id="en">Suriname</t>
			</c>
			<c id="SS">
				<t id="en">South Sudan</t>
			</c>
			<c id="ST">
				<t id="en">Sao Tome and Principe</t>
			</c>
			<c id="SV">
				<t id="en">El Salvador</t>
			</c>
			<c id="SX">
				<t id="en">Sint Maarten (Dutch part)</t>
			</c>
			<c id="SY">
				<t id="en">Syrian Arab Republic</t>
			</c>
			<c id="SZ">
				<t id="en">Swaziland</t>
			</c>
			<c id="TC">
				<t id="en">Turks and Caicos Islands</t>
			</c>
			<c id="TD">
				<t id="en">Chad</t>
			</c>
			<c id="TF">
				<t id="en">French Southern Territories</t>
			</c>
			<c id="TG">
				<t id="en">Togo</t>
			</c>
			<c id="TH">
				<t id="en">Thailand</t>
			</c>
			<c id="TJ">
				<t id="en">Tajikistan</t>
			</c>
			<c id="TK">
				<t id="en">Tokelau</t>
			</c>
			<c id="TL">
				<t id="en">Timor-Leste</t>
			</c>
			<c id="TM">
				<t id="en">Turkmenistan</t>
			</c>
			<c id="TN">
				<t id="en">Tunisia</t>
			</c>
			<c id="TO">
				<t id="en">Tonga</t>
			</c>
			<c id="TR">
				<t id="en">Turkey</t>
			</c>
			<c id="TT">
				<t id="en">Trinidad and Tobago</t>
			</c>
			<c id="TV">
				<t id="en">Tuvalu</t>
			</c>
			<c id="TW">
				<t id="en">Taiwan, Province of China</t>
			</c>
			<c id="TZ">
				<t id="en">Tanzania, United Republic of</t>
			</c>
			<c id="UA">
				<t id="en">Ukraine</t>
			</c>
			<c id="UG">
				<t id="en">Uganda</t>
			</c>
			<c id="UM">
				<t id="en">United States Minor Outlying Islands</t>
			</c>
			<c id="US">
				<t id="en">United States of America</t>
			</c>
			<c id="UY">
				<t id="en">Uruguay</t>
			</c>
			<c id="UZ">
				<t id="en">Uzbekistan</t>
			</c>
			<c id="VA">
				<t id="en">Holy See</t>
			</c>
			<c id="VC">
				<t id="en">Saint Vincent and the Grenadines</t>
			</c>
			<c id="VE">
				<t id="en">Venezuela, Bolivarian Republic of</t>
			</c>
			<c id="VG">
				<t id="en">Virgin Islands, British</t>
			</c>
			<c id="VI">
				<t id="en">Virgin Islands, U.S.</t>
			</c>
			<c id="VN">
				<t id="en">Viet Nam</t>
			</c>
			<c id="VU">
				<t id="en">Vanuatu</t>
			</c>
			<c id="WF">
				<t id="en">Wallis and Futuna</t>
			</c>
			<c id="WS">
				<t id="en">Samoa</t>
			</c>
			<c id="XI">
				<t id="en">United Kingdom (Northern Ireland)</t>
			</c>
			<c id="YE">
				<t id="en">Yemen</t>
			</c>
			<c id="YT">
				<t id="en">Mayotte</t>
			</c>
			<c id="ZA">
				<t id="en">South Africa</t>
			</c>
			<c id="ZM">
				<t id="en">Zambia</t>
			</c>
			<c id="ZW">
				<t id="en">Zimbabwe</t>
			</c>
		</cl>
		<cl id="uncl1001invoice">
			<c id="71">
				<t id="en">Request for payment</t>
			</c>
			<c id="80">
				<t id="en">Debit note related to goods or services</t>
			</c>
			<c id="82">
				<t id="en">Metered services invoice</t>
			</c>
			<c id="84">
				<t id="en">Debit note related to financial adjustments</t>
			</c>
			<c id="102">
				<t id="en">Tax notification</t>
			</c>
			<c id="218">
				<t id="en">Final payment request based on completion of work</t>
			</c>
			<c id="219">
				<t id="en">Payment request for completed units</t>
			</c>
			<c id="326">
				<t id="en">Partial invoice</t>
			</c>
			<c id="331">
				<t id="en">Commercial invoice which includes a packing list</t>
			</c>
			<c id="380">
				<t id="en">Commercial invoice</t>
			</c>
			<c id="382">
				<t id="en">Commission note</t>
			</c>
			<c id="383">
				<t id="en">Debit note</t>
			</c>
			<c id="384">
				<t id="en">Corrected invoice</t>
			</c>
			<c id="386">
				<t id="en">Prepayment invoice</t>
			</c>
			<c id="388">
				<t id="en">Tax invoice</t>
			</c>
			<c id="389">
				<t id="en">Self-billed invoice</t>
			</c>
			<c id="393">
				<t id="en">Factored invoice</t>
			</c>
			<c id="395">
				<t id="en">Consignment invoice</t>
			</c>
			<c id="553">
				<t id="en">Forwarder's invoice discrepancy report</t>
			</c>
			<c id="575">
				<t id="en">Insurer's invoice</t>
			</c>
			<c id="623">
				<t id="en">Forwarder's invoice</t>
			</c>
			<c id="780">
				<t id="en">Freight invoice</t>
			</c>
			<c id="817">
				<t id="en">Claim notification</t>
			</c>
			<c id="870">
				<t id="en">Consular invoice</t>
			</c>
			<c id="875">
				<t id="en">Partial construction invoice</t>
			</c>
			<c id="876">
				<t id="en">Partial final construction invoice</t>
			</c>
			<c id="877">
				<t id="en">Final construction invoice</t>
			</c>
		</cl>
		<cl id="uncl1001-cn">
			<c id="81">
				<t id="en">Credit note related to goods or services</t>
			</c>
			<c id="83">
				<t id="en">Credit note related to financial adjustments</t>
			</c>
			<c id="381">
				<t id="en">Credit note</t>
			</c>
			<c id="396">
				<t id="en">Factored credit note</t>
			</c>
			<c id="532">
				<t id="en">Forwarder's credit note</t>
			</c>
		</cl>
		<cl id="uncl4461">
			<c id="1">
				<t id="en">Instrument not defined</t>
			</c>
			<c id="2">
				<t id="en">Automated clearing house credit</t>
			</c>
			<c id="3">
				<t id="en">Automated clearing house debit</t>
			</c>
			<c id="4">
				<t id="en">ACH demand debit reversal</t>
			</c>
			<c id="5">
				<t id="en">ACH demand credit reversal</t>
			</c>
			<c id="6">
				<t id="en">ACH demand credit</t>
			</c>
			<c id="7">
				<t id="en">ACH demand debit</t>
			</c>
			<c id="8">
				<t id="en">Hold</t>
			</c>
			<c id="9">
				<t id="en">National or regional clearing</t>
			</c>
			<c id="10">
				<t id="en">In cash</t>
			</c>
			<c id="11">
				<t id="en">ACH savings credit reversal</t>
			</c>
			<c id="12">
				<t id="en">ACH savings debit reversal</t>
			</c>
			<c id="13">
				<t id="en">ACH savings credit</t>
			</c>
			<c id="14">
				<t id="en">ACH savings debit</t>
			</c>
			<c id="15">
				<t id="en">Bookentry credit</t>
			</c>
			<c id="16">
				<t id="en">Bookentry debit</t>
			</c>
			<c id="17">
				<t id="en">ACH demand cash concentration/disbursement (CCD) credit</t>
			</c>
			<c id="18">
				<t id="en">ACH demand cash concentration/disbursement (CCD) debit</t>
			</c>
			<c id="19">
				<t id="en">ACH demand corporate trade payment (CTP) credit</t>
			</c>
			<c id="20">
				<t id="en">Cheque</t>
			</c>
			<c id="21">
				<t id="en">Banker's draft</t>
			</c>
			<c id="22">
				<t id="en">Certified banker's draft</t>
			</c>
			<c id="23">
				<t id="en">Bank cheque (issued by a banking or similar establishment)</t>
			</c>
			<c id="24">
				<t id="en">Bill of exchange awaiting acceptance</t>
			</c>
			<c id="25">
				<t id="en">Certified cheque</t>
			</c>
			<c id="26">
				<t id="en">Local cheque</t>
			</c>
			<c id="27">
				<t id="en">ACH demand corporate trade payment (CTP) debit</t>
			</c>
			<c id="28">
				<t id="en">ACH demand corporate trade exchange (CTX) credit</t>
			</c>
			<c id="29">
				<t id="en">ACH demand corporate trade exchange (CTX) debit</t>
			</c>
			<c id="30">
				<t id="en">Credit transfer</t>
			</c>
			<c id="31">
				<t id="en">Debit transfer</t>
			</c>
			<c id="32">
				<t id="en">ACH demand cash concentration/disbursement plus (CCD+) credit</t>
			</c>
			<c id="33">
				<t id="en">ACH demand cash concentration/disbursement plus (CCD+) debit</t>
			</c>
			<c id="34">
				<t id="en">ACH prearranged payment and deposit (PPD)</t>
			</c>
			<c id="35">
				<t id="en">ACH savings cash concentration/disbursement (CCD) credit</t>
			</c>
			<c id="36">
				<t id="en">ACH savings cash concentration/disbursement (CCD) debit</t>
			</c>
			<c id="37">
				<t id="en">ACH savings corporate trade payment (CTP) credit</t>
			</c>
			<c id="38">
				<t id="en">ACH savings corporate trade payment (CTP) debit</t>
			</c>
			<c id="39">
				<t id="en">ACH savings corporate trade exchange (CTX) credit</t>
			</c>
			<c id="40">
				<t id="en">ACH savings corporate trade exchange (CTX) debit</t>
			</c>
			<c id="41">
				<t id="en">ACH savings cash concentration/disbursement plus (CCD+) credit</t>
			</c>
			<c id="42">
				<t id="en">Payment to bank account</t>
			</c>
			<c id="43">
				<t id="en">ACH savings cash concentration/disbursement plus (CCD+) debit</t>
			</c>
			<c id="44">
				<t id="en">Accepted bill of exchange</t>
			</c>
			<c id="45">
				<t id="en">Referenced home-banking credit transfer</t>
			</c>
			<c id="46">
				<t id="en">Interbank debit transfer</t>
			</c>
			<c id="47">
				<t id="en">Home-banking debit transfer</t>
			</c>
			<c id="48">
				<t id="en">Bank card</t>
			</c>
			<c id="49">
				<t id="en">Direct debit</t>
			</c>
			<c id="50">
				<t id="en">Payment by postgiro</t>
			</c>
			<c id="51">
				<t id="en">FR, norme 6 97-Telereglement CFONB (French Organisation for</t>
			</c>
			<c id="52">
				<t id="en">Urgent commercial payment</t>
			</c>
			<c id="53">
				<t id="en">Urgent Treasury Payment</t>
			</c>
			<c id="54">
				<t id="en">Credit card</t>
			</c>
			<c id="55">
				<t id="en">Debit card</t>
			</c>
			<c id="56">
				<t id="en">Bankgiro</t>
			</c>
			<c id="57">
				<t id="en">Standing agreement</t>
			</c>
			<c id="58">
				<t id="en">SEPA credit transfer</t>
			</c>
			<c id="59">
				<t id="en">SEPA direct debit</t>
			</c>
			<c id="60">
				<t id="en">Promissory note</t>
			</c>
			<c id="61">
				<t id="en">Promissory note signed by the debtor</t>
			</c>
			<c id="62">
				<t id="en">Promissory note signed by the debtor and endorsed by a bank</t>
			</c>
			<c id="63">
				<t id="en">Promissory note signed by the debtor and endorsed by a third party</t>
			</c>
			<c id="64">
				<t id="en">Promissory note signed by a bank</t>
			</c>
			<c id="65">
				<t id="en">Promissory note signed by a bank and endorsed by another bank</t>
			</c>
			<c id="66">
				<t id="en">Promissory note signed by a third party</t>
			</c>
			<c id="67">
				<t id="en">Promissory note signed by a third party and endorsed by a bank</t>
			</c>
			<c id="68">
				<t id="en">Online payment service</t>
			</c>
			<c id="69">
				<t id="en">Transfer Advice</t>
			</c>
			<c id="70">
				<t id="en">Bill drawn by the creditor on the debtor</t>
			</c>
			<c id="74">
				<t id="en">Bill drawn by the creditor on a bank</t>
			</c>
			<c id="75">
				<t id="en">Bill drawn by the creditor, endorsed by another bank</t>
			</c>
			<c id="76">
				<t id="en">Bill drawn by the creditor on a bank and endorsed by a third party</t>
			</c>
			<c id="77">
				<t id="en">Bill drawn by the creditor on a third party</t>
			</c>
			<c id="78">
				<t id="en">Bill drawn by creditor on third party, accepted and endorsed by bank</t>
			</c>
			<c id="91">
				<t id="en">Not transferable banker's draft</t>
			</c>
			<c id="92">
				<t id="en">Not transferable local cheque</t>
			</c>
			<c id="93">
				<t id="en">Reference giro</t>
			</c>
			<c id="94">
				<t id="en">Urgent giro</t>
			</c>
			<c id="95">
				<t id="en">Free format giro</t>
			</c>
			<c id="96">
				<t id="en">Requested method for payment was not used</t>
			</c>
			<c id="97">
				<t id="en">Clearing between partners</t>
			</c>
			<c id="98">
				<t id="en">JP, Electronically Recorded Monetary Claims</t>
			</c>
			<c id="ZZZ">
				<t id="en">Mutually defined</t>
			</c>
		</cl>
		<cl id="uncl5305">
			<c id="AE">
				<t id="en">Vat Reverse Charge</t>
			</c>
			<c id="B">
				<t id="en">Transferred (VAT), In Italy</t>
			</c>
			<c id="E">
				<t id="en">Exempt from Tax</t>
			</c>
			<c id="G">
				<t id="en">Free export item, VAT not charged</t>
			</c>
			<c id="K">
				<t id="en">VAT exempt for EEA intra-community supply of goods and
            services</t>
			</c>
			<c id="L">
				<t id="en">Canary Islands general indirect tax</t>
			</c>
			<c id="M">
				<t id="en">Tax for production, services and importation in Ceuta and
            Melilla</t>
			</c>
			<c id="O">
				<t id="en">Services outside scope of tax</t>
			</c>
			<c id="S">
				<t id="en">Standard rate</t>
			</c>
			<c id="Z">
				<t id="en">Zero rated goods</t>
			</c>
		</cl>
		<cl id="uncl5189">
			<c id="41">
				<t id="en">Bonus for works ahead of schedule</t>
			</c>
			<c id="42">
				<t id="en">Other bonus</t>
			</c>
			<c id="60">
				<t id="en">Manufacturer’s consumer discount</t>
			</c>
			<c id="62">
				<t id="en">Due to military status</t>
			</c>
			<c id="63">
				<t id="en">Due to work accident</t>
			</c>
			<c id="64">
				<t id="en">Special agreement</t>
			</c>
			<c id="65">
				<t id="en">Production error discount</t>
			</c>
			<c id="66">
				<t id="en">New outlet discount</t>
			</c>
			<c id="67">
				<t id="en">Sample discount</t>
			</c>
			<c id="68">
				<t id="en">End-of-range discount</t>
			</c>
			<c id="70">
				<t id="en">Incoterm discount</t>
			</c>
			<c id="71">
				<t id="en">Point of sales threshold allowance</t>
			</c>
			<c id="88">
				<t id="en">Material surcharge/deduction</t>
			</c>
			<c id="95">
				<t id="en">Discount</t>
			</c>
			<c id="100">
				<t id="en">Special rebate</t>
			</c>
			<c id="102">
				<t id="en">Fixed long term</t>
			</c>
			<c id="103">
				<t id="en">Temporary</t>
			</c>
			<c id="104">
				<t id="en">Standard</t>
			</c>
			<c id="105">
				<t id="en">Yearly turnover</t>
			</c>
		</cl>
		<cl id="uncl7161">
			<c id="AA">
				<t id="en">Advertising</t>
			</c>
			<c id="AAA">
				<t id="en">Telecommunication</t>
			</c>
			<c id="AAC">
				<t id="en">Technical modification</t>
			</c>
			<c id="AAD">
				<t id="en">Job-order production</t>
			</c>
			<c id="AAE">
				<t id="en">Outlays</t>
			</c>
			<c id="AAF">
				<t id="en">Off-premises</t>
			</c>
			<c id="AAH">
				<t id="en">Additional processing</t>
			</c>
			<c id="AAI">
				<t id="en">Attesting</t>
			</c>
			<c id="AAS">
				<t id="en">Acceptance</t>
			</c>
			<c id="AAT">
				<t id="en">Rush delivery</t>
			</c>
			<c id="AAV">
				<t id="en">Special construction</t>
			</c>
			<c id="AAY">
				<t id="en">Airport facilities</t>
			</c>
			<c id="AAZ">
				<t id="en">Concession</t>
			</c>
			<c id="ABA">
				<t id="en">Compulsory storage</t>
			</c>
			<c id="ABB">
				<t id="en">Fuel removal</t>
			</c>
			<c id="ABC">
				<t id="en">Into plane</t>
			</c>
			<c id="ABD">
				<t id="en">Overtime</t>
			</c>
			<c id="ABF">
				<t id="en">Tooling</t>
			</c>
			<c id="ABK">
				<t id="en">Miscellaneous</t>
			</c>
			<c id="ABL">
				<t id="en">Additional packaging</t>
			</c>
			<c id="ABN">
				<t id="en">Dunnage</t>
			</c>
			<c id="ABR">
				<t id="en">Containerisation</t>
			</c>
			<c id="ABS">
				<t id="en">Carton packing</t>
			</c>
			<c id="ABT">
				<t id="en">Hessian wrapped</t>
			</c>
			<c id="ABU">
				<t id="en">Polyethylene wrap packing</t>
			</c>
			<c id="ACF">
				<t id="en">Miscellaneous treatment</t>
			</c>
			<c id="ACG">
				<t id="en">Enamelling treatment</t>
			</c>
			<c id="ACH">
				<t id="en">Heat treatment</t>
			</c>
			<c id="ACI">
				<t id="en">Plating treatment</t>
			</c>
			<c id="ACJ">
				<t id="en">Painting</t>
			</c>
			<c id="ACK">
				<t id="en">Polishing</t>
			</c>
			<c id="ACL">
				<t id="en">Priming</t>
			</c>
			<c id="ACM">
				<t id="en">Preservation treatment</t>
			</c>
			<c id="ACS">
				<t id="en">Fitting</t>
			</c>
			<c id="ADC">
				<t id="en">Consolidation</t>
			</c>
			<c id="ADE">
				<t id="en">Bill of lading</t>
			</c>
			<c id="ADJ">
				<t id="en">Airbag</t>
			</c>
			<c id="ADK">
				<t id="en">Transfer</t>
			</c>
			<c id="ADL">
				<t id="en">Slipsheet</t>
			</c>
			<c id="ADM">
				<t id="en">Binding</t>
			</c>
			<c id="ADN">
				<t id="en">Repair or replacement of broken returnable package</t>
			</c>
			<c id="ADO">
				<t id="en">Efficient logistics</t>
			</c>
			<c id="ADP">
				<t id="en">Merchandising</t>
			</c>
			<c id="ADQ">
				<t id="en">Product mix</t>
			</c>
			<c id="ADR">
				<t id="en">Other services</t>
			</c>
			<c id="ADT">
				<t id="en">Pick-up</t>
			</c>
			<c id="ADW">
				<t id="en">Chronic illness</t>
			</c>
			<c id="ADY">
				<t id="en">New product introduction</t>
			</c>
			<c id="ADZ">
				<t id="en">Direct delivery</t>
			</c>
			<c id="AEA">
				<t id="en">Diversion</t>
			</c>
			<c id="AEB">
				<t id="en">Disconnect</t>
			</c>
			<c id="AEC">
				<t id="en">Distribution</t>
			</c>
			<c id="AED">
				<t id="en">Handling of hazardous cargo</t>
			</c>
			<c id="AEF">
				<t id="en">Rents and leases</t>
			</c>
			<c id="AEH">
				<t id="en">Location differential</t>
			</c>
			<c id="AEI">
				<t id="en">Aircraft refueling</t>
			</c>
			<c id="AEJ">
				<t id="en">Fuel shipped into storage</t>
			</c>
			<c id="AEK">
				<t id="en">Cash on delivery</t>
			</c>
			<c id="AEL">
				<t id="en">Small order processing service</t>
			</c>
			<c id="AEM">
				<t id="en">Clerical or administrative services</t>
			</c>
			<c id="AEN">
				<t id="en">Guarantee</t>
			</c>
			<c id="AEO">
				<t id="en">Collection and recycling</t>
			</c>
			<c id="AEP">
				<t id="en">Copyright fee collection</t>
			</c>
			<c id="AES">
				<t id="en">Veterinary inspection service</t>
			</c>
			<c id="AET">
				<t id="en">Pensioner service</t>
			</c>
			<c id="AEU">
				<t id="en">Medicine free pass holder</t>
			</c>
			<c id="AEV">
				<t id="en">Environmental protection service</t>
			</c>
			<c id="AEW">
				<t id="en">Environmental clean-up service</t>
			</c>
			<c id="AEX">
				<t id="en">National cheque processing service outside account area</t>
			</c>
			<c id="AEY">
				<t id="en">National payment service outside account area</t>
			</c>
			<c id="AEZ">
				<t id="en">National payment service within account area</t>
			</c>
			<c id="AJ">
				<t id="en">Adjustments</t>
			</c>
			<c id="AU">
				<t id="en">Authentication</t>
			</c>
			<c id="CA">
				<t id="en">Cataloguing</t>
			</c>
			<c id="CAB">
				<t id="en">Cartage</t>
			</c>
			<c id="CAD">
				<t id="en">Certification</t>
			</c>
			<c id="CAE">
				<t id="en">Certificate of conformance</t>
			</c>
			<c id="CAF">
				<t id="en">Certificate of origin</t>
			</c>
			<c id="CAI">
				<t id="en">Cutting</t>
			</c>
			<c id="CAJ">
				<t id="en">Consular service</t>
			</c>
			<c id="CAK">
				<t id="en">Customer collection</t>
			</c>
			<c id="CAL">
				<t id="en">Payroll payment service</t>
			</c>
			<c id="CAM">
				<t id="en">Cash transportation</t>
			</c>
			<c id="CAN">
				<t id="en">Home banking service</t>
			</c>
			<c id="CAO">
				<t id="en">Bilateral agreement service</t>
			</c>
			<c id="CAP">
				<t id="en">Insurance brokerage service</t>
			</c>
			<c id="CAQ">
				<t id="en">Cheque generation</t>
			</c>
			<c id="CAR">
				<t id="en">Preferential merchandising location</t>
			</c>
			<c id="CAS">
				<t id="en">Crane</t>
			</c>
			<c id="CAT">
				<t id="en">Special colour service</t>
			</c>
			<c id="CAU">
				<t id="en">Sorting</t>
			</c>
			<c id="CAV">
				<t id="en">Battery collection and recycling</t>
			</c>
			<c id="CAW">
				<t id="en">Product take back fee</t>
			</c>
			<c id="CAX">
				<t id="en">Quality control released</t>
			</c>
			<c id="CAY">
				<t id="en">Quality control held</t>
			</c>
			<c id="CAZ">
				<t id="en">Quality control embargo</t>
			</c>
			<c id="CD">
				<t id="en">Car loading</t>
			</c>
			<c id="CG">
				<t id="en">Cleaning</t>
			</c>
			<c id="CS">
				<t id="en">Cigarette stamping</t>
			</c>
			<c id="CT">
				<t id="en">Count and recount</t>
			</c>
			<c id="DAB">
				<t id="en">Layout/design</t>
			</c>
			<c id="DAC">
				<t id="en">Assortment allowance</t>
			</c>
			<c id="DAD">
				<t id="en">Driver assigned unloading</t>
			</c>
			<c id="DAF">
				<t id="en">Debtor bound</t>
			</c>
			<c id="DAG">
				<t id="en">Dealer allowance</t>
			</c>
			<c id="DAH">
				<t id="en">Allowance transferable to the consumer</t>
			</c>
			<c id="DAI">
				<t id="en">Growth of business</t>
			</c>
			<c id="DAJ">
				<t id="en">Introduction allowance</t>
			</c>
			<c id="DAK">
				<t id="en">Multi-buy promotion</t>
			</c>
			<c id="DAL">
				<t id="en">Partnership</t>
			</c>
			<c id="DAM">
				<t id="en">Return handling</t>
			</c>
			<c id="DAN">
				<t id="en">Minimum order not fulfilled charge</t>
			</c>
			<c id="DAO">
				<t id="en">Point of sales threshold allowance</t>
			</c>
			<c id="DAP">
				<t id="en">Wholesaling discount</t>
			</c>
			<c id="DAQ">
				<t id="en">Documentary credits transfer commission</t>
			</c>
			<c id="DL">
				<t id="en">Delivery</t>
			</c>
			<c id="EG">
				<t id="en">Engraving</t>
			</c>
			<c id="EP">
				<t id="en">Expediting</t>
			</c>
			<c id="ER">
				<t id="en">Exchange rate guarantee</t>
			</c>
			<c id="FAA">
				<t id="en">Fabrication</t>
			</c>
			<c id="FAB">
				<t id="en">Freight equalization</t>
			</c>
			<c id="FAC">
				<t id="en">Freight extraordinary handling</t>
			</c>
			<c id="FC">
				<t id="en">Freight service</t>
			</c>
			<c id="FH">
				<t id="en">Filling/handling</t>
			</c>
			<c id="FI">
				<t id="en">Financing</t>
			</c>
			<c id="GAA">
				<t id="en">Grinding</t>
			</c>
			<c id="HAA">
				<t id="en">Hose</t>
			</c>
			<c id="HD">
				<t id="en">Handling</t>
			</c>
			<c id="HH">
				<t id="en">Hoisting and hauling</t>
			</c>
			<c id="IAA">
				<t id="en">Installation</t>
			</c>
			<c id="IAB">
				<t id="en">Installation and warranty</t>
			</c>
			<c id="ID">
				<t id="en">Inside delivery</t>
			</c>
			<c id="IF">
				<t id="en">Inspection</t>
			</c>
			<c id="IR">
				<t id="en">Installation and training</t>
			</c>
			<c id="IS">
				<t id="en">Invoicing</t>
			</c>
			<c id="KO">
				<t id="en">Koshering</t>
			</c>
			<c id="L1">
				<t id="en">Carrier count</t>
			</c>
			<c id="LA">
				<t id="en">Labelling</t>
			</c>
			<c id="LAA">
				<t id="en">Labour</t>
			</c>
			<c id="LAB">
				<t id="en">Repair and return</t>
			</c>
			<c id="LF">
				<t id="en">Legalisation</t>
			</c>
			<c id="MAE">
				<t id="en">Mounting</t>
			</c>
			<c id="MI">
				<t id="en">Mail invoice</t>
			</c>
			<c id="ML">
				<t id="en">Mail invoice to each location</t>
			</c>
			<c id="NAA">
				<t id="en">Non-returnable containers</t>
			</c>
			<c id="OA">
				<t id="en">Outside cable connectors</t>
			</c>
			<c id="PA">
				<t id="en">Invoice with shipment</t>
			</c>
			<c id="PAA">
				<t id="en">Phosphatizing (steel treatment)</t>
			</c>
			<c id="PC">
				<t id="en">Packing</t>
			</c>
			<c id="PL">
				<t id="en">Palletizing</t>
			</c>
			<c id="PRV">
				<t id="en">Price variation</t>
			</c>
			<c id="RAB">
				<t id="en">Repacking</t>
			</c>
			<c id="RAC">
				<t id="en">Repair</t>
			</c>
			<c id="RAD">
				<t id="en">Returnable container</t>
			</c>
			<c id="RAF">
				<t id="en">Restocking</t>
			</c>
			<c id="RE">
				<t id="en">Re-delivery</t>
			</c>
			<c id="RF">
				<t id="en">Refurbishing</t>
			</c>
			<c id="RH">
				<t id="en">Rail wagon hire</t>
			</c>
			<c id="RV">
				<t id="en">Loading</t>
			</c>
			<c id="SA">
				<t id="en">Salvaging</t>
			</c>
			<c id="SAA">
				<t id="en">Shipping and handling</t>
			</c>
			<c id="SAD">
				<t id="en">Special packaging</t>
			</c>
			<c id="SAE">
				<t id="en">Stamping</t>
			</c>
			<c id="SAI">
				<t id="en">Consignee unload</t>
			</c>
			<c id="SG">
				<t id="en">Shrink-wrap</t>
			</c>
			<c id="SH">
				<t id="en">Special handling</t>
			</c>
			<c id="SM">
				<t id="en">Special finish</t>
			</c>
			<c id="SU">
				<t id="en">Set-up</t>
			</c>
			<c id="TAB">
				<t id="en">Tank renting</t>
			</c>
			<c id="TAC">
				<t id="en">Testing</t>
			</c>
			<c id="TT">
				<t id="en">Transportation - third party billing</t>
			</c>
			<c id="TV">
				<t id="en">Transportation by vendor</t>
			</c>
			<c id="V1">
				<t id="en">Drop yard</t>
			</c>
			<c id="V2">
				<t id="en">Drop dock</t>
			</c>
			<c id="WH">
				<t id="en">Warehousing</t>
			</c>
			<c id="XAA">
				<t id="en">Combine all same day shipment</t>
			</c>
			<c id="YY">
				<t id="en">Split pick-up</t>
			</c>
			<c id="ZZZ">
				<t id="en">Mutually defined</t>
			</c>
		</cl>
		<cl id="uncl2005">
			<c id="3">
				<t id="en">Invoice document issue date time</t>
			</c>
			<c id="35">
				<t id="en">Delivery date/time, actual</t>
			</c>
			<c id="432">
				<t id="en">Paid to date</t>
			</c>
		</cl>
		<cl id="uncl1153">
			<c id="AAA">
				<t id="en">Order acknowledgement document identifier</t>
			</c>
			<c id="AAB">
				<t id="en">Proforma invoice document identifier</t>
			</c>
			<c id="AAC">
				<t id="en">Documentary credit identifier</t>
			</c>
			<c id="AAD">
				<t id="en">Contract document addendum identifier</t>
			</c>
			<c id="AAE">
				<t id="en">Goods declaration number</t>
			</c>
			<c id="AAF">
				<t id="en">Debit card number</t>
			</c>
			<c id="AAG">
				<t id="en">Offer number</t>
			</c>
			<c id="AAH">
				<t id="en">Bank's batch interbank transaction reference number</t>
			</c>
			<c id="AAI">
				<t id="en">Bank's individual interbank transaction reference number</t>
			</c>
			<c id="AAJ">
				<t id="en">Delivery order number</t>
			</c>
			<c id="AAK">
				<t id="en">Despatch advice number</t>
			</c>
			<c id="AAL">
				<t id="en">Drawing number</t>
			</c>
			<c id="AAM">
				<t id="en">Waybill number</t>
			</c>
			<c id="AAN">
				<t id="en">Delivery schedule number</t>
			</c>
			<c id="AAO">
				<t id="en">Consignment identifier, consignee assigned</t>
			</c>
			<c id="AAP">
				<t id="en">Partial shipment identifier</t>
			</c>
			<c id="AAQ">
				<t id="en">Transport equipment identifier</t>
			</c>
			<c id="AAR">
				<t id="en">Municipality assigned business registry number</t>
			</c>
			<c id="AAS">
				<t id="en">Transport contract document identifier</t>
			</c>
			<c id="AAT">
				<t id="en">Master label number</t>
			</c>
			<c id="AAU">
				<t id="en">Despatch note document identifier</t>
			</c>
			<c id="AAV">
				<t id="en">Enquiry number</t>
			</c>
			<c id="AAW">
				<t id="en">Docket number</t>
			</c>
			<c id="AAX">
				<t id="en">Civil action number</t>
			</c>
			<c id="AAY">
				<t id="en">Carrier's agent reference number</t>
			</c>
			<c id="AAZ">
				<t id="en">Standard Carrier Alpha Code (SCAC) number</t>
			</c>
			<c id="ABA">
				<t id="en">Customs valuation decision number</t>
			</c>
			<c id="ABB">
				<t id="en">End use authorization number</t>
			</c>
			<c id="ABC">
				<t id="en">Anti-dumping case number</t>
			</c>
			<c id="ABD">
				<t id="en">Customs tariff number</t>
			</c>
			<c id="ABE">
				<t id="en">Declarant's reference number</t>
			</c>
			<c id="ABF">
				<t id="en">Repair estimate number</t>
			</c>
			<c id="ABG">
				<t id="en">Customs decision request number</t>
			</c>
			<c id="ABH">
				<t id="en">Sub-house bill of lading number</t>
			</c>
			<c id="ABI">
				<t id="en">Tax payment identifier</t>
			</c>
			<c id="ABJ">
				<t id="en">Quota number</t>
			</c>
			<c id="ABK">
				<t id="en">Transit (onward carriage) guarantee (bond) number</t>
			</c>
			<c id="ABL">
				<t id="en">Customs guarantee number</t>
			</c>
			<c id="ABM">
				<t id="en">Replacing part number</t>
			</c>
			<c id="ABN">
				<t id="en">Seller's catalogue number</t>
			</c>
			<c id="ABO">
				<t id="en">Originator's reference</t>
			</c>
			<c id="ABP">
				<t id="en">Declarant's Customs identity number</t>
			</c>
			<c id="ABQ">
				<t id="en">Importer reference number</t>
			</c>
			<c id="ABR">
				<t id="en">Export clearance instruction reference number</t>
			</c>
			<c id="ABS">
				<t id="en">Import clearance instruction reference number</t>
			</c>
			<c id="ABT">
				<t id="en">Goods declaration document identifier, Customs</t>
			</c>
			<c id="ABU">
				<t id="en">Article number</t>
			</c>
			<c id="ABV">
				<t id="en">Intra-plant routing</t>
			</c>
			<c id="ABW">
				<t id="en">Stock keeping unit number</t>
			</c>
			<c id="ABX">
				<t id="en">Text Element Identifier deletion reference</t>
			</c>
			<c id="ABY">
				<t id="en">Allotment identification (Air)</t>
			</c>
			<c id="ABZ">
				<t id="en">Vehicle licence number</t>
			</c>
			<c id="AC">
				<t id="en">Air cargo transfer manifest</t>
			</c>
			<c id="ACA">
				<t id="en">Cargo acceptance order reference number</t>
			</c>
			<c id="ACB">
				<t id="en">US government agency number</t>
			</c>
			<c id="ACC">
				<t id="en">Shipping unit identification</t>
			</c>
			<c id="ACD">
				<t id="en">Additional reference number</t>
			</c>
			<c id="ACE">
				<t id="en">Related document number</t>
			</c>
			<c id="ACF">
				<t id="en">Addressee reference</t>
			</c>
			<c id="ACG">
				<t id="en">ATA carnet number</t>
			</c>
			<c id="ACH">
				<t id="en">Packaging unit identification</t>
			</c>
			<c id="ACI">
				<t id="en">Outerpackaging unit identification</t>
			</c>
			<c id="ACJ">
				<t id="en">Customer material specification number</t>
			</c>
			<c id="ACK">
				<t id="en">Bank reference</t>
			</c>
			<c id="ACL">
				<t id="en">Principal reference number</t>
			</c>
			<c id="ACN">
				<t id="en">Collection advice document identifier</t>
			</c>
			<c id="ACO">
				<t id="en">Iron charge number</t>
			</c>
			<c id="ACP">
				<t id="en">Hot roll number</t>
			</c>
			<c id="ACQ">
				<t id="en">Cold roll number</t>
			</c>
			<c id="ACR">
				<t id="en">Railway wagon number</t>
			</c>
			<c id="ACT">
				<t id="en">Unique claims reference number of the sender</t>
			</c>
			<c id="ACU">
				<t id="en">Loss/event number</t>
			</c>
			<c id="ACV">
				<t id="en">Estimate order reference number</t>
			</c>
			<c id="ACW">
				<t id="en">Reference number to previous message</t>
			</c>
			<c id="ACX">
				<t id="en">Banker's acceptance</t>
			</c>
			<c id="ACY">
				<t id="en">Duty memo number</t>
			</c>
			<c id="ACZ">
				<t id="en">Equipment transport charge number</t>
			</c>
			<c id="ADA">
				<t id="en">Buyer's item number</t>
			</c>
			<c id="ADB">
				<t id="en">Matured certificate of deposit</t>
			</c>
			<c id="ADC">
				<t id="en">Loan</t>
			</c>
			<c id="ADD">
				<t id="en">Analysis number/test number</t>
			</c>
			<c id="ADE">
				<t id="en">Account number</t>
			</c>
			<c id="ADF">
				<t id="en">Treaty number</t>
			</c>
			<c id="ADG">
				<t id="en">Catastrophe number</t>
			</c>
			<c id="ADI">
				<t id="en">Bureau signing (statement reference)</t>
			</c>
			<c id="ADJ">
				<t id="en">Company / syndicate reference 1</t>
			</c>
			<c id="ADK">
				<t id="en">Company / syndicate reference 2</t>
			</c>
			<c id="ADL">
				<t id="en">Ordering customer consignment reference number</t>
			</c>
			<c id="ADM">
				<t id="en">Shipowner's authorization number</t>
			</c>
			<c id="ADN">
				<t id="en">Inland transport order number</t>
			</c>
			<c id="ADO">
				<t id="en">Container work order reference number</t>
			</c>
			<c id="ADP">
				<t id="en">Statement number</t>
			</c>
			<c id="ADQ">
				<t id="en">Unique market reference</t>
			</c>
			<c id="ADT">
				<t id="en">Group accounting</t>
			</c>
			<c id="ADU">
				<t id="en">Broker reference 1</t>
			</c>
			<c id="ADV">
				<t id="en">Broker reference 2</t>
			</c>
			<c id="ADW">
				<t id="en">Lloyd's claims office reference</t>
			</c>
			<c id="ADX">
				<t id="en">Secure delivery terms and conditions agreement reference</t>
			</c>
			<c id="ADY">
				<t id="en">Report number</t>
			</c>
			<c id="ADZ">
				<t id="en">Trader account number</t>
			</c>
			<c id="AE">
				<t id="en">Authorization for expense (AFE) number</t>
			</c>
			<c id="AEA">
				<t id="en">Government agency reference number</t>
			</c>
			<c id="AEB">
				<t id="en">Assembly number</t>
			</c>
			<c id="AEC">
				<t id="en">Symbol number</t>
			</c>
			<c id="AED">
				<t id="en">Commodity number</t>
			</c>
			<c id="AEE">
				<t id="en">Eur 1 certificate number</t>
			</c>
			<c id="AEF">
				<t id="en">Customer process specification number</t>
			</c>
			<c id="AEG">
				<t id="en">Customer specification number</t>
			</c>
			<c id="AEH">
				<t id="en">Applicable instructions or standards</t>
			</c>
			<c id="AEI">
				<t id="en">Registration number of previous Customs declaration</t>
			</c>
			<c id="AEJ">
				<t id="en">Post-entry reference</t>
			</c>
			<c id="AEK">
				<t id="en">Payment order number</t>
			</c>
			<c id="AEL">
				<t id="en">Delivery number (transport)</t>
			</c>
			<c id="AEM">
				<t id="en">Transport route</t>
			</c>
			<c id="AEN">
				<t id="en">Customer's unit inventory number</t>
			</c>
			<c id="AEO">
				<t id="en">Product reservation number</t>
			</c>
			<c id="AEP">
				<t id="en">Project number</t>
			</c>
			<c id="AEQ">
				<t id="en">Drawing list number</t>
			</c>
			<c id="AER">
				<t id="en">Project specification number</t>
			</c>
			<c id="AES">
				<t id="en">Primary reference</t>
			</c>
			<c id="AET">
				<t id="en">Request for cancellation number</t>
			</c>
			<c id="AEU">
				<t id="en">Supplier's control number</t>
			</c>
			<c id="AEV">
				<t id="en">Shipping note number</t>
			</c>
			<c id="AEW">
				<t id="en">Empty container bill number</t>
			</c>
			<c id="AEX">
				<t id="en">Non-negotiable maritime transport document number</t>
			</c>
			<c id="AEY">
				<t id="en">Substitute air waybill number</t>
			</c>
			<c id="AEZ">
				<t id="en">Despatch note (post parcels) number</t>
			</c>
			<c id="AF">
				<t id="en">Airlines flight identification number</t>
			</c>
			<c id="AFA">
				<t id="en">Through bill of lading number</t>
			</c>
			<c id="AFB">
				<t id="en">Cargo manifest number</t>
			</c>
			<c id="AFC">
				<t id="en">Bordereau number</t>
			</c>
			<c id="AFD">
				<t id="en">Customs item number</t>
			</c>
			<c id="AFE">
				<t id="en">Export Control Commodity number (ECCN)</t>
			</c>
			<c id="AFF">
				<t id="en">Marking/label reference</t>
			</c>
			<c id="AFG">
				<t id="en">Tariff number</t>
			</c>
			<c id="AFH">
				<t id="en">Replenishment purchase order number</t>
			</c>
			<c id="AFI">
				<t id="en">Immediate transportation no. for in bond movement</t>
			</c>
			<c id="AFJ">
				<t id="en">Transportation exportation no. for in bond movement</t>
			</c>
			<c id="AFK">
				<t id="en">Immediate exportation no. for in bond movement</t>
			</c>
			<c id="AFL">
				<t id="en">Associated invoices</t>
			</c>
			<c id="AFM">
				<t id="en">Secondary Customs reference</t>
			</c>
			<c id="AFN">
				<t id="en">Account party's reference</t>
			</c>
			<c id="AFO">
				<t id="en">Beneficiary's reference</t>
			</c>
			<c id="AFP">
				<t id="en">Second beneficiary's reference</t>
			</c>
			<c id="AFQ">
				<t id="en">Applicant's bank reference</t>
			</c>
			<c id="AFR">
				<t id="en">Issuing bank's reference</t>
			</c>
			<c id="AFS">
				<t id="en">Beneficiary's bank reference</t>
			</c>
			<c id="AFT">
				<t id="en">Direct payment valuation number</t>
			</c>
			<c id="AFU">
				<t id="en">Direct payment valuation request number</t>
			</c>
			<c id="AFV">
				<t id="en">Quantity valuation number</t>
			</c>
			<c id="AFW">
				<t id="en">Quantity valuation request number</t>
			</c>
			<c id="AFX">
				<t id="en">Bill of quantities number</t>
			</c>
			<c id="AFY">
				<t id="en">Payment valuation number</t>
			</c>
			<c id="AFZ">
				<t id="en">Situation number</t>
			</c>
			<c id="AGA">
				<t id="en">Agreement to pay number</t>
			</c>
			<c id="AGB">
				<t id="en">Contract party reference number</t>
			</c>
			<c id="AGC">
				<t id="en">Account party's bank reference</t>
			</c>
			<c id="AGD">
				<t id="en">Agent's bank reference</t>
			</c>
			<c id="AGE">
				<t id="en">Agent's reference</t>
			</c>
			<c id="AGF">
				<t id="en">Applicant's reference</t>
			</c>
			<c id="AGG">
				<t id="en">Dispute number</t>
			</c>
			<c id="AGH">
				<t id="en">Credit rating agency's reference number</t>
			</c>
			<c id="AGI">
				<t id="en">Request number</t>
			</c>
			<c id="AGJ">
				<t id="en">Single transaction sequence number</t>
			</c>
			<c id="AGK">
				<t id="en">Application reference number</t>
			</c>
			<c id="AGL">
				<t id="en">Delivery verification certificate</t>
			</c>
			<c id="AGM">
				<t id="en">Number of temporary importation document</t>
			</c>
			<c id="AGN">
				<t id="en">Reference number quoted on statement</t>
			</c>
			<c id="AGO">
				<t id="en">Sender's reference to the original message</t>
			</c>
			<c id="AGP">
				<t id="en">Company issued equipment ID</t>
			</c>
			<c id="AGQ">
				<t id="en">Domestic flight number</t>
			</c>
			<c id="AGR">
				<t id="en">International flight number</t>
			</c>
			<c id="AGS">
				<t id="en">Employer identification number of service bureau</t>
			</c>
			<c id="AGT">
				<t id="en">Service group identification number</t>
			</c>
			<c id="AGU">
				<t id="en">Member number</t>
			</c>
			<c id="AGV">
				<t id="en">Previous member number</t>
			</c>
			<c id="AGW">
				<t id="en">Scheme/plan number</t>
			</c>
			<c id="AGX">
				<t id="en">Previous scheme/plan number</t>
			</c>
			<c id="AGY">
				<t id="en">Receiving party's member identification</t>
			</c>
			<c id="AGZ">
				<t id="en">Payroll number</t>
			</c>
			<c id="AHA">
				<t id="en">Packaging specification number</t>
			</c>
			<c id="AHB">
				<t id="en">Authority issued equipment identification</t>
			</c>
			<c id="AHC">
				<t id="en">Training flight number</t>
			</c>
			<c id="AHD">
				<t id="en">Fund code number</t>
			</c>
			<c id="AHE">
				<t id="en">Signal code number</t>
			</c>
			<c id="AHF">
				<t id="en">Major force program number</t>
			</c>
			<c id="AHG">
				<t id="en">Nomination number</t>
			</c>
			<c id="AHH">
				<t id="en">Laboratory registration number</t>
			</c>
			<c id="AHI">
				<t id="en">Transport contract reference number</t>
			</c>
			<c id="AHJ">
				<t id="en">Payee's reference number</t>
			</c>
			<c id="AHK">
				<t id="en">Payer's reference number</t>
			</c>
			<c id="AHL">
				<t id="en">Creditor's reference number</t>
			</c>
			<c id="AHM">
				<t id="en">Debtor's reference number</t>
			</c>
			<c id="AHN">
				<t id="en">Joint venture reference number</t>
			</c>
			<c id="AHO">
				<t id="en">Chamber of Commerce registration number</t>
			</c>
			<c id="AHP">
				<t id="en">Tax registration number</t>
			</c>
			<c id="AHQ">
				<t id="en">Wool identification number</t>
			</c>
			<c id="AHR">
				<t id="en">Wool tax reference number</t>
			</c>
			<c id="AHS">
				<t id="en">Meat processing establishment registration number</t>
			</c>
			<c id="AHT">
				<t id="en">Quarantine/treatment status reference number</t>
			</c>
			<c id="AHU">
				<t id="en">Request for quote number</t>
			</c>
			<c id="AHV">
				<t id="en">Manual processing authority number</t>
			</c>
			<c id="AHX">
				<t id="en">Rate note number</t>
			</c>
			<c id="AHY">
				<t id="en">Freight Forwarder number</t>
			</c>
			<c id="AHZ">
				<t id="en">Customs release code</t>
			</c>
			<c id="AIA">
				<t id="en">Compliance code number</t>
			</c>
			<c id="AIB">
				<t id="en">Department of transportation bond number</t>
			</c>
			<c id="AIC">
				<t id="en">Export establishment number</t>
			</c>
			<c id="AID">
				<t id="en">Certificate of conformity</t>
			</c>
			<c id="AIE">
				<t id="en">Ministerial certificate of homologation</t>
			</c>
			<c id="AIF">
				<t id="en">Previous delivery instruction number</t>
			</c>
			<c id="AIG">
				<t id="en">Passport number</t>
			</c>
			<c id="AIH">
				<t id="en">Common transaction reference number</t>
			</c>
			<c id="AII">
				<t id="en">Bank's common transaction reference number</t>
			</c>
			<c id="AIJ">
				<t id="en">Customer's individual transaction reference number</t>
			</c>
			<c id="AIK">
				<t id="en">Bank's individual transaction reference number</t>
			</c>
			<c id="AIL">
				<t id="en">Customer's common transaction reference number</t>
			</c>
			<c id="AIM">
				<t id="en">Individual transaction reference number</t>
			</c>
			<c id="AIN">
				<t id="en">Product sourcing agreement number</t>
			</c>
			<c id="AIO">
				<t id="en">Customs transhipment number</t>
			</c>
			<c id="AIP">
				<t id="en">Customs preference inquiry number</t>
			</c>
			<c id="AIQ">
				<t id="en">Packing plant number</t>
			</c>
			<c id="AIR">
				<t id="en">Original certificate number</t>
			</c>
			<c id="AIS">
				<t id="en">Processing plant number</t>
			</c>
			<c id="AIT">
				<t id="en">Slaughter plant number</t>
			</c>
			<c id="AIU">
				<t id="en">Charge card account number</t>
			</c>
			<c id="AIV">
				<t id="en">Event reference number</t>
			</c>
			<c id="AIW">
				<t id="en">Transport section reference number</t>
			</c>
			<c id="AIX">
				<t id="en">Referred product for mechanical analysis</t>
			</c>
			<c id="AIY">
				<t id="en">Referred product for chemical analysis</t>
			</c>
			<c id="AIZ">
				<t id="en">Consolidated invoice number</t>
			</c>
			<c id="AJA">
				<t id="en">Part reference indicator in a drawing</t>
			</c>
			<c id="AJB">
				<t id="en">U.S. Code of Federal Regulations (CFR)</t>
			</c>
			<c id="AJC">
				<t id="en">Purchasing activity clause number</t>
			</c>
			<c id="AJD">
				<t id="en">U.S. Defense Federal Acquisition Regulation Supplement</t>
			</c>
			<c id="AJE">
				<t id="en">Agency clause number</t>
			</c>
			<c id="AJF">
				<t id="en">Circular publication number</t>
			</c>
			<c id="AJG">
				<t id="en">U.S. Federal Acquisition Regulation</t>
			</c>
			<c id="AJH">
				<t id="en">U.S. General Services Administration Regulation</t>
			</c>
			<c id="AJI">
				<t id="en">U.S. Federal Information Resources Management Regulation</t>
			</c>
			<c id="AJJ">
				<t id="en">Paragraph</t>
			</c>
			<c id="AJK">
				<t id="en">Special instructions number</t>
			</c>
			<c id="AJL">
				<t id="en">Site specific procedures, terms, and conditions number</t>
			</c>
			<c id="AJM">
				<t id="en">Master solicitation procedures, terms, and conditions</t>
			</c>
			<c id="AJN">
				<t id="en">U.S. Department of Veterans Affairs Acquisition Regulation</t>
			</c>
			<c id="AJO">
				<t id="en">Military Interdepartmental Purchase Request (MIPR) number</t>
			</c>
			<c id="AJP">
				<t id="en">Foreign military sales number</t>
			</c>
			<c id="AJQ">
				<t id="en">Defense priorities allocation system priority rating</t>
			</c>
			<c id="AJR">
				<t id="en">Wage determination number</t>
			</c>
			<c id="AJS">
				<t id="en">Agreement number</t>
			</c>
			<c id="AJT">
				<t id="en">Standard Industry Classification (SIC) number</t>
			</c>
			<c id="AJU">
				<t id="en">End item number</t>
			</c>
			<c id="AJV">
				<t id="en">Federal supply schedule item number</t>
			</c>
			<c id="AJW">
				<t id="en">Technical document number</t>
			</c>
			<c id="AJX">
				<t id="en">Technical order number</t>
			</c>
			<c id="AJY">
				<t id="en">Suffix</t>
			</c>
			<c id="AJZ">
				<t id="en">Transportation account number</t>
			</c>
			<c id="AKA">
				<t id="en">Container disposition order reference number</t>
			</c>
			<c id="AKB">
				<t id="en">Container prefix</t>
			</c>
			<c id="AKC">
				<t id="en">Transport equipment return reference</t>
			</c>
			<c id="AKD">
				<t id="en">Transport equipment survey reference</t>
			</c>
			<c id="AKE">
				<t id="en">Transport equipment survey report number</t>
			</c>
			<c id="AKF">
				<t id="en">Transport equipment stuffing order</t>
			</c>
			<c id="AKG">
				<t id="en">Vehicle Identification Number (VIN)</t>
			</c>
			<c id="AKH">
				<t id="en">Government bill of lading</t>
			</c>
			<c id="AKI">
				<t id="en">Ordering customer's second reference number</t>
			</c>
			<c id="AKJ">
				<t id="en">Direct debit reference</t>
			</c>
			<c id="AKK">
				<t id="en">Meter reading at the beginning of the delivery</t>
			</c>
			<c id="AKL">
				<t id="en">Meter reading at the end of delivery</t>
			</c>
			<c id="AKM">
				<t id="en">Replenishment purchase order range start number</t>
			</c>
			<c id="AKN">
				<t id="en">Third bank's reference</t>
			</c>
			<c id="AKO">
				<t id="en">Action authorization number</t>
			</c>
			<c id="AKP">
				<t id="en">Appropriation number</t>
			</c>
			<c id="AKQ">
				<t id="en">Product change authority number</t>
			</c>
			<c id="AKR">
				<t id="en">General cargo consignment reference number</t>
			</c>
			<c id="AKS">
				<t id="en">Catalogue sequence number</t>
			</c>
			<c id="AKT">
				<t id="en">Forwarding order number</t>
			</c>
			<c id="AKU">
				<t id="en">Transport equipment survey reference number</t>
			</c>
			<c id="AKV">
				<t id="en">Lease contract reference</t>
			</c>
			<c id="AKW">
				<t id="en">Transport costs reference number</t>
			</c>
			<c id="AKX">
				<t id="en">Transport equipment stripping order</t>
			</c>
			<c id="AKY">
				<t id="en">Prior policy number</t>
			</c>
			<c id="AKZ">
				<t id="en">Policy number</t>
			</c>
			<c id="ALA">
				<t id="en">Procurement budget number</t>
			</c>
			<c id="ALB">
				<t id="en">Domestic inventory management code</t>
			</c>
			<c id="ALC">
				<t id="en">Customer reference number assigned to previous balance of</t>
			</c>
			<c id="ALD">
				<t id="en">Previous credit advice reference number</t>
			</c>
			<c id="ALE">
				<t id="en">Reporting form number</t>
			</c>
			<c id="ALF">
				<t id="en">Authorization number for exception to dangerous goods</t>
			</c>
			<c id="ALG">
				<t id="en">Dangerous goods security number</t>
			</c>
			<c id="ALH">
				<t id="en">Dangerous goods transport licence number</t>
			</c>
			<c id="ALI">
				<t id="en">Previous rental agreement number</t>
			</c>
			<c id="ALJ">
				<t id="en">Next rental agreement reason number</t>
			</c>
			<c id="ALK">
				<t id="en">Consignee's invoice number</t>
			</c>
			<c id="ALL">
				<t id="en">Message batch number</t>
			</c>
			<c id="ALM">
				<t id="en">Previous delivery schedule number</t>
			</c>
			<c id="ALN">
				<t id="en">Physical inventory recount reference number</t>
			</c>
			<c id="ALO">
				<t id="en">Receiving advice number</t>
			</c>
			<c id="ALP">
				<t id="en">Returnable container reference number</t>
			</c>
			<c id="ALQ">
				<t id="en">Returns notice number</t>
			</c>
			<c id="ALR">
				<t id="en">Sales forecast number</t>
			</c>
			<c id="ALS">
				<t id="en">Sales report number</t>
			</c>
			<c id="ALT">
				<t id="en">Previous tax control number</t>
			</c>
			<c id="ALU">
				<t id="en">AGERD (Aerospace Ground Equipment Requirement Data) number</t>
			</c>
			<c id="ALV">
				<t id="en">Registered capital reference</t>
			</c>
			<c id="ALW">
				<t id="en">Standard number of inspection document</t>
			</c>
			<c id="ALX">
				<t id="en">Model</t>
			</c>
			<c id="ALY">
				<t id="en">Financial management reference</t>
			</c>
			<c id="ALZ">
				<t id="en">NOTIfication for COLlection number (NOTICOL)</t>
			</c>
			<c id="AMA">
				<t id="en">Previous request for metered reading reference number</t>
			</c>
			<c id="AMB">
				<t id="en">Next rental agreement number</t>
			</c>
			<c id="AMC">
				<t id="en">Reference number of a request for metered reading</t>
			</c>
			<c id="AMD">
				<t id="en">Hastening number</t>
			</c>
			<c id="AME">
				<t id="en">Repair data request number</t>
			</c>
			<c id="AMF">
				<t id="en">Consumption data request number</t>
			</c>
			<c id="AMG">
				<t id="en">Profile number</t>
			</c>
			<c id="AMH">
				<t id="en">Case number</t>
			</c>
			<c id="AMI">
				<t id="en">Government quality assurance and control level Number</t>
			</c>
			<c id="AMJ">
				<t id="en">Payment plan reference</t>
			</c>
			<c id="AMK">
				<t id="en">Replaced meter unit number</t>
			</c>
			<c id="AML">
				<t id="en">Replenishment purchase order range end number</t>
			</c>
			<c id="AMM">
				<t id="en">Insurer assigned reference number</t>
			</c>
			<c id="AMN">
				<t id="en">Canadian excise entry number</t>
			</c>
			<c id="AMO">
				<t id="en">Premium rate table</t>
			</c>
			<c id="AMP">
				<t id="en">Advise through bank's reference</t>
			</c>
			<c id="AMQ">
				<t id="en">US, Department of Transportation bond surety code</t>
			</c>
			<c id="AMR">
				<t id="en">US, Food and Drug Administration establishment indicator</t>
			</c>
			<c id="AMS">
				<t id="en">US, Federal Communications Commission (FCC) import</t>
			</c>
			<c id="AMT">
				<t id="en">Goods and Services Tax identification number</t>
			</c>
			<c id="AMU">
				<t id="en">Integrated logistic support cross reference number</t>
			</c>
			<c id="AMV">
				<t id="en">Department number</t>
			</c>
			<c id="AMW">
				<t id="en">Buyer's catalogue number</t>
			</c>
			<c id="AMX">
				<t id="en">Financial settlement party's reference number</t>
			</c>
			<c id="AMY">
				<t id="en">Standard's version number</t>
			</c>
			<c id="AMZ">
				<t id="en">Pipeline number</t>
			</c>
			<c id="ANA">
				<t id="en">Account servicing bank's reference number</t>
			</c>
			<c id="ANB">
				<t id="en">Completed units payment request reference</t>
			</c>
			<c id="ANC">
				<t id="en">Payment in advance request reference</t>
			</c>
			<c id="AND">
				<t id="en">Parent file</t>
			</c>
			<c id="ANE">
				<t id="en">Sub file</t>
			</c>
			<c id="ANF">
				<t id="en">CAD file layer convention</t>
			</c>
			<c id="ANG">
				<t id="en">Technical regulation</t>
			</c>
			<c id="ANH">
				<t id="en">Plot file</t>
			</c>
			<c id="ANI">
				<t id="en">File conversion journal</t>
			</c>
			<c id="ANJ">
				<t id="en">Authorization number</t>
			</c>
			<c id="ANK">
				<t id="en">Reference number assigned by third party</t>
			</c>
			<c id="ANL">
				<t id="en">Deposit reference number</t>
			</c>
			<c id="ANM">
				<t id="en">Named bank's reference</t>
			</c>
			<c id="ANN">
				<t id="en">Drawee's reference</t>
			</c>
			<c id="ANO">
				<t id="en">Case of need party's reference</t>
			</c>
			<c id="ANP">
				<t id="en">Collecting bank's reference</t>
			</c>
			<c id="ANQ">
				<t id="en">Remitting bank's reference</t>
			</c>
			<c id="ANR">
				<t id="en">Principal's bank reference</t>
			</c>
			<c id="ANS">
				<t id="en">Presenting bank's reference</t>
			</c>
			<c id="ANT">
				<t id="en">Consignee's reference</t>
			</c>
			<c id="ANU">
				<t id="en">Financial transaction reference number</t>
			</c>
			<c id="ANV">
				<t id="en">Credit reference number</t>
			</c>
			<c id="ANW">
				<t id="en">Receiving bank's authorization number</t>
			</c>
			<c id="ANX">
				<t id="en">Clearing reference</t>
			</c>
			<c id="ANY">
				<t id="en">Sending bank's reference number</t>
			</c>
			<c id="AOA">
				<t id="en">Documentary payment reference</t>
			</c>
			<c id="AOD">
				<t id="en">Accounting file reference</t>
			</c>
			<c id="AOE">
				<t id="en">Sender's file reference number</t>
			</c>
			<c id="AOF">
				<t id="en">Receiver's file reference number</t>
			</c>
			<c id="AOG">
				<t id="en">Source document internal reference</t>
			</c>
			<c id="AOH">
				<t id="en">Principal's reference</t>
			</c>
			<c id="AOI">
				<t id="en">Debit reference number</t>
			</c>
			<c id="AOJ">
				<t id="en">Calendar</t>
			</c>
			<c id="AOK">
				<t id="en">Work shift</t>
			</c>
			<c id="AOL">
				<t id="en">Work breakdown structure</t>
			</c>
			<c id="AOM">
				<t id="en">Organisation breakdown structure</t>
			</c>
			<c id="AON">
				<t id="en">Work task charge number</t>
			</c>
			<c id="AOO">
				<t id="en">Functional work group</t>
			</c>
			<c id="AOP">
				<t id="en">Work team</t>
			</c>
			<c id="AOQ">
				<t id="en">Department</t>
			</c>
			<c id="AOR">
				<t id="en">Statement of work</t>
			</c>
			<c id="AOS">
				<t id="en">Work package</t>
			</c>
			<c id="AOT">
				<t id="en">Planning package</t>
			</c>
			<c id="AOU">
				<t id="en">Cost account</t>
			</c>
			<c id="AOV">
				<t id="en">Work order</t>
			</c>
			<c id="AOW">
				<t id="en">Transportation Control Number (TCN)</t>
			</c>
			<c id="AOX">
				<t id="en">Constraint notation</t>
			</c>
			<c id="AOY">
				<t id="en">ETERMS reference</t>
			</c>
			<c id="AOZ">
				<t id="en">Implementation version number</t>
			</c>
			<c id="AP">
				<t id="en">Accounts receivable number</t>
			</c>
			<c id="APA">
				<t id="en">Incorporated legal reference</t>
			</c>
			<c id="APB">
				<t id="en">Payment instalment reference number</t>
			</c>
			<c id="APC">
				<t id="en">Equipment owner reference number</t>
			</c>
			<c id="APD">
				<t id="en">Cedent's claim number</t>
			</c>
			<c id="APE">
				<t id="en">Reinsurer's claim number</t>
			</c>
			<c id="APF">
				<t id="en">Price/sales catalogue response reference number</t>
			</c>
			<c id="APG">
				<t id="en">General purpose message reference number</t>
			</c>
			<c id="APH">
				<t id="en">Invoicing data sheet reference number</t>
			</c>
			<c id="API">
				<t id="en">Inventory report reference number</t>
			</c>
			<c id="APJ">
				<t id="en">Ceiling formula reference number</t>
			</c>
			<c id="APK">
				<t id="en">Price variation formula reference number</t>
			</c>
			<c id="APL">
				<t id="en">Reference to account servicing bank's message</t>
			</c>
			<c id="APM">
				<t id="en">Party sequence number</t>
			</c>
			<c id="APN">
				<t id="en">Purchaser's request reference</t>
			</c>
			<c id="APO">
				<t id="en">Contractor request reference</t>
			</c>
			<c id="APP">
				<t id="en">Accident reference number</t>
			</c>
			<c id="APQ">
				<t id="en">Commercial account summary reference number</t>
			</c>
			<c id="APR">
				<t id="en">Contract breakdown reference</t>
			</c>
			<c id="APS">
				<t id="en">Contractor registration number</t>
			</c>
			<c id="APT">
				<t id="en">Applicable coefficient identification number</t>
			</c>
			<c id="APU">
				<t id="en">Special budget account number</t>
			</c>
			<c id="APV">
				<t id="en">Authorisation for repair reference</t>
			</c>
			<c id="APW">
				<t id="en">Manufacturer defined repair rates reference</t>
			</c>
			<c id="APX">
				<t id="en">Original submitter log number</t>
			</c>
			<c id="APY">
				<t id="en">Original submitter, parent Data Maintenance Request (DMR)</t>
			</c>
			<c id="APZ">
				<t id="en">Original submitter, child Data Maintenance Request (DMR)</t>
			</c>
			<c id="AQA">
				<t id="en">Entry point assessment log number</t>
			</c>
			<c id="AQB">
				<t id="en">Entry point assessment log number, parent DMR</t>
			</c>
			<c id="AQC">
				<t id="en">Entry point assessment log number, child DMR</t>
			</c>
			<c id="AQD">
				<t id="en">Data structure tag</t>
			</c>
			<c id="AQE">
				<t id="en">Central secretariat log number</t>
			</c>
			<c id="AQF">
				<t id="en">Central secretariat log number, parent Data Maintenance</t>
			</c>
			<c id="AQG">
				<t id="en">Central secretariat log number, child Data Maintenance</t>
			</c>
			<c id="AQH">
				<t id="en">International assessment log number</t>
			</c>
			<c id="AQI">
				<t id="en">International assessment log number, parent Data</t>
			</c>
			<c id="AQJ">
				<t id="en">International assessment log number, child Data Maintenance</t>
			</c>
			<c id="AQK">
				<t id="en">Status report number</t>
			</c>
			<c id="AQL">
				<t id="en">Message design group number</t>
			</c>
			<c id="AQM">
				<t id="en">US Customs Service (USCS) entry code</t>
			</c>
			<c id="AQN">
				<t id="en">Beginning job sequence number</t>
			</c>
			<c id="AQO">
				<t id="en">Sender's clause number</t>
			</c>
			<c id="AQP">
				<t id="en">Dun and Bradstreet Canada's 8 digit Standard Industrial</t>
			</c>
			<c id="AQQ">
				<t id="en">Activite Principale Exercee (APE) identifier</t>
			</c>
			<c id="AQR">
				<t id="en">Dun and Bradstreet US 8 digit Standard Industrial</t>
			</c>
			<c id="AQS">
				<t id="en">Nomenclature Activity Classification Economy (NACE)</t>
			</c>
			<c id="AQT">
				<t id="en">Norme Activite Francaise (NAF) identifier</t>
			</c>
			<c id="AQU">
				<t id="en">Registered contractor activity type</t>
			</c>
			<c id="AQV">
				<t id="en">Statistic Bundes Amt (SBA) identifier</t>
			</c>
			<c id="AQW">
				<t id="en">State or province assigned entity identification</t>
			</c>
			<c id="AQX">
				<t id="en">Institute of Security and Future Market Development (ISFMD)</t>
			</c>
			<c id="AQY">
				<t id="en">File identification number</t>
			</c>
			<c id="AQZ">
				<t id="en">Bankruptcy procedure number</t>
			</c>
			<c id="ARA">
				<t id="en">National government business identification number</t>
			</c>
			<c id="ARB">
				<t id="en">Prior Data Universal Number System (DUNS) number</t>
			</c>
			<c id="ARC">
				<t id="en">Companies Registry Office (CRO) number</t>
			</c>
			<c id="ARD">
				<t id="en">Costa Rican judicial number</t>
			</c>
			<c id="ARE">
				<t id="en">Numero de Identificacion Tributaria (NIT)</t>
			</c>
			<c id="ARF">
				<t id="en">Patron number</t>
			</c>
			<c id="ARG">
				<t id="en">Registro Informacion Fiscal (RIF) number</t>
			</c>
			<c id="ARH">
				<t id="en">Registro Unico de Contribuyente (RUC) number</t>
			</c>
			<c id="ARI">
				<t id="en">Tokyo SHOKO Research (TSR) business identifier</t>
			</c>
			<c id="ARJ">
				<t id="en">Personal identity card number</t>
			</c>
			<c id="ARK">
				<t id="en">Systeme Informatique pour le Repertoire des ENtreprises</t>
			</c>
			<c id="ARL">
				<t id="en">Systeme Informatique pour le Repertoire des ETablissements</t>
			</c>
			<c id="ARM">
				<t id="en">Publication issue number</t>
			</c>
			<c id="ARN">
				<t id="en">Original filing number</t>
			</c>
			<c id="ARO">
				<t id="en">Document page identifier</t>
			</c>
			<c id="ARP">
				<t id="en">Public filing registration number</t>
			</c>
			<c id="ARQ">
				<t id="en">Regiristo Federal de Contribuyentes</t>
			</c>
			<c id="ARR">
				<t id="en">Social security number</t>
			</c>
			<c id="ARS">
				<t id="en">Document volume number</t>
			</c>
			<c id="ART">
				<t id="en">Book number</t>
			</c>
			<c id="ARU">
				<t id="en">Stock exchange company identifier</t>
			</c>
			<c id="ARV">
				<t id="en">Imputation account</t>
			</c>
			<c id="ARW">
				<t id="en">Financial phase reference</t>
			</c>
			<c id="ARX">
				<t id="en">Technical phase reference</t>
			</c>
			<c id="ARY">
				<t id="en">Prior contractor registration number</t>
			</c>
			<c id="ARZ">
				<t id="en">Stock adjustment number</t>
			</c>
			<c id="ASA">
				<t id="en">Dispensation reference</t>
			</c>
			<c id="ASB">
				<t id="en">Investment reference number</t>
			</c>
			<c id="ASC">
				<t id="en">Assuming company</t>
			</c>
			<c id="ASD">
				<t id="en">Budget chapter</t>
			</c>
			<c id="ASE">
				<t id="en">Duty free products security number</t>
			</c>
			<c id="ASF">
				<t id="en">Duty free products receipt authorisation number</t>
			</c>
			<c id="ASG">
				<t id="en">Party information message reference</t>
			</c>
			<c id="ASH">
				<t id="en">Formal statement reference</t>
			</c>
			<c id="ASI">
				<t id="en">Proof of delivery reference number</t>
			</c>
			<c id="ASJ">
				<t id="en">Supplier's credit claim reference number</t>
			</c>
			<c id="ASK">
				<t id="en">Picture of actual product</t>
			</c>
			<c id="ASL">
				<t id="en">Picture of a generic product</t>
			</c>
			<c id="ASM">
				<t id="en">Trading partner identification number</t>
			</c>
			<c id="ASN">
				<t id="en">Prior trading partner identification number</t>
			</c>
			<c id="ASO">
				<t id="en">Password</t>
			</c>
			<c id="ASP">
				<t id="en">Formal report number</t>
			</c>
			<c id="ASQ">
				<t id="en">Fund account number</t>
			</c>
			<c id="ASR">
				<t id="en">Safe custody number</t>
			</c>
			<c id="ASS">
				<t id="en">Master account number</t>
			</c>
			<c id="AST">
				<t id="en">Group reference number</t>
			</c>
			<c id="ASU">
				<t id="en">Accounting transmission number</t>
			</c>
			<c id="ASV">
				<t id="en">Product data file number</t>
			</c>
			<c id="ASW">
				<t id="en">Cadastro Geral do Contribuinte (CGC)</t>
			</c>
			<c id="ASX">
				<t id="en">Foreign resident identification number</t>
			</c>
			<c id="ASY">
				<t id="en">CD-ROM</t>
			</c>
			<c id="ASZ">
				<t id="en">Physical medium</t>
			</c>
			<c id="ATA">
				<t id="en">Financial cancellation reference number</t>
			</c>
			<c id="ATB">
				<t id="en">Purchase for export Customs agreement number</t>
			</c>
			<c id="ATC">
				<t id="en">Judgment number</t>
			</c>
			<c id="ATD">
				<t id="en">Secretariat number</t>
			</c>
			<c id="ATE">
				<t id="en">Previous banking status message reference</t>
			</c>
			<c id="ATF">
				<t id="en">Last received banking status message reference</t>
			</c>
			<c id="ATG">
				<t id="en">Bank's documentary procedure reference</t>
			</c>
			<c id="ATH">
				<t id="en">Customer's documentary procedure reference</t>
			</c>
			<c id="ATI">
				<t id="en">Safe deposit box number</t>
			</c>
			<c id="ATJ">
				<t id="en">Receiving Bankgiro number</t>
			</c>
			<c id="ATK">
				<t id="en">Sending Bankgiro number</t>
			</c>
			<c id="ATL">
				<t id="en">Bankgiro reference</t>
			</c>
			<c id="ATM">
				<t id="en">Guarantee number</t>
			</c>
			<c id="ATN">
				<t id="en">Collection instrument number</t>
			</c>
			<c id="ATO">
				<t id="en">Converted Postgiro number</t>
			</c>
			<c id="ATP">
				<t id="en">Cost centre alignment number</t>
			</c>
			<c id="ATQ">
				<t id="en">Kamer Van Koophandel (KVK) number</t>
			</c>
			<c id="ATR">
				<t id="en">Institut Belgo-Luxembourgeois de Codification (IBLC) number</t>
			</c>
			<c id="ATS">
				<t id="en">External object reference</t>
			</c>
			<c id="ATT">
				<t id="en">Exceptional transport authorisation number</t>
			</c>
			<c id="ATU">
				<t id="en">Clave Unica de Identificacion Tributaria (CUIT)</t>
			</c>
			<c id="ATV">
				<t id="en">Registro Unico Tributario (RUT)</t>
			</c>
			<c id="ATW">
				<t id="en">Flat rack container bundle identification number</t>
			</c>
			<c id="ATX">
				<t id="en">Transport equipment acceptance order reference</t>
			</c>
			<c id="ATY">
				<t id="en">Transport equipment release order reference</t>
			</c>
			<c id="ATZ">
				<t id="en">Ship's stay reference number</t>
			</c>
			<c id="AU">
				<t id="en">Authorization to meet competition number</t>
			</c>
			<c id="AUA">
				<t id="en">Place of positioning reference</t>
			</c>
			<c id="AUB">
				<t id="en">Party reference</t>
			</c>
			<c id="AUC">
				<t id="en">Issued prescription identification</t>
			</c>
			<c id="AUD">
				<t id="en">Collection reference</t>
			</c>
			<c id="AUE">
				<t id="en">Travel service</t>
			</c>
			<c id="AUF">
				<t id="en">Consignment stock contract</t>
			</c>
			<c id="AUG">
				<t id="en">Importer's letter of credit reference</t>
			</c>
			<c id="AUH">
				<t id="en">Performed prescription identification</t>
			</c>
			<c id="AUI">
				<t id="en">Image reference</t>
			</c>
			<c id="AUJ">
				<t id="en">Proposed purchase order reference number</t>
			</c>
			<c id="AUK">
				<t id="en">Application for financial support reference number</t>
			</c>
			<c id="AUL">
				<t id="en">Manufacturing quality agreement number</t>
			</c>
			<c id="AUM">
				<t id="en">Software editor reference</t>
			</c>
			<c id="AUN">
				<t id="en">Software reference</t>
			</c>
			<c id="AUO">
				<t id="en">Software quality reference</t>
			</c>
			<c id="AUP">
				<t id="en">Consolidated orders' reference</t>
			</c>
			<c id="AUQ">
				<t id="en">Customs binding ruling number</t>
			</c>
			<c id="AUR">
				<t id="en">Customs non-binding ruling number</t>
			</c>
			<c id="AUS">
				<t id="en">Delivery route reference</t>
			</c>
			<c id="AUT">
				<t id="en">Net area supplier reference</t>
			</c>
			<c id="AUU">
				<t id="en">Time series reference</t>
			</c>
			<c id="AUV">
				<t id="en">Connecting point to central grid</t>
			</c>
			<c id="AUW">
				<t id="en">Marketing plan identification number (MPIN)</t>
			</c>
			<c id="AUX">
				<t id="en">Entity reference number, previous</t>
			</c>
			<c id="AUY">
				<t id="en">International Standard Industrial Classification (ISIC)</t>
			</c>
			<c id="AUZ">
				<t id="en">Customs pre-approval ruling number</t>
			</c>
			<c id="AV">
				<t id="en">Account payable number</t>
			</c>
			<c id="AVA">
				<t id="en">First financial institution's transaction reference</t>
			</c>
			<c id="AVB">
				<t id="en">Product characteristics directory</t>
			</c>
			<c id="AVC">
				<t id="en">Supplier's customer reference number</t>
			</c>
			<c id="AVD">
				<t id="en">Inventory report request number</t>
			</c>
			<c id="AVE">
				<t id="en">Metering point</t>
			</c>
			<c id="AVF">
				<t id="en">Passenger reservation number</t>
			</c>
			<c id="AVG">
				<t id="en">Slaughterhouse approval number</t>
			</c>
			<c id="AVH">
				<t id="en">Meat cutting plant approval number</t>
			</c>
			<c id="AVI">
				<t id="en">Customer travel service identifier</t>
			</c>
			<c id="AVJ">
				<t id="en">Export control classification number</t>
			</c>
			<c id="AVK">
				<t id="en">Broker reference 3</t>
			</c>
			<c id="AVL">
				<t id="en">Consignment information</t>
			</c>
			<c id="AVM">
				<t id="en">Goods item information</t>
			</c>
			<c id="AVN">
				<t id="en">Dangerous Goods information</t>
			</c>
			<c id="AVO">
				<t id="en">Pilotage services exemption number</t>
			</c>
			<c id="AVP">
				<t id="en">Person registration number</t>
			</c>
			<c id="AVQ">
				<t id="en">Place of packing approval number</t>
			</c>
			<c id="AVR">
				<t id="en">Original Mandate Reference</t>
			</c>
			<c id="AVS">
				<t id="en">Mandate Reference</t>
			</c>
			<c id="AVT">
				<t id="en">Reservation station indentifier</t>
			</c>
			<c id="AVU">
				<t id="en">Unique goods shipment identifier</t>
			</c>
			<c id="AVV">
				<t id="en">Framework Agreement Number</t>
			</c>
			<c id="AVW">
				<t id="en">Hash value</t>
			</c>
			<c id="AVX">
				<t id="en">Movement reference number</t>
			</c>
			<c id="AVY">
				<t id="en">Economic Operators Registration and Identification Number</t>
			</c>
			<c id="AVZ">
				<t id="en">Local Reference Number</t>
			</c>
			<c id="AWA">
				<t id="en">Rate code number</t>
			</c>
			<c id="AWB">
				<t id="en">Air waybill number</t>
			</c>
			<c id="AWC">
				<t id="en">Documentary credit amendment number</t>
			</c>
			<c id="AWD">
				<t id="en">Advising bank's reference</t>
			</c>
			<c id="AWE">
				<t id="en">Cost centre</t>
			</c>
			<c id="AWF">
				<t id="en">Work item quantity determination</t>
			</c>
			<c id="AWG">
				<t id="en">Internal data process number</t>
			</c>
			<c id="AWH">
				<t id="en">Category of work reference</t>
			</c>
			<c id="AWI">
				<t id="en">Policy form number</t>
			</c>
			<c id="AWJ">
				<t id="en">Net area</t>
			</c>
			<c id="AWK">
				<t id="en">Service provider</t>
			</c>
			<c id="AWL">
				<t id="en">Error position</t>
			</c>
			<c id="AWM">
				<t id="en">Service category reference</t>
			</c>
			<c id="AWN">
				<t id="en">Connected location</t>
			</c>
			<c id="AWO">
				<t id="en">Related party</t>
			</c>
			<c id="AWP">
				<t id="en">Latest accounting entry record reference</t>
			</c>
			<c id="AWQ">
				<t id="en">Accounting entry</t>
			</c>
			<c id="AWR">
				<t id="en">Document reference, original</t>
			</c>
			<c id="AWS">
				<t id="en">Hygienic Certificate number, national</t>
			</c>
			<c id="AWT">
				<t id="en">Administrative Reference Code</t>
			</c>
			<c id="AWU">
				<t id="en">Pick-up sheet number</t>
			</c>
			<c id="AWV">
				<t id="en">Phone number</t>
			</c>
			<c id="AWW">
				<t id="en">Buyer's fund number</t>
			</c>
			<c id="AWX">
				<t id="en">Company trading account number</t>
			</c>
			<c id="AWY">
				<t id="en">Reserved goods identifier</t>
			</c>
			<c id="AWZ">
				<t id="en">Handling and movement reference number</t>
			</c>
			<c id="AXA">
				<t id="en">Instruction to despatch reference number</t>
			</c>
			<c id="AXB">
				<t id="en">Instruction for returns number</t>
			</c>
			<c id="AXC">
				<t id="en">Metered services consumption report number</t>
			</c>
			<c id="AXD">
				<t id="en">Order status enquiry number</t>
			</c>
			<c id="AXE">
				<t id="en">Firm booking reference number</t>
			</c>
			<c id="AXF">
				<t id="en">Product inquiry number</t>
			</c>
			<c id="AXG">
				<t id="en">Split delivery number</t>
			</c>
			<c id="AXH">
				<t id="en">Service relation number</t>
			</c>
			<c id="AXI">
				<t id="en">Serial shipping container code</t>
			</c>
			<c id="AXJ">
				<t id="en">Test specification number</t>
			</c>
			<c id="AXK">
				<t id="en">Transport status report number</t>
			</c>
			<c id="AXL">
				<t id="en">Tooling contract number</t>
			</c>
			<c id="AXM">
				<t id="en">Formula reference number</t>
			</c>
			<c id="AXN">
				<t id="en">Pre-agreement number</t>
			</c>
			<c id="AXO">
				<t id="en">Product certification number</t>
			</c>
			<c id="AXP">
				<t id="en">Consignment contract number</t>
			</c>
			<c id="AXQ">
				<t id="en">Product specification reference number</t>
			</c>
			<c id="AXR">
				<t id="en">Payroll deduction advice reference</t>
			</c>
			<c id="AXS">
				<t id="en">TRACES party identification</t>
			</c>
			<c id="AXU">
				<t id="en">Block Stowage Reference</t>
			</c>
			<c id="BA">
				<t id="en">Beginning meter reading actual</t>
			</c>
			<c id="BC">
				<t id="en">Buyer's contract number</t>
			</c>
			<c id="BD">
				<t id="en">Bid number</t>
			</c>
			<c id="BE">
				<t id="en">Beginning meter reading estimated</t>
			</c>
			<c id="BH">
				<t id="en">House bill of lading number</t>
			</c>
			<c id="BM">
				<t id="en">Bill of lading number</t>
			</c>
			<c id="BN">
				<t id="en">Consignment identifier, carrier assigned</t>
			</c>
			<c id="BO">
				<t id="en">Blanket order number</t>
			</c>
			<c id="BR">
				<t id="en">Broker or sales office number</t>
			</c>
			<c id="BT">
				<t id="en">Batch number/lot number</t>
			</c>
			<c id="BTP">
				<t id="en">Battery and accumulator producer registration number</t>
			</c>
			<c id="BW">
				<t id="en">Blended with number</t>
			</c>
			<c id="CAS">
				<t id="en">IATA Cargo Agent CASS Address number</t>
			</c>
			<c id="CAT">
				<t id="en">Matching of entries, balanced</t>
			</c>
			<c id="CAU">
				<t id="en">Entry flagging</t>
			</c>
			<c id="CAV">
				<t id="en">Matching of entries, unbalanced</t>
			</c>
			<c id="CAW">
				<t id="en">Document reference, internal</t>
			</c>
			<c id="CAX">
				<t id="en">European Value Added Tax identification</t>
			</c>
			<c id="CAY">
				<t id="en">Cost accounting document</t>
			</c>
			<c id="CAZ">
				<t id="en">Grid operator's customer reference number</t>
			</c>
			<c id="CBA">
				<t id="en">Ticket control number</t>
			</c>
			<c id="CBB">
				<t id="en">Order shipment grouping reference</t>
			</c>
			<c id="CD">
				<t id="en">Credit note number</t>
			</c>
			<c id="CEC">
				<t id="en">Ceding company</t>
			</c>
			<c id="CED">
				<t id="en">Debit letter number</t>
			</c>
			<c id="CFE">
				<t id="en">Consignee's further order</t>
			</c>
			<c id="CFF">
				<t id="en">Animal farm licence number</t>
			</c>
			<c id="CFO">
				<t id="en">Consignor's further order</t>
			</c>
			<c id="CG">
				<t id="en">Consignee's order number</t>
			</c>
			<c id="CH">
				<t id="en">Customer catalogue number</t>
			</c>
			<c id="CK">
				<t id="en">Cheque number</t>
			</c>
			<c id="CKN">
				<t id="en">Checking number</t>
			</c>
			<c id="CM">
				<t id="en">Credit memo number</t>
			</c>
			<c id="CMR">
				<t id="en">Road consignment note number</t>
			</c>
			<c id="CN">
				<t id="en">Carrier's reference number</t>
			</c>
			<c id="CNO">
				<t id="en">Charges note document attachment indicator</t>
			</c>
			<c id="COF">
				<t id="en">Call off order number</t>
			</c>
			<c id="CP">
				<t id="en">Condition of purchase document number</t>
			</c>
			<c id="CR">
				<t id="en">Customer reference number</t>
			</c>
			<c id="CRN">
				<t id="en">Transport means journey identifier</t>
			</c>
			<c id="CS">
				<t id="en">Condition of sale document number</t>
			</c>
			<c id="CST">
				<t id="en">Team assignment number</t>
			</c>
			<c id="CT">
				<t id="en">Contract number</t>
			</c>
			<c id="CU">
				<t id="en">Consignment identifier, consignor assigned</t>
			</c>
			<c id="CV">
				<t id="en">Container operators reference number</t>
			</c>
			<c id="CW">
				<t id="en">Package number</t>
			</c>
			<c id="CZ">
				<t id="en">Cooperation contract number</t>
			</c>
			<c id="DA">
				<t id="en">Deferment approval number</t>
			</c>
			<c id="DAN">
				<t id="en">Debit account number</t>
			</c>
			<c id="DB">
				<t id="en">Buyer's debtor number</t>
			</c>
			<c id="DI">
				<t id="en">Distributor invoice number</t>
			</c>
			<c id="DL">
				<t id="en">Debit note number</t>
			</c>
			<c id="DM">
				<t id="en">Document identifier</t>
			</c>
			<c id="DQ">
				<t id="en">Delivery note number</t>
			</c>
			<c id="DR">
				<t id="en">Dock receipt number</t>
			</c>
			<c id="EA">
				<t id="en">Ending meter reading actual</t>
			</c>
			<c id="EB">
				<t id="en">Embargo permit number</t>
			</c>
			<c id="ED">
				<t id="en">Export declaration</t>
			</c>
			<c id="EE">
				<t id="en">Ending meter reading estimated</t>
			</c>
			<c id="EEP">
				<t id="en">Electrical and electronic equipment producer registration</t>
			</c>
			<c id="EI">
				<t id="en">Employer's identification number</t>
			</c>
			<c id="EN">
				<t id="en">Embargo number</t>
			</c>
			<c id="EQ">
				<t id="en">Equipment number</t>
			</c>
			<c id="ER">
				<t id="en">Container/equipment receipt number</t>
			</c>
			<c id="ERN">
				<t id="en">Exporter's reference number</t>
			</c>
			<c id="ET">
				<t id="en">Excess transportation number</t>
			</c>
			<c id="EX">
				<t id="en">Export permit identifier</t>
			</c>
			<c id="FC">
				<t id="en">Fiscal number</t>
			</c>
			<c id="FF">
				<t id="en">Consignment identifier, freight forwarder assigned</t>
			</c>
			<c id="FI">
				<t id="en">File line identifier</t>
			</c>
			<c id="FLW">
				<t id="en">Flow reference number</t>
			</c>
			<c id="FN">
				<t id="en">Freight bill number</t>
			</c>
			<c id="FO">
				<t id="en">Foreign exchange</t>
			</c>
			<c id="FS">
				<t id="en">Final sequence number</t>
			</c>
			<c id="FT">
				<t id="en">Free zone identifier</t>
			</c>
			<c id="FV">
				<t id="en">File version number</t>
			</c>
			<c id="FX">
				<t id="en">Foreign exchange contract number</t>
			</c>
			<c id="GA">
				<t id="en">Standard's number</t>
			</c>
			<c id="GC">
				<t id="en">Government contract number</t>
			</c>
			<c id="GD">
				<t id="en">Standard's code number</t>
			</c>
			<c id="GDN">
				<t id="en">General declaration number</t>
			</c>
			<c id="GN">
				<t id="en">Government reference number</t>
			</c>
			<c id="HS">
				<t id="en">Harmonised system number</t>
			</c>
			<c id="HWB">
				<t id="en">House waybill number</t>
			</c>
			<c id="IA">
				<t id="en">Internal vendor number</t>
			</c>
			<c id="IB">
				<t id="en">In bond number</t>
			</c>
			<c id="ICA">
				<t id="en">IATA cargo agent code number</t>
			</c>
			<c id="ICE">
				<t id="en">Insurance certificate reference number</t>
			</c>
			<c id="ICO">
				<t id="en">Insurance contract reference number</t>
			</c>
			<c id="II">
				<t id="en">Initial sample inspection report number</t>
			</c>
			<c id="IL">
				<t id="en">Internal order number</t>
			</c>
			<c id="INB">
				<t id="en">Intermediary broker</t>
			</c>
			<c id="INN">
				<t id="en">Interchange number new</t>
			</c>
			<c id="INO">
				<t id="en">Interchange number old</t>
			</c>
			<c id="IP">
				<t id="en">Import permit identifier</t>
			</c>
			<c id="IS">
				<t id="en">Invoice number suffix</t>
			</c>
			<c id="IT">
				<t id="en">Internal customer number</t>
			</c>
			<c id="IV">
				<t id="en">Invoice document identifier</t>
			</c>
			<c id="JB">
				<t id="en">Job number</t>
			</c>
			<c id="JE">
				<t id="en">Ending job sequence number</t>
			</c>
			<c id="LA">
				<t id="en">Shipping label serial number</t>
			</c>
			<c id="LAN">
				<t id="en">Loading authorisation identifier</t>
			</c>
			<c id="LAR">
				<t id="en">Lower number in range</t>
			</c>
			<c id="LB">
				<t id="en">Lockbox</t>
			</c>
			<c id="LC">
				<t id="en">Letter of credit number</t>
			</c>
			<c id="LI">
				<t id="en">Document line identifier</t>
			</c>
			<c id="LO">
				<t id="en">Load planning number</t>
			</c>
			<c id="LRC">
				<t id="en">Reservation office identifier</t>
			</c>
			<c id="LS">
				<t id="en">Bar coded label serial number</t>
			</c>
			<c id="MA">
				<t id="en">Ship notice/manifest number</t>
			</c>
			<c id="MB">
				<t id="en">Master bill of lading number</t>
			</c>
			<c id="MF">
				<t id="en">Manufacturer's part number</t>
			</c>
			<c id="MG">
				<t id="en">Meter unit number</t>
			</c>
			<c id="MH">
				<t id="en">Manufacturing order number</t>
			</c>
			<c id="MR">
				<t id="en">Message recipient</t>
			</c>
			<c id="MRN">
				<t id="en">Mailing reference number</t>
			</c>
			<c id="MS">
				<t id="en">Message sender</t>
			</c>
			<c id="MSS">
				<t id="en">Manufacturer's material safety data sheet number</t>
			</c>
			<c id="MWB">
				<t id="en">Master air waybill number</t>
			</c>
			<c id="NA">
				<t id="en">North American hazardous goods classification number</t>
			</c>
			<c id="NF">
				<t id="en">Nota Fiscal</t>
			</c>
			<c id="OH">
				<t id="en">Current invoice number</t>
			</c>
			<c id="OI">
				<t id="en">Previous invoice number</t>
			</c>
			<c id="ON">
				<t id="en">Order document identifier, buyer assigned</t>
			</c>
			<c id="OP">
				<t id="en">Original purchase order</t>
			</c>
			<c id="OR">
				<t id="en">General order number</t>
			</c>
			<c id="PB">
				<t id="en">Payer's financial institution account number</t>
			</c>
			<c id="PC">
				<t id="en">Production code</t>
			</c>
			<c id="PD">
				<t id="en">Promotion deal number</t>
			</c>
			<c id="PE">
				<t id="en">Plant number</t>
			</c>
			<c id="PF">
				<t id="en">Prime contractor contract number</t>
			</c>
			<c id="PI">
				<t id="en">Price list version number</t>
			</c>
			<c id="PK">
				<t id="en">Packing list number</t>
			</c>
			<c id="PL">
				<t id="en">Price list number</t>
			</c>
			<c id="POR">
				<t id="en">Purchase order response number</t>
			</c>
			<c id="PP">
				<t id="en">Purchase order change number</t>
			</c>
			<c id="PQ">
				<t id="en">Payment reference</t>
			</c>
			<c id="PR">
				<t id="en">Price quote number</t>
			</c>
			<c id="PS">
				<t id="en">Purchase order number suffix</t>
			</c>
			<c id="PW">
				<t id="en">Prior purchase order number</t>
			</c>
			<c id="PY">
				<t id="en">Payee's financial institution account number</t>
			</c>
			<c id="RA">
				<t id="en">Remittance advice number</t>
			</c>
			<c id="RC">
				<t id="en">Rail/road routing code</t>
			</c>
			<c id="RCN">
				<t id="en">Railway consignment note number</t>
			</c>
			<c id="RE">
				<t id="en">Release number</t>
			</c>
			<c id="REN">
				<t id="en">Consignment receipt identifier</t>
			</c>
			<c id="RF">
				<t id="en">Export reference number</t>
			</c>
			<c id="RR">
				<t id="en">Payer's financial institution transit routing No.(ACH transfers)</t>
			</c>
			<c id="RT">
				<t id="en">Payee's financial institution transit routing No.</t>
			</c>
			<c id="SA">
				<t id="en">Sales person number</t>
			</c>
			<c id="SB">
				<t id="en">Sales region number</t>
			</c>
			<c id="SD">
				<t id="en">Sales department number</t>
			</c>
			<c id="SE">
				<t id="en">Serial number</t>
			</c>
			<c id="SEA">
				<t id="en">Allocated seat</t>
			</c>
			<c id="SF">
				<t id="en">Ship from</t>
			</c>
			<c id="SH">
				<t id="en">Previous highest schedule number</t>
			</c>
			<c id="SI">
				<t id="en">SID (Shipper's identifying number for shipment)</t>
			</c>
			<c id="SM">
				<t id="en">Sales office number</t>
			</c>
			<c id="SN">
				<t id="en">Transport equipment seal identifier</t>
			</c>
			<c id="SP">
				<t id="en">Scan line</t>
			</c>
			<c id="SQ">
				<t id="en">Equipment sequence number</t>
			</c>
			<c id="SRN">
				<t id="en">Shipment reference number</t>
			</c>
			<c id="SS">
				<t id="en">Sellers reference number</t>
			</c>
			<c id="STA">
				<t id="en">Station reference number</t>
			</c>
			<c id="SW">
				<t id="en">Swap order number</t>
			</c>
			<c id="SZ">
				<t id="en">Specification number</t>
			</c>
			<c id="TB">
				<t id="en">Trucker's bill of lading</t>
			</c>
			<c id="TCR">
				<t id="en">Terminal operator's consignment reference</t>
			</c>
			<c id="TE">
				<t id="en">Telex message number</t>
			</c>
			<c id="TF">
				<t id="en">Transfer number</t>
			</c>
			<c id="TI">
				<t id="en">TIR carnet number</t>
			</c>
			<c id="TIN">
				<t id="en">Transport instruction number</t>
			</c>
			<c id="TL">
				<t id="en">Tax exemption licence number</t>
			</c>
			<c id="TN">
				<t id="en">Transaction reference number</t>
			</c>
			<c id="TP">
				<t id="en">Test report number</t>
			</c>
			<c id="UAR">
				<t id="en">Upper number of range</t>
			</c>
			<c id="UC">
				<t id="en">Ultimate customer's reference number</t>
			</c>
			<c id="UCN">
				<t id="en">Unique consignment reference number</t>
			</c>
			<c id="UN">
				<t id="en">United Nations Dangerous Goods identifier</t>
			</c>
			<c id="UO">
				<t id="en">Ultimate customer's order number</t>
			</c>
			<c id="URI">
				<t id="en">Uniform Resource Identifier</t>
			</c>
			<c id="VA">
				<t id="en">VAT registration number</t>
			</c>
			<c id="VC">
				<t id="en">Vendor contract number</t>
			</c>
			<c id="VGR">
				<t id="en">Transport equipment gross mass verification reference</t>
			</c>
			<c id="VM">
				<t id="en">Vessel identifier</t>
			</c>
			<c id="VN">
				<t id="en">Order number (vendor)</t>
			</c>
			<c id="VON">
				<t id="en">Voyage number</t>
			</c>
			<c id="VOR">
				<t id="en">Transport equipment gross mass verification order reference</t>
			</c>
			<c id="VP">
				<t id="en">Vendor product number</t>
			</c>
			<c id="VR">
				<t id="en">Vendor ID number</t>
			</c>
			<c id="VS">
				<t id="en">Vendor order number suffix</t>
			</c>
			<c id="VT">
				<t id="en">Motor vehicle identification number</t>
			</c>
			<c id="VV">
				<t id="en">Voucher number</t>
			</c>
			<c id="WE">
				<t id="en">Warehouse entry number</t>
			</c>
			<c id="WM">
				<t id="en">Weight agreement number</t>
			</c>
			<c id="WN">
				<t id="en">Well number</t>
			</c>
			<c id="WR">
				<t id="en">Warehouse receipt number</t>
			</c>
			<c id="WS">
				<t id="en">Warehouse storage location number</t>
			</c>
			<c id="WY">
				<t id="en">Rail waybill number</t>
			</c>
			<c id="XA">
				<t id="en">Company/place registration number</t>
			</c>
			<c id="XC">
				<t id="en">Cargo control number</t>
			</c>
			<c id="XP">
				<t id="en">Previous cargo control number</t>
			</c>
			<c id="ZZZ">
				<t id="en">Mutually defined reference number</t>
			</c>
		</cl>
		<cl id="uncl7143">
			<c id="AA">
				<t id="en">Product version number</t>
			</c>
			<c id="AB">
				<t id="en">Assembly</t>
			</c>
			<c id="AC">
				<t id="en">HIBC (Health Industry Bar Code)</t>
			</c>
			<c id="AD">
				<t id="en">Cold roll number</t>
			</c>
			<c id="AE">
				<t id="en">Hot roll number</t>
			</c>
			<c id="AF">
				<t id="en">Slab number</t>
			</c>
			<c id="AG">
				<t id="en">Software revision number</t>
			</c>
			<c id="AH">
				<t id="en">UPC (Universal Product Code) Consumer package code (1-5-5)</t>
			</c>
			<c id="AI">
				<t id="en">UPC (Universal Product Code) Consumer package code (1-5-5-1)</t>
			</c>
			<c id="AJ">
				<t id="en">Sample number</t>
			</c>
			<c id="AK">
				<t id="en">Pack number</t>
			</c>
			<c id="AL">
				<t id="en">UPC (Universal Product Code) Shipping container code (1-2-5-5)</t>
			</c>
			<c id="AM">
				<t id="en">UPC (Universal Product Code)/EAN (European article number) Shipping container code (1-2-5-5-1)</t>
			</c>
			<c id="AN">
				<t id="en">UPC (Universal Product Code) suffix</t>
			</c>
			<c id="AO">
				<t id="en">State label code</t>
			</c>
			<c id="AP">
				<t id="en">Heat number</t>
			</c>
			<c id="AQ">
				<t id="en">Coupon number</t>
			</c>
			<c id="AR">
				<t id="en">Resource number</t>
			</c>
			<c id="AS">
				<t id="en">Work task number</t>
			</c>
			<c id="AT">
				<t id="en">Price look up number</t>
			</c>
			<c id="AU">
				<t id="en">NSN (North Atlantic Treaty Organization Stock Number)</t>
			</c>
			<c id="AV">
				<t id="en">Refined product code</t>
			</c>
			<c id="AW">
				<t id="en">Exhibit</t>
			</c>
			<c id="AX">
				<t id="en">End item</t>
			</c>
			<c id="AY">
				<t id="en">Federal supply classification</t>
			</c>
			<c id="AZ">
				<t id="en">Engineering data list</t>
			</c>
			<c id="BA">
				<t id="en">Milestone event number</t>
			</c>
			<c id="BB">
				<t id="en">Lot number</t>
			</c>
			<c id="BC">
				<t id="en">National drug code 4-4-2 format</t>
			</c>
			<c id="BD">
				<t id="en">National drug code 5-3-2 format</t>
			</c>
			<c id="BE">
				<t id="en">National drug code 5-4-1 format</t>
			</c>
			<c id="BF">
				<t id="en">National drug code 5-4-2 format</t>
			</c>
			<c id="BG">
				<t id="en">National drug code</t>
			</c>
			<c id="BH">
				<t id="en">Part number</t>
			</c>
			<c id="BI">
				<t id="en">Local Stock Number (LSN)</t>
			</c>
			<c id="BJ">
				<t id="en">Next higher assembly number</t>
			</c>
			<c id="BK">
				<t id="en">Data category</t>
			</c>
			<c id="BL">
				<t id="en">Control number</t>
			</c>
			<c id="BM">
				<t id="en">Special material identification code</t>
			</c>
			<c id="BN">
				<t id="en">Locally assigned control number</t>
			</c>
			<c id="BO">
				<t id="en">Buyer's colour</t>
			</c>
			<c id="BP">
				<t id="en">Buyer's part number</t>
			</c>
			<c id="BQ">
				<t id="en">Variable measure product code</t>
			</c>
			<c id="BR">
				<t id="en">Financial phase</t>
			</c>
			<c id="BS">
				<t id="en">Contract breakdown</t>
			</c>
			<c id="BT">
				<t id="en">Technical phase</t>
			</c>
			<c id="BU">
				<t id="en">Dye lot number</t>
			</c>
			<c id="BV">
				<t id="en">Daily statement of activities</t>
			</c>
			<c id="BW">
				<t id="en">Periodical statement of activities within a bilaterally agreed time period</t>
			</c>
			<c id="BX">
				<t id="en">Calendar week statement of activities</t>
			</c>
			<c id="BY">
				<t id="en">Calendar month statement of activities</t>
			</c>
			<c id="BZ">
				<t id="en">Original equipment number</t>
			</c>
			<c id="CC">
				<t id="en">Industry commodity code</t>
			</c>
			<c id="CG">
				<t id="en">Commodity grouping</t>
			</c>
			<c id="CL">
				<t id="en">Colour number</t>
			</c>
			<c id="CR">
				<t id="en">Contract number</t>
			</c>
			<c id="CV">
				<t id="en">Customs article number</t>
			</c>
			<c id="DR">
				<t id="en">Drawing revision number</t>
			</c>
			<c id="DW">
				<t id="en">Drawing</t>
			</c>
			<c id="EC">
				<t id="en">Engineering change level</t>
			</c>
			<c id="EF">
				<t id="en">Material code</t>
			</c>
			<c id="EMD">
				<t id="en">EMDN (European Medical Device Nomenclature)</t>
			</c>
			<c id="EN">
				<t id="en">International Article Numbering Association (EAN)</t>
			</c>
			<c id="FS">
				<t id="en">Fish species</t>
			</c>
			<c id="GB">
				<t id="en">Buyer's internal product group code</t>
			</c>
			<c id="GMN">
				<t id="en">Global model number</t>
			</c>
			<c id="GN">
				<t id="en">National product group code</t>
			</c>
			<c id="GS">
				<t id="en">General specification number</t>
			</c>
			<c id="HS">
				<t id="en">Harmonised system</t>
			</c>
			<c id="IB">
				<t id="en">ISBN (International Standard Book Number)</t>
			</c>
			<c id="IN">
				<t id="en">Buyer's item number</t>
			</c>
			<c id="IS">
				<t id="en">ISSN (International Standard Serial Number)</t>
			</c>
			<c id="IT">
				<t id="en">Buyer's style number</t>
			</c>
			<c id="IZ">
				<t id="en">Buyer's size code</t>
			</c>
			<c id="MA">
				<t id="en">Machine number</t>
			</c>
			<c id="MF">
				<t id="en">Manufacturer's (producer's) article number</t>
			</c>
			<c id="MN">
				<t id="en">Model number</t>
			</c>
			<c id="MP">
				<t id="en">Product/service identification number</t>
			</c>
			<c id="NB">
				<t id="en">Batch number</t>
			</c>
			<c id="ON">
				<t id="en">Customer order number</t>
			</c>
			<c id="PD">
				<t id="en">Part number description</t>
			</c>
			<c id="PL">
				<t id="en">Purchaser's order line number</t>
			</c>
			<c id="PO">
				<t id="en">Purchase order number</t>
			</c>
			<c id="PPI">
				<t id="en">Phytosanitary Passport identifier</t>
			</c>
			<c id="PV">
				<t id="en">Promotional variant number</t>
			</c>
			<c id="QS">
				<t id="en">Buyer's qualifier for size</t>
			</c>
			<c id="RC">
				<t id="en">Returnable container number</t>
			</c>
			<c id="RN">
				<t id="en">Release number</t>
			</c>
			<c id="RU">
				<t id="en">Run number</t>
			</c>
			<c id="RY">
				<t id="en">Record keeping of model year</t>
			</c>
			<c id="SA">
				<t id="en">Supplier's article number</t>
			</c>
			<c id="SG">
				<t id="en">Standard group of products (mixed assortment)</t>
			</c>
			<c id="SK">
				<t id="en">SKU (Stock keeping unit)</t>
			</c>
			<c id="SN">
				<t id="en">Serial number</t>
			</c>
			<c id="SRS">
				<t id="en">RSK number</t>
			</c>
			<c id="SRT">
				<t id="en">IFLS (Institut Francais du Libre Service) 5 digit product classification code</t>
			</c>
			<c id="SRU">
				<t id="en">IFLS (Institut Francais du Libre Service) 9 digit product classification code</t>
			</c>
			<c id="SRV">
				<t id="en">GS1 Global Trade Item Number</t>
			</c>
			<c id="SRW">
				<t id="en">EDIS (Energy Data Identification System)</t>
			</c>
			<c id="SRX">
				<t id="en">Slaughter number</t>
			</c>
			<c id="SRY">
				<t id="en">Official animal number</t>
			</c>
			<c id="SRZ">
				<t id="en">Harmonized tariff schedule</t>
			</c>
			<c id="SS">
				<t id="en">Supplier's supplier article number</t>
			</c>
			<c id="SSA">
				<t id="en">46 Level DOT Code</t>
			</c>
			<c id="SSB">
				<t id="en">Airline Tariff 6D</t>
			</c>
			<c id="SSC">
				<t id="en">Title 49 Code of Federal Regulations</t>
			</c>
			<c id="SSD">
				<t id="en">International Civil Aviation Administration code</t>
			</c>
			<c id="SSE">
				<t id="en">Hazardous Materials ID DOT</t>
			</c>
			<c id="SSF">
				<t id="en">Endorsement</t>
			</c>
			<c id="SSG">
				<t id="en">Air Force Regulation 71-4</t>
			</c>
			<c id="SSH">
				<t id="en">Breed</t>
			</c>
			<c id="SSI">
				<t id="en">Chemical Abstract Service (CAS) registry number</t>
			</c>
			<c id="SSJ">
				<t id="en">Engine model designation</t>
			</c>
			<c id="SSK">
				<t id="en">Institutional Meat Purchase Specifications (IMPS) Number</t>
			</c>
			<c id="SSL">
				<t id="en">Price Look-Up code (PLU)</t>
			</c>
			<c id="SSM">
				<t id="en">International Maritime Organization (IMO) Code</t>
			</c>
			<c id="SSN">
				<t id="en">Bureau of Explosives 600-A (rail)</t>
			</c>
			<c id="SSO">
				<t id="en">United Nations Dangerous Goods List</t>
			</c>
			<c id="SSP">
				<t id="en">International Code of Botanical Nomenclature (ICBN)</t>
			</c>
			<c id="SSQ">
				<t id="en">International Code of Zoological Nomenclature (ICZN)</t>
			</c>
			<c id="SSR">
				<t id="en">International Code of Nomenclature for Cultivated Plants (ICNCP)</t>
			</c>
			<c id="SSS">
				<t id="en">Distributor’s article identifier</t>
			</c>
			<c id="SST">
				<t id="en">Norwegian Classification system ENVA</t>
			</c>
			<c id="SSU">
				<t id="en">Supplier assigned classification</t>
			</c>
			<c id="SSV">
				<t id="en">Mexican classification system AMECE</t>
			</c>
			<c id="SSW">
				<t id="en">German classification system CCG</t>
			</c>
			<c id="SSX">
				<t id="en">Finnish classification system EANFIN</t>
			</c>
			<c id="SSY">
				<t id="en">Canadian classification system ICC</t>
			</c>
			<c id="SSZ">
				<t id="en">French classification system IFLS5</t>
			</c>
			<c id="ST">
				<t id="en">Style number</t>
			</c>
			<c id="STA">
				<t id="en">Dutch classification system CBL</t>
			</c>
			<c id="STB">
				<t id="en">Japanese classification system JICFS</t>
			</c>
			<c id="STC">
				<t id="en">European Union dairy subsidy eligibility classification</t>
			</c>
			<c id="STD">
				<t id="en">GS1 Spain classification system</t>
			</c>
			<c id="STE">
				<t id="en">GS1 Poland classification system</t>
			</c>
			<c id="STF">
				<t id="en">Federal Agency on Technical Regulating and Metrology of the Russian Federation</t>
			</c>
			<c id="STG">
				<t id="en">Efficient Consumer Response (ECR) Austria classification system</t>
			</c>
			<c id="STH">
				<t id="en">GS1 Italy classification system</t>
			</c>
			<c id="STI">
				<t id="en">CPV (Common Procurement Vocabulary)</t>
			</c>
			<c id="STJ">
				<t id="en">IFDA (International Foodservice Distributors Association)</t>
			</c>
			<c id="STK">
				<t id="en">AHFS (American Hospital Formulary Service) pharmacologic -therapeutic classification</t>
			</c>
			<c id="STL">
				<t id="en">ATC (Anatomical Therapeutic Chemical) classification system</t>
			</c>
			<c id="STM">
				<t id="en">CLADIMED (Classification des Dispositifs Médicaux)</t>
			</c>
			<c id="STN">
				<t id="en">CMDR (Canadian Medical Device Regulations) classification system</t>
			</c>
			<c id="STO">
				<t id="en">CNDM (Classificazione Nazionale dei Dispositivi Medici)</t>
			</c>
			<c id="STP">
				<t id="en">UK DM&amp;D (Dictionary of Medicines &amp; Devices) standard coding scheme</t>
			</c>
			<c id="STQ">
				<t id="en">eCl@ss</t>
			</c>
			<c id="STR">
				<t id="en">EDMA (European Diagnostic Manufacturers Association) Product Classification</t>
			</c>
			<c id="STS">
				<t id="en">EGAR (European Generic Article Register)</t>
			</c>
			<c id="STT">
				<t id="en">GMDN (Global Medical Devices Nomenclature)</t>
			</c>
			<c id="STU">
				<t id="en">GPI (Generic Product Identifier)</t>
			</c>
			<c id="STV">
				<t id="en">HCPCS (Healthcare Common Procedure Coding System)</t>
			</c>
			<c id="STW">
				<t id="en">ICPS (International Classification for Patient Safety)</t>
			</c>
			<c id="STX">
				<t id="en">MedDRA (Medical Dictionary for Regulatory Activities)</t>
			</c>
			<c id="STY">
				<t id="en">Medical Columbus</t>
			</c>
			<c id="STZ">
				<t id="en">NAPCS (North American Product Classification System)</t>
			</c>
			<c id="SUA">
				<t id="en">NHS (National Health Services) eClass</t>
			</c>
			<c id="SUB">
				<t id="en">US FDA (Food and Drug Administration) Product Code Classification Database</t>
			</c>
			<c id="SUC">
				<t id="en">SNOMED CT (Systematized Nomenclature of Medicine-Clinical Terms)</t>
			</c>
			<c id="SUD">
				<t id="en">UMDNS (Universal Medical Device Nomenclature System)</t>
			</c>
			<c id="SUE">
				<t id="en">GS1 Global Returnable Asset Identifier, non-serialised</t>
			</c>
			<c id="SUF">
				<t id="en">IMEI</t>
			</c>
			<c id="SUG">
				<t id="en">Waste Type (EMSA)</t>
			</c>
			<c id="SUH">
				<t id="en">Ship's store classification type</t>
			</c>
			<c id="SUI">
				<t id="en">Emergency fire code</t>
			</c>
			<c id="SUJ">
				<t id="en">Emergency spillage code</t>
			</c>
			<c id="SUK">
				<t id="en">IMDG packing group</t>
			</c>
			<c id="SUL">
				<t id="en">MARPOL Code IBC</t>
			</c>
			<c id="SUM">
				<t id="en">IMDG subsidiary risk class</t>
			</c>
			<c id="TG">
				<t id="en">Transport group number</t>
			</c>
			<c id="TSN">
				<t id="en">Taxonomic Serial Number</t>
			</c>
			<c id="TSO">
				<t id="en">IMDG main hazard class</t>
			</c>
			<c id="TSP">
				<t id="en">EU Combined Nomenclature</t>
			</c>
			<c id="TSQ">
				<t id="en">Therapeutic classification number</t>
			</c>
			<c id="TSR">
				<t id="en">European Waste Catalogue</t>
			</c>
			<c id="TSS">
				<t id="en">Price grouping code</t>
			</c>
			<c id="TST">
				<t id="en">UNSPSC</t>
			</c>
			<c id="TSU">
				<t id="en">EU RoHS Directive</t>
			</c>
			<c id="UA">
				<t id="en">Ultimate customer's article number</t>
			</c>
			<c id="UP">
				<t id="en">UPC (Universal product code)</t>
			</c>
			<c id="VN">
				<t id="en">Vendor item number</t>
			</c>
			<c id="VP">
				<t id="en">Vendor's (seller's) part number</t>
			</c>
			<c id="VS">
				<t id="en">Vendor's supplemental item number</t>
			</c>
			<c id="VX">
				<t id="en">Vendor specification number</t>
			</c>
			<c id="ZZZ">
				<t id="en">Mutually defined</t>
			</c>
		</cl>
		<cl id="unecerec20">
			<c id="1I">
				<t id="en">fixed rate</t>
			</c>
			<c id="2A">
				<t id="en">radian per second</t>
			</c>
			<c id="2B">
				<t id="en">radian per second squared</t>
			</c>
			<c id="2C">
				<t id="en">roentgen</t>
			</c>
			<c id="2G">
				<t id="en">volt AC</t>
			</c>
			<c id="2H">
				<t id="en">volt DC</t>
			</c>
			<c id="2I">
				<t id="en">British thermal unit (international table) per hour</t>
			</c>
			<c id="2J">
				<t id="en">cubic centimetre per second</t>
			</c>
			<c id="2K">
				<t id="en">cubic foot per hour</t>
			</c>
			<c id="2L">
				<t id="en">cubic foot per minute</t>
			</c>
			<c id="2M">
				<t id="en">centimetre per second</t>
			</c>
			<c id="2N">
				<t id="en">decibel</t>
			</c>
			<c id="2P">
				<t id="en">kilobyte</t>
			</c>
			<c id="2Q">
				<t id="en">kilobecquerel</t>
			</c>
			<c id="2R">
				<t id="en">kilocurie</t>
			</c>
			<c id="2U">
				<t id="en">megagram</t>
			</c>
			<c id="2X">
				<t id="en">metre per minute</t>
			</c>
			<c id="2Y">
				<t id="en">milliroentgen</t>
			</c>
			<c id="2Z">
				<t id="en">millivolt</t>
			</c>
			<c id="3B">
				<t id="en">megajoule</t>
			</c>
			<c id="3C">
				<t id="en">manmonth</t>
			</c>
			<c id="4C">
				<t id="en">centistokes</t>
			</c>
			<c id="4G">
				<t id="en">microlitre</t>
			</c>
			<c id="4H">
				<t id="en">micrometre (micron)</t>
			</c>
			<c id="4K">
				<t id="en">milliampere</t>
			</c>
			<c id="4L">
				<t id="en">megabyte</t>
			</c>
			<c id="4M">
				<t id="en">milligram per hour</t>
			</c>
			<c id="4N">
				<t id="en">megabecquerel</t>
			</c>
			<c id="4O">
				<t id="en">microfarad</t>
			</c>
			<c id="4P">
				<t id="en">newton per metre</t>
			</c>
			<c id="4Q">
				<t id="en">ounce inch</t>
			</c>
			<c id="4R">
				<t id="en">ounce foot</t>
			</c>
			<c id="4T">
				<t id="en">picofarad</t>
			</c>
			<c id="4U">
				<t id="en">pound per hour</t>
			</c>
			<c id="4W">
				<t id="en">ton (US) per hour</t>
			</c>
			<c id="4X">
				<t id="en">kilolitre per hour</t>
			</c>
			<c id="5A">
				<t id="en">barrel (US) per minute</t>
			</c>
			<c id="5B">
				<t id="en">batch</t>
			</c>
			<c id="5E">
				<t id="en">MMSCF/day</t>
			</c>
			<c id="5J">
				<t id="en">hydraulic horse power</t>
			</c>
			<c id="10">
				<t id="en">group</t>
			</c>
			<c id="11">
				<t id="en">outfit</t>
			</c>
			<c id="13">
				<t id="en">ration</t>
			</c>
			<c id="14">
				<t id="en">shot</t>
			</c>
			<c id="15">
				<t id="en">stick, military</t>
			</c>
			<c id="20">
				<t id="en">twenty foot container</t>
			</c>
			<c id="21">
				<t id="en">forty foot container</t>
			</c>
			<c id="22">
				<t id="en">decilitre per gram</t>
			</c>
			<c id="23">
				<t id="en">gram per cubic centimetre</t>
			</c>
			<c id="24">
				<t id="en">theoretical pound</t>
			</c>
			<c id="25">
				<t id="en">gram per square centimetre</t>
			</c>
			<c id="27">
				<t id="en">theoretical ton</t>
			</c>
			<c id="28">
				<t id="en">kilogram per square metre</t>
			</c>
			<c id="33">
				<t id="en">kilopascal square metre per gram</t>
			</c>
			<c id="34">
				<t id="en">kilopascal per millimetre</t>
			</c>
			<c id="35">
				<t id="en">millilitre per square centimetre second</t>
			</c>
			<c id="37">
				<t id="en">ounce per square foot</t>
			</c>
			<c id="38">
				<t id="en">ounce per square foot per 0,01inch</t>
			</c>
			<c id="40">
				<t id="en">millilitre per second</t>
			</c>
			<c id="41">
				<t id="en">millilitre per minute</t>
			</c>
			<c id="56">
				<t id="en">sitas</t>
			</c>
			<c id="57">
				<t id="en">mesh</t>
			</c>
			<c id="58">
				<t id="en">net kilogram</t>
			</c>
			<c id="59">
				<t id="en">part per million</t>
			</c>
			<c id="60">
				<t id="en">percent weight</t>
			</c>
			<c id="61">
				<t id="en">part per billion (US)</t>
			</c>
			<c id="74">
				<t id="en">millipascal</t>
			</c>
			<c id="77">
				<t id="en">milli-inch</t>
			</c>
			<c id="80">
				<t id="en">pound per square inch absolute</t>
			</c>
			<c id="81">
				<t id="en">henry</t>
			</c>
			<c id="85">
				<t id="en">foot pound-force</t>
			</c>
			<c id="87">
				<t id="en">pound per cubic foot</t>
			</c>
			<c id="89">
				<t id="en">poise</t>
			</c>
			<c id="91">
				<t id="en">stokes</t>
			</c>
			<c id="A2">
				<t id="en">ampere per centimetre</t>
			</c>
			<c id="A3">
				<t id="en">ampere per millimetre</t>
			</c>
			<c id="A4">
				<t id="en">ampere per square centimetre</t>
			</c>
			<c id="A5">
				<t id="en">ampere square metre</t>
			</c>
			<c id="A6">
				<t id="en">ampere per square metre kelvin squared</t>
			</c>
			<c id="A7">
				<t id="en">ampere per square millimetre</t>
			</c>
			<c id="A8">
				<t id="en">ampere second</t>
			</c>
			<c id="A9">
				<t id="en">rate</t>
			</c>
			<c id="A10">
				<t id="en">ampere square metre per joule second</t>
			</c>
			<c id="A11">
				<t id="en">angstrom</t>
			</c>
			<c id="A12">
				<t id="en">astronomical unit</t>
			</c>
			<c id="A13">
				<t id="en">attojoule</t>
			</c>
			<c id="A14">
				<t id="en">barn</t>
			</c>
			<c id="A15">
				<t id="en">barn per electronvolt</t>
			</c>
			<c id="A16">
				<t id="en">barn per steradian electronvolt</t>
			</c>
			<c id="A17">
				<t id="en">barn per steradian</t>
			</c>
			<c id="A18">
				<t id="en">becquerel per kilogram</t>
			</c>
			<c id="A19">
				<t id="en">becquerel per cubic metre</t>
			</c>
			<c id="A20">
				<t id="en">British thermal unit (international table) per second square foot degree
            Rankine</t>
			</c>
			<c id="A21">
				<t id="en">British thermal unit (international table) per pound degree Rankine</t>
			</c>
			<c id="A22">
				<t id="en">British thermal unit (international table) per second foot degree Rankine</t>
			</c>
			<c id="A23">
				<t id="en">British thermal unit (international table) per hour square foot degree Rankine</t>
			</c>
			<c id="A24">
				<t id="en">candela per square metre</t>
			</c>
			<c id="A26">
				<t id="en">coulomb metre</t>
			</c>
			<c id="A27">
				<t id="en">coulomb metre squared per volt</t>
			</c>
			<c id="A28">
				<t id="en">coulomb per cubic centimetre</t>
			</c>
			<c id="A29">
				<t id="en">coulomb per cubic metre</t>
			</c>
			<c id="A30">
				<t id="en">coulomb per cubic millimetre</t>
			</c>
			<c id="A31">
				<t id="en">coulomb per kilogram second</t>
			</c>
			<c id="A32">
				<t id="en">coulomb per mole</t>
			</c>
			<c id="A33">
				<t id="en">coulomb per square centimetre</t>
			</c>
			<c id="A34">
				<t id="en">coulomb per square metre</t>
			</c>
			<c id="A35">
				<t id="en">coulomb per square millimetre</t>
			</c>
			<c id="A36">
				<t id="en">cubic centimetre per mole</t>
			</c>
			<c id="A37">
				<t id="en">cubic decimetre per mole</t>
			</c>
			<c id="A38">
				<t id="en">cubic metre per coulomb</t>
			</c>
			<c id="A39">
				<t id="en">cubic metre per kilogram</t>
			</c>
			<c id="A40">
				<t id="en">cubic metre per mole</t>
			</c>
			<c id="A41">
				<t id="en">ampere per square metre</t>
			</c>
			<c id="A42">
				<t id="en">curie per kilogram</t>
			</c>
			<c id="A43">
				<t id="en">deadweight tonnage</t>
			</c>
			<c id="A44">
				<t id="en">decalitre</t>
			</c>
			<c id="A45">
				<t id="en">decametre</t>
			</c>
			<c id="A47">
				<t id="en">decitex</t>
			</c>
			<c id="A48">
				<t id="en">degree Rankine</t>
			</c>
			<c id="A49">
				<t id="en">denier</t>
			</c>
			<c id="A53">
				<t id="en">electronvolt</t>
			</c>
			<c id="A54">
				<t id="en">electronvolt per metre</t>
			</c>
			<c id="A55">
				<t id="en">electronvolt square metre</t>
			</c>
			<c id="A56">
				<t id="en">electronvolt square metre per kilogram</t>
			</c>
			<c id="A59">
				<t id="en">8-part cloud cover</t>
			</c>
			<c id="A68">
				<t id="en">exajoule</t>
			</c>
			<c id="A69">
				<t id="en">farad per metre</t>
			</c>
			<c id="A70">
				<t id="en">femtojoule</t>
			</c>
			<c id="A71">
				<t id="en">femtometre</t>
			</c>
			<c id="A73">
				<t id="en">foot per second squared</t>
			</c>
			<c id="A74">
				<t id="en">foot pound-force per second</t>
			</c>
			<c id="A75">
				<t id="en">freight ton</t>
			</c>
			<c id="A76">
				<t id="en">gal</t>
			</c>
			<c id="A84">
				<t id="en">gigacoulomb per cubic metre</t>
			</c>
			<c id="A85">
				<t id="en">gigaelectronvolt</t>
			</c>
			<c id="A86">
				<t id="en">gigahertz</t>
			</c>
			<c id="A87">
				<t id="en">gigaohm</t>
			</c>
			<c id="A88">
				<t id="en">gigaohm metre</t>
			</c>
			<c id="A89">
				<t id="en">gigapascal</t>
			</c>
			<c id="A90">
				<t id="en">gigawatt</t>
			</c>
			<c id="A91">
				<t id="en">gon</t>
			</c>
			<c id="A93">
				<t id="en">gram per cubic metre</t>
			</c>
			<c id="A94">
				<t id="en">gram per mole</t>
			</c>
			<c id="A95">
				<t id="en">gray</t>
			</c>
			<c id="A96">
				<t id="en">gray per second</t>
			</c>
			<c id="A97">
				<t id="en">hectopascal</t>
			</c>
			<c id="A98">
				<t id="en">henry per metre</t>
			</c>
			<c id="A99">
				<t id="en">bit</t>
			</c>
			<c id="AA">
				<t id="en">ball</t>
			</c>
			<c id="AB">
				<t id="en">bulk pack</t>
			</c>
			<c id="ACR">
				<t id="en">acre</t>
			</c>
			<c id="ACT">
				<t id="en">activity</t>
			</c>
			<c id="AD">
				<t id="en">byte</t>
			</c>
			<c id="AE">
				<t id="en">ampere per metre</t>
			</c>
			<c id="AH">
				<t id="en">additional minute</t>
			</c>
			<c id="AI">
				<t id="en">average minute per call</t>
			</c>
			<c id="AK">
				<t id="en">fathom</t>
			</c>
			<c id="AL">
				<t id="en">access line</t>
			</c>
			<c id="AMH">
				<t id="en">ampere hour</t>
			</c>
			<c id="AMP">
				<t id="en">ampere</t>
			</c>
			<c id="ANN">
				<t id="en">year</t>
			</c>
			<c id="APZ">
				<t id="en">troy ounce or apothecary ounce</t>
			</c>
			<c id="AQ">
				<t id="en">anti-hemophilic factor (AHF) unit</t>
			</c>
			<c id="AS">
				<t id="en">assortment</t>
			</c>
			<c id="ASM">
				<t id="en">alcoholic strength by mass</t>
			</c>
			<c id="ASU">
				<t id="en">alcoholic strength by volume</t>
			</c>
			<c id="ATM">
				<t id="en">standard atmosphere</t>
			</c>
			<c id="AWG">
				<t id="en">american wire gauge</t>
			</c>
			<c id="AY">
				<t id="en">assembly</t>
			</c>
			<c id="AZ">
				<t id="en">British thermal unit (international table) per pound</t>
			</c>
			<c id="B1">
				<t id="en">barrel (US) per day</t>
			</c>
			<c id="B3">
				<t id="en">batting pound</t>
			</c>
			<c id="B4">
				<t id="en">barrel, imperial</t>
			</c>
			<c id="B7">
				<t id="en">cycle</t>
			</c>
			<c id="B8">
				<t id="en">joule per cubic metre</t>
			</c>
			<c id="B10">
				<t id="en">bit per second</t>
			</c>
			<c id="B11">
				<t id="en">joule per kilogram kelvin</t>
			</c>
			<c id="B12">
				<t id="en">joule per metre</t>
			</c>
			<c id="B13">
				<t id="en">joule per square metre</t>
			</c>
			<c id="B14">
				<t id="en">joule per metre to the fourth power</t>
			</c>
			<c id="B15">
				<t id="en">joule per mole</t>
			</c>
			<c id="B16">
				<t id="en">joule per mole kelvin</t>
			</c>
			<c id="B17">
				<t id="en">credit</t>
			</c>
			<c id="B18">
				<t id="en">joule second</t>
			</c>
			<c id="B19">
				<t id="en">digit</t>
			</c>
			<c id="B20">
				<t id="en">joule square metre per kilogram</t>
			</c>
			<c id="B21">
				<t id="en">kelvin per watt</t>
			</c>
			<c id="B22">
				<t id="en">kiloampere</t>
			</c>
			<c id="B23">
				<t id="en">kiloampere per square metre</t>
			</c>
			<c id="B24">
				<t id="en">kiloampere per metre</t>
			</c>
			<c id="B25">
				<t id="en">kilobecquerel per kilogram</t>
			</c>
			<c id="B26">
				<t id="en">kilocoulomb</t>
			</c>
			<c id="B27">
				<t id="en">kilocoulomb per cubic metre</t>
			</c>
			<c id="B28">
				<t id="en">kilocoulomb per square metre</t>
			</c>
			<c id="B29">
				<t id="en">kiloelectronvolt</t>
			</c>
			<c id="B30">
				<t id="en">gibibit</t>
			</c>
			<c id="B31">
				<t id="en">kilogram metre per second</t>
			</c>
			<c id="B32">
				<t id="en">kilogram metre squared</t>
			</c>
			<c id="B33">
				<t id="en">kilogram metre squared per second</t>
			</c>
			<c id="B34">
				<t id="en">kilogram per cubic decimetre</t>
			</c>
			<c id="B35">
				<t id="en">kilogram per litre</t>
			</c>
			<c id="B41">
				<t id="en">kilojoule per kelvin</t>
			</c>
			<c id="B42">
				<t id="en">kilojoule per kilogram</t>
			</c>
			<c id="B43">
				<t id="en">kilojoule per kilogram kelvin</t>
			</c>
			<c id="B44">
				<t id="en">kilojoule per mole</t>
			</c>
			<c id="B45">
				<t id="en">kilomole</t>
			</c>
			<c id="B46">
				<t id="en">kilomole per cubic metre</t>
			</c>
			<c id="B47">
				<t id="en">kilonewton</t>
			</c>
			<c id="B48">
				<t id="en">kilonewton metre</t>
			</c>
			<c id="B49">
				<t id="en">kiloohm</t>
			</c>
			<c id="B50">
				<t id="en">kiloohm metre</t>
			</c>
			<c id="B52">
				<t id="en">kilosecond</t>
			</c>
			<c id="B53">
				<t id="en">kilosiemens</t>
			</c>
			<c id="B54">
				<t id="en">kilosiemens per metre</t>
			</c>
			<c id="B55">
				<t id="en">kilovolt per metre</t>
			</c>
			<c id="B56">
				<t id="en">kiloweber per metre</t>
			</c>
			<c id="B57">
				<t id="en">light year</t>
			</c>
			<c id="B58">
				<t id="en">litre per mole</t>
			</c>
			<c id="B59">
				<t id="en">lumen hour</t>
			</c>
			<c id="B60">
				<t id="en">lumen per square metre</t>
			</c>
			<c id="B61">
				<t id="en">lumen per watt</t>
			</c>
			<c id="B62">
				<t id="en">lumen second</t>
			</c>
			<c id="B63">
				<t id="en">lux hour</t>
			</c>
			<c id="B64">
				<t id="en">lux second</t>
			</c>
			<c id="B66">
				<t id="en">megaampere per square metre</t>
			</c>
			<c id="B67">
				<t id="en">megabecquerel per kilogram</t>
			</c>
			<c id="B68">
				<t id="en">gigabit</t>
			</c>
			<c id="B69">
				<t id="en">megacoulomb per cubic metre</t>
			</c>
			<c id="B70">
				<t id="en">megacoulomb per square metre</t>
			</c>
			<c id="B71">
				<t id="en">megaelectronvolt</t>
			</c>
			<c id="B72">
				<t id="en">megagram per cubic metre</t>
			</c>
			<c id="B73">
				<t id="en">meganewton</t>
			</c>
			<c id="B74">
				<t id="en">meganewton metre</t>
			</c>
			<c id="B75">
				<t id="en">megaohm</t>
			</c>
			<c id="B76">
				<t id="en">megaohm metre</t>
			</c>
			<c id="B77">
				<t id="en">megasiemens per metre</t>
			</c>
			<c id="B78">
				<t id="en">megavolt</t>
			</c>
			<c id="B79">
				<t id="en">megavolt per metre</t>
			</c>
			<c id="B80">
				<t id="en">gigabit per second</t>
			</c>
			<c id="B81">
				<t id="en">reciprocal metre squared reciprocal second</t>
			</c>
			<c id="B82">
				<t id="en">inch per linear foot</t>
			</c>
			<c id="B83">
				<t id="en">metre to the fourth power</t>
			</c>
			<c id="B84">
				<t id="en">microampere</t>
			</c>
			<c id="B85">
				<t id="en">microbar</t>
			</c>
			<c id="B86">
				<t id="en">microcoulomb</t>
			</c>
			<c id="B87">
				<t id="en">microcoulomb per cubic metre</t>
			</c>
			<c id="B88">
				<t id="en">microcoulomb per square metre</t>
			</c>
			<c id="B89">
				<t id="en">microfarad per metre</t>
			</c>
			<c id="B90">
				<t id="en">microhenry</t>
			</c>
			<c id="B91">
				<t id="en">microhenry per metre</t>
			</c>
			<c id="B92">
				<t id="en">micronewton</t>
			</c>
			<c id="B93">
				<t id="en">micronewton metre</t>
			</c>
			<c id="B94">
				<t id="en">microohm</t>
			</c>
			<c id="B95">
				<t id="en">microohm metre</t>
			</c>
			<c id="B96">
				<t id="en">micropascal</t>
			</c>
			<c id="B97">
				<t id="en">microradian</t>
			</c>
			<c id="B98">
				<t id="en">microsecond</t>
			</c>
			<c id="B99">
				<t id="en">microsiemens</t>
			</c>
			<c id="BAR">
				<t id="en">bar [unit of pressure]</t>
			</c>
			<c id="BB">
				<t id="en">base box</t>
			</c>
			<c id="BFT">
				<t id="en">board foot</t>
			</c>
			<c id="BHP">
				<t id="en">brake horse power</t>
			</c>
			<c id="BIL">
				<t id="en">billion (EUR)</t>
			</c>
			<c id="BLD">
				<t id="en">dry barrel (US)</t>
			</c>
			<c id="BLL">
				<t id="en">barrel (US)</t>
			</c>
			<c id="BP">
				<t id="en">hundred board foot</t>
			</c>
			<c id="BPM">
				<t id="en">beats per minute</t>
			</c>
			<c id="BQL">
				<t id="en">becquerel</t>
			</c>
			<c id="BTU">
				<t id="en">British thermal unit (international table)</t>
			</c>
			<c id="BUA">
				<t id="en">bushel (US)</t>
			</c>
			<c id="BUI">
				<t id="en">bushel (UK)</t>
			</c>
			<c id="C0">
				<t id="en">call</t>
			</c>
			<c id="C3">
				<t id="en">microvolt per metre</t>
			</c>
			<c id="C7">
				<t id="en">centipoise</t>
			</c>
			<c id="C8">
				<t id="en">millicoulomb per kilogram</t>
			</c>
			<c id="C9">
				<t id="en">coil group</t>
			</c>
			<c id="C10">
				<t id="en">millifarad</t>
			</c>
			<c id="C11">
				<t id="en">milligal</t>
			</c>
			<c id="C12">
				<t id="en">milligram per metre</t>
			</c>
			<c id="C13">
				<t id="en">milligray</t>
			</c>
			<c id="C14">
				<t id="en">millihenry</t>
			</c>
			<c id="C15">
				<t id="en">millijoule</t>
			</c>
			<c id="C16">
				<t id="en">millimetre per second</t>
			</c>
			<c id="C17">
				<t id="en">millimetre squared per second</t>
			</c>
			<c id="C18">
				<t id="en">millimole</t>
			</c>
			<c id="C19">
				<t id="en">mole per kilogram</t>
			</c>
			<c id="C20">
				<t id="en">millinewton</t>
			</c>
			<c id="C21">
				<t id="en">kibibit</t>
			</c>
			<c id="C22">
				<t id="en">millinewton per metre</t>
			</c>
			<c id="C23">
				<t id="en">milliohm metre</t>
			</c>
			<c id="C24">
				<t id="en">millipascal second</t>
			</c>
			<c id="C25">
				<t id="en">milliradian</t>
			</c>
			<c id="C26">
				<t id="en">millisecond</t>
			</c>
			<c id="C27">
				<t id="en">millisiemens</t>
			</c>
			<c id="C28">
				<t id="en">millisievert</t>
			</c>
			<c id="C29">
				<t id="en">millitesla</t>
			</c>
			<c id="C30">
				<t id="en">millivolt per metre</t>
			</c>
			<c id="C31">
				<t id="en">milliwatt</t>
			</c>
			<c id="C32">
				<t id="en">milliwatt per square metre</t>
			</c>
			<c id="C33">
				<t id="en">milliweber</t>
			</c>
			<c id="C34">
				<t id="en">mole</t>
			</c>
			<c id="C35">
				<t id="en">mole per cubic decimetre</t>
			</c>
			<c id="C36">
				<t id="en">mole per cubic metre</t>
			</c>
			<c id="C37">
				<t id="en">kilobit</t>
			</c>
			<c id="C38">
				<t id="en">mole per litre</t>
			</c>
			<c id="C39">
				<t id="en">nanoampere</t>
			</c>
			<c id="C40">
				<t id="en">nanocoulomb</t>
			</c>
			<c id="C41">
				<t id="en">nanofarad</t>
			</c>
			<c id="C42">
				<t id="en">nanofarad per metre</t>
			</c>
			<c id="C43">
				<t id="en">nanohenry</t>
			</c>
			<c id="C44">
				<t id="en">nanohenry per metre</t>
			</c>
			<c id="C45">
				<t id="en">nanometre</t>
			</c>
			<c id="C46">
				<t id="en">nanoohm metre</t>
			</c>
			<c id="C47">
				<t id="en">nanosecond</t>
			</c>
			<c id="C48">
				<t id="en">nanotesla</t>
			</c>
			<c id="C49">
				<t id="en">nanowatt</t>
			</c>
			<c id="C50">
				<t id="en">neper</t>
			</c>
			<c id="C51">
				<t id="en">neper per second</t>
			</c>
			<c id="C52">
				<t id="en">picometre</t>
			</c>
			<c id="C53">
				<t id="en">newton metre second</t>
			</c>
			<c id="C54">
				<t id="en">newton metre squared per kilogram squared</t>
			</c>
			<c id="C55">
				<t id="en">newton per square metre</t>
			</c>
			<c id="C56">
				<t id="en">newton per square millimetre</t>
			</c>
			<c id="C57">
				<t id="en">newton second</t>
			</c>
			<c id="C58">
				<t id="en">newton second per metre</t>
			</c>
			<c id="C59">
				<t id="en">octave</t>
			</c>
			<c id="C60">
				<t id="en">ohm centimetre</t>
			</c>
			<c id="C61">
				<t id="en">ohm metre</t>
			</c>
			<c id="C62">
				<t id="en">one</t>
			</c>
			<c id="C63">
				<t id="en">parsec</t>
			</c>
			<c id="C64">
				<t id="en">pascal per kelvin</t>
			</c>
			<c id="C65">
				<t id="en">pascal second</t>
			</c>
			<c id="C66">
				<t id="en">pascal second per cubic metre</t>
			</c>
			<c id="C67">
				<t id="en">pascal second per metre</t>
			</c>
			<c id="C68">
				<t id="en">petajoule</t>
			</c>
			<c id="C69">
				<t id="en">phon</t>
			</c>
			<c id="C70">
				<t id="en">picoampere</t>
			</c>
			<c id="C71">
				<t id="en">picocoulomb</t>
			</c>
			<c id="C72">
				<t id="en">picofarad per metre</t>
			</c>
			<c id="C73">
				<t id="en">picohenry</t>
			</c>
			<c id="C74">
				<t id="en">kilobit per second</t>
			</c>
			<c id="C75">
				<t id="en">picowatt</t>
			</c>
			<c id="C76">
				<t id="en">picowatt per square metre</t>
			</c>
			<c id="C78">
				<t id="en">pound-force</t>
			</c>
			<c id="C79">
				<t id="en">kilovolt ampere hour</t>
			</c>
			<c id="C80">
				<t id="en">rad</t>
			</c>
			<c id="C81">
				<t id="en">radian</t>
			</c>
			<c id="C82">
				<t id="en">radian square metre per mole</t>
			</c>
			<c id="C83">
				<t id="en">radian square metre per kilogram</t>
			</c>
			<c id="C84">
				<t id="en">radian per metre</t>
			</c>
			<c id="C85">
				<t id="en">reciprocal angstrom</t>
			</c>
			<c id="C86">
				<t id="en">reciprocal cubic metre</t>
			</c>
			<c id="C87">
				<t id="en">reciprocal cubic metre per second</t>
			</c>
			<c id="C88">
				<t id="en">reciprocal electron volt per cubic metre</t>
			</c>
			<c id="C89">
				<t id="en">reciprocal henry</t>
			</c>
			<c id="C90">
				<t id="en">reciprocal joule per cubic metre</t>
			</c>
			<c id="C91">
				<t id="en">reciprocal kelvin or kelvin to the power minus one</t>
			</c>
			<c id="C92">
				<t id="en">reciprocal metre</t>
			</c>
			<c id="C93">
				<t id="en">reciprocal square metre</t>
			</c>
			<c id="C94">
				<t id="en">reciprocal minute</t>
			</c>
			<c id="C95">
				<t id="en">reciprocal mole</t>
			</c>
			<c id="C96">
				<t id="en">reciprocal pascal or pascal to the power minus one</t>
			</c>
			<c id="C97">
				<t id="en">reciprocal second</t>
			</c>
			<c id="C99">
				<t id="en">reciprocal second per metre squared</t>
			</c>
			<c id="CCT">
				<t id="en">carrying capacity in metric ton</t>
			</c>
			<c id="CDL">
				<t id="en">candela</t>
			</c>
			<c id="CEL">
				<t id="en">degree Celsius</t>
			</c>
			<c id="CEN">
				<t id="en">hundred</t>
			</c>
			<c id="CG">
				<t id="en">card</t>
			</c>
			<c id="CGM">
				<t id="en">centigram</t>
			</c>
			<c id="CKG">
				<t id="en">coulomb per kilogram</t>
			</c>
			<c id="CLF">
				<t id="en">hundred leave</t>
			</c>
			<c id="CLT">
				<t id="en">centilitre</t>
			</c>
			<c id="CMK">
				<t id="en">square centimetre</t>
			</c>
			<c id="CMQ">
				<t id="en">cubic centimetre</t>
			</c>
			<c id="CMT">
				<t id="en">centimetre</t>
			</c>
			<c id="CNP">
				<t id="en">hundred pack</t>
			</c>
			<c id="CNT">
				<t id="en">cental (UK)</t>
			</c>
			<c id="COU">
				<t id="en">coulomb</t>
			</c>
			<c id="CTG">
				<t id="en">content gram</t>
			</c>
			<c id="CTM">
				<t id="en">metric carat</t>
			</c>
			<c id="CTN">
				<t id="en">content ton (metric)</t>
			</c>
			<c id="CUR">
				<t id="en">curie</t>
			</c>
			<c id="CWA">
				<t id="en">hundred pound (cwt) / hundred weight (US)</t>
			</c>
			<c id="CWI">
				<t id="en">hundred weight (UK)</t>
			</c>
			<c id="D1">
				<t id="en">reciprocal second per steradian</t>
			</c>
			<c id="D2">
				<t id="en">reciprocal second per steradian metre squared</t>
			</c>
			<c id="D03">
				<t id="en">kilowatt hour per hour</t>
			</c>
			<c id="D04">
				<t id="en">lot [unit of weight]</t>
			</c>
			<c id="D5">
				<t id="en">kilogram per square centimetre</t>
			</c>
			<c id="D6">
				<t id="en">roentgen per second</t>
			</c>
			<c id="D10">
				<t id="en">siemens per metre</t>
			</c>
			<c id="D11">
				<t id="en">mebibit</t>
			</c>
			<c id="D12">
				<t id="en">siemens square metre per mole</t>
			</c>
			<c id="D13">
				<t id="en">sievert</t>
			</c>
			<c id="D15">
				<t id="en">sone</t>
			</c>
			<c id="D16">
				<t id="en">square centimetre per erg</t>
			</c>
			<c id="D17">
				<t id="en">square centimetre per steradian erg</t>
			</c>
			<c id="D18">
				<t id="en">metre kelvin</t>
			</c>
			<c id="D19">
				<t id="en">square metre kelvin per watt</t>
			</c>
			<c id="D20">
				<t id="en">square metre per joule</t>
			</c>
			<c id="D21">
				<t id="en">square metre per kilogram</t>
			</c>
			<c id="D22">
				<t id="en">square metre per mole</t>
			</c>
			<c id="D23">
				<t id="en">pen gram (protein)</t>
			</c>
			<c id="D24">
				<t id="en">square metre per steradian</t>
			</c>
			<c id="D25">
				<t id="en">square metre per steradian joule</t>
			</c>
			<c id="D26">
				<t id="en">square metre per volt second</t>
			</c>
			<c id="D27">
				<t id="en">steradian</t>
			</c>
			<c id="D29">
				<t id="en">terahertz</t>
			</c>
			<c id="D30">
				<t id="en">terajoule</t>
			</c>
			<c id="D31">
				<t id="en">terawatt</t>
			</c>
			<c id="D32">
				<t id="en">terawatt hour</t>
			</c>
			<c id="D33">
				<t id="en">tesla</t>
			</c>
			<c id="D34">
				<t id="en">tex</t>
			</c>
			<c id="D36">
				<t id="en">megabit</t>
			</c>
			<c id="D41">
				<t id="en">tonne per cubic metre</t>
			</c>
			<c id="D42">
				<t id="en">tropical year</t>
			</c>
			<c id="D43">
				<t id="en">unified atomic mass unit</t>
			</c>
			<c id="D44">
				<t id="en">var</t>
			</c>
			<c id="D45">
				<t id="en">volt squared per kelvin squared</t>
			</c>
			<c id="D46">
				<t id="en">volt - ampere</t>
			</c>
			<c id="D47">
				<t id="en">volt per centimetre</t>
			</c>
			<c id="D48">
				<t id="en">volt per kelvin</t>
			</c>
			<c id="D49">
				<t id="en">millivolt per kelvin</t>
			</c>
			<c id="D50">
				<t id="en">volt per metre</t>
			</c>
			<c id="D51">
				<t id="en">volt per millimetre</t>
			</c>
			<c id="D52">
				<t id="en">watt per kelvin</t>
			</c>
			<c id="D53">
				<t id="en">watt per metre kelvin</t>
			</c>
			<c id="D54">
				<t id="en">watt per square metre</t>
			</c>
			<c id="D55">
				<t id="en">watt per square metre kelvin</t>
			</c>
			<c id="D56">
				<t id="en">watt per square metre kelvin to the fourth power</t>
			</c>
			<c id="D57">
				<t id="en">watt per steradian</t>
			</c>
			<c id="D58">
				<t id="en">watt per steradian square metre</t>
			</c>
			<c id="D59">
				<t id="en">weber per metre</t>
			</c>
			<c id="D60">
				<t id="en">weber per millimetre</t>
			</c>
			<c id="D61">
				<t id="en">minute [unit of angle]</t>
			</c>
			<c id="D62">
				<t id="en">second [unit of angle]</t>
			</c>
			<c id="D63">
				<t id="en">book</t>
			</c>
			<c id="D65">
				<t id="en">round</t>
			</c>
			<c id="D68">
				<t id="en">number of words</t>
			</c>
			<c id="D69">
				<t id="en">inch to the fourth power</t>
			</c>
			<c id="D73">
				<t id="en">joule square metre</t>
			</c>
			<c id="D74">
				<t id="en">kilogram per mole</t>
			</c>
			<c id="D77">
				<t id="en">megacoulomb</t>
			</c>
			<c id="D78">
				<t id="en">megajoule per second</t>
			</c>
			<c id="D80">
				<t id="en">microwatt</t>
			</c>
			<c id="D81">
				<t id="en">microtesla</t>
			</c>
			<c id="D82">
				<t id="en">microvolt</t>
			</c>
			<c id="D83">
				<t id="en">millinewton metre</t>
			</c>
			<c id="D85">
				<t id="en">microwatt per square metre</t>
			</c>
			<c id="D86">
				<t id="en">millicoulomb</t>
			</c>
			<c id="D87">
				<t id="en">millimole per kilogram</t>
			</c>
			<c id="D88">
				<t id="en">millicoulomb per cubic metre</t>
			</c>
			<c id="D89">
				<t id="en">millicoulomb per square metre</t>
			</c>
			<c id="D91">
				<t id="en">rem</t>
			</c>
			<c id="D93">
				<t id="en">second per cubic metre</t>
			</c>
			<c id="D94">
				<t id="en">second per cubic metre radian</t>
			</c>
			<c id="D95">
				<t id="en">joule per gram</t>
			</c>
			<c id="DAA">
				<t id="en">decare</t>
			</c>
			<c id="DAD">
				<t id="en">ten day</t>
			</c>
			<c id="DAY">
				<t id="en">day</t>
			</c>
			<c id="DB">
				<t id="en">dry pound</t>
			</c>
			<c id="DBM">
				<t id="en">Decibel-milliwatts</t>
			</c>
			<c id="DBW">
				<t id="en">Decibel watt</t>
			</c>
			<c id="DD">
				<t id="en">degree [unit of angle]</t>
			</c>
			<c id="DEC">
				<t id="en">decade</t>
			</c>
			<c id="DG">
				<t id="en">decigram</t>
			</c>
			<c id="DJ">
				<t id="en">decagram</t>
			</c>
			<c id="DLT">
				<t id="en">decilitre</t>
			</c>
			<c id="DMA">
				<t id="en">cubic decametre</t>
			</c>
			<c id="DMK">
				<t id="en">square decimetre</t>
			</c>
			<c id="DMO">
				<t id="en">standard kilolitre</t>
			</c>
			<c id="DMQ">
				<t id="en">cubic decimetre</t>
			</c>
			<c id="DMT">
				<t id="en">decimetre</t>
			</c>
			<c id="DN">
				<t id="en">decinewton metre</t>
			</c>
			<c id="DPC">
				<t id="en">dozen piece</t>
			</c>
			<c id="DPR">
				<t id="en">dozen pair</t>
			</c>
			<c id="DPT">
				<t id="en">displacement tonnage</t>
			</c>
			<c id="DRA">
				<t id="en">dram (US)</t>
			</c>
			<c id="DRI">
				<t id="en">dram (UK)</t>
			</c>
			<c id="DRL">
				<t id="en">dozen roll</t>
			</c>
			<c id="DT">
				<t id="en">dry ton</t>
			</c>
			<c id="DTN">
				<t id="en">decitonne</t>
			</c>
			<c id="DWT">
				<t id="en">pennyweight</t>
			</c>
			<c id="DZN">
				<t id="en">dozen</t>
			</c>
			<c id="DZP">
				<t id="en">dozen pack</t>
			</c>
			<c id="E01">
				<t id="en">newton per square centimetre</t>
			</c>
			<c id="E4">
				<t id="en">gross kilogram</t>
			</c>
			<c id="E07">
				<t id="en">megawatt hour per hour</t>
			</c>
			<c id="E08">
				<t id="en">megawatt per hertz</t>
			</c>
			<c id="E09">
				<t id="en">milliampere hour</t>
			</c>
			<c id="E10">
				<t id="en">degree day</t>
			</c>
			<c id="E12">
				<t id="en">mille</t>
			</c>
			<c id="E14">
				<t id="en">kilocalorie (international table)</t>
			</c>
			<c id="E15">
				<t id="en">kilocalorie (thermochemical) per hour</t>
			</c>
			<c id="E16">
				<t id="en">million Btu(IT) per hour</t>
			</c>
			<c id="E17">
				<t id="en">cubic foot per second</t>
			</c>
			<c id="E18">
				<t id="en">tonne per hour</t>
			</c>
			<c id="E19">
				<t id="en">ping</t>
			</c>
			<c id="E20">
				<t id="en">megabit per second</t>
			</c>
			<c id="E21">
				<t id="en">shares</t>
			</c>
			<c id="E22">
				<t id="en">TEU</t>
			</c>
			<c id="E23">
				<t id="en">tyre</t>
			</c>
			<c id="E25">
				<t id="en">active unit</t>
			</c>
			<c id="E27">
				<t id="en">dose</t>
			</c>
			<c id="E28">
				<t id="en">air dry ton</t>
			</c>
			<c id="E30">
				<t id="en">strand</t>
			</c>
			<c id="E31">
				<t id="en">square metre per litre</t>
			</c>
			<c id="E32">
				<t id="en">litre per hour</t>
			</c>
			<c id="E33">
				<t id="en">foot per thousand</t>
			</c>
			<c id="E34">
				<t id="en">gigabyte</t>
			</c>
			<c id="E35">
				<t id="en">terabyte</t>
			</c>
			<c id="E36">
				<t id="en">petabyte</t>
			</c>
			<c id="E37">
				<t id="en">pixel</t>
			</c>
			<c id="E38">
				<t id="en">megapixel</t>
			</c>
			<c id="E39">
				<t id="en">dots per inch</t>
			</c>
			<c id="E40">
				<t id="en">part per hundred thousand</t>
			</c>
			<c id="E41">
				<t id="en">kilogram-force per square millimetre</t>
			</c>
			<c id="E42">
				<t id="en">kilogram-force per square centimetre</t>
			</c>
			<c id="E43">
				<t id="en">joule per square centimetre</t>
			</c>
			<c id="E44">
				<t id="en">kilogram-force metre per square centimetre</t>
			</c>
			<c id="E45">
				<t id="en">milliohm</t>
			</c>
			<c id="E46">
				<t id="en">kilowatt hour per cubic metre</t>
			</c>
			<c id="E47">
				<t id="en">kilowatt hour per kelvin</t>
			</c>
			<c id="E48">
				<t id="en">service unit</t>
			</c>
			<c id="E49">
				<t id="en">working day</t>
			</c>
			<c id="E50">
				<t id="en">accounting unit</t>
			</c>
			<c id="E51">
				<t id="en">job</t>
			</c>
			<c id="E52">
				<t id="en">run foot</t>
			</c>
			<c id="E53">
				<t id="en">test</t>
			</c>
			<c id="E54">
				<t id="en">trip</t>
			</c>
			<c id="E55">
				<t id="en">use</t>
			</c>
			<c id="E56">
				<t id="en">well</t>
			</c>
			<c id="E57">
				<t id="en">zone</t>
			</c>
			<c id="E58">
				<t id="en">exabit per second</t>
			</c>
			<c id="E59">
				<t id="en">exbibyte</t>
			</c>
			<c id="E60">
				<t id="en">pebibyte</t>
			</c>
			<c id="E61">
				<t id="en">tebibyte</t>
			</c>
			<c id="E62">
				<t id="en">gibibyte</t>
			</c>
			<c id="E63">
				<t id="en">mebibyte</t>
			</c>
			<c id="E64">
				<t id="en">kibibyte</t>
			</c>
			<c id="E65">
				<t id="en">exbibit per metre</t>
			</c>
			<c id="E66">
				<t id="en">exbibit per square metre</t>
			</c>
			<c id="E67">
				<t id="en">exbibit per cubic metre</t>
			</c>
			<c id="E68">
				<t id="en">gigabyte per second</t>
			</c>
			<c id="E69">
				<t id="en">gibibit per metre</t>
			</c>
			<c id="E70">
				<t id="en">gibibit per square metre</t>
			</c>
			<c id="E71">
				<t id="en">gibibit per cubic metre</t>
			</c>
			<c id="E72">
				<t id="en">kibibit per metre</t>
			</c>
			<c id="E73">
				<t id="en">kibibit per square metre</t>
			</c>
			<c id="E74">
				<t id="en">kibibit per cubic metre</t>
			</c>
			<c id="E75">
				<t id="en">mebibit per metre</t>
			</c>
			<c id="E76">
				<t id="en">mebibit per square metre</t>
			</c>
			<c id="E77">
				<t id="en">mebibit per cubic metre</t>
			</c>
			<c id="E78">
				<t id="en">petabit</t>
			</c>
			<c id="E79">
				<t id="en">petabit per second</t>
			</c>
			<c id="E80">
				<t id="en">pebibit per metre</t>
			</c>
			<c id="E81">
				<t id="en">pebibit per square metre</t>
			</c>
			<c id="E82">
				<t id="en">pebibit per cubic metre</t>
			</c>
			<c id="E83">
				<t id="en">terabit</t>
			</c>
			<c id="E84">
				<t id="en">terabit per second</t>
			</c>
			<c id="E85">
				<t id="en">tebibit per metre</t>
			</c>
			<c id="E86">
				<t id="en">tebibit per cubic metre</t>
			</c>
			<c id="E87">
				<t id="en">tebibit per square metre</t>
			</c>
			<c id="E88">
				<t id="en">bit per metre</t>
			</c>
			<c id="E89">
				<t id="en">bit per square metre</t>
			</c>
			<c id="E90">
				<t id="en">reciprocal centimetre</t>
			</c>
			<c id="E91">
				<t id="en">reciprocal day</t>
			</c>
			<c id="E92">
				<t id="en">cubic decimetre per hour</t>
			</c>
			<c id="E93">
				<t id="en">kilogram per hour</t>
			</c>
			<c id="E94">
				<t id="en">kilomole per second</t>
			</c>
			<c id="E95">
				<t id="en">mole per second</t>
			</c>
			<c id="E96">
				<t id="en">degree per second</t>
			</c>
			<c id="E97">
				<t id="en">millimetre per degree Celcius metre</t>
			</c>
			<c id="E98">
				<t id="en">degree Celsius per kelvin</t>
			</c>
			<c id="E99">
				<t id="en">hectopascal per bar</t>
			</c>
			<c id="EA">
				<t id="en">each</t>
			</c>
			<c id="EB">
				<t id="en">electronic mail box</t>
			</c>
			<c id="EQ">
				<t id="en">equivalent gallon</t>
			</c>
			<c id="F01">
				<t id="en">bit per cubic metre</t>
			</c>
			<c id="F02">
				<t id="en">kelvin per kelvin</t>
			</c>
			<c id="F03">
				<t id="en">kilopascal per bar</t>
			</c>
			<c id="F04">
				<t id="en">millibar per bar</t>
			</c>
			<c id="F05">
				<t id="en">megapascal per bar</t>
			</c>
			<c id="F06">
				<t id="en">poise per bar</t>
			</c>
			<c id="F07">
				<t id="en">pascal per bar</t>
			</c>
			<c id="F08">
				<t id="en">milliampere per inch</t>
			</c>
			<c id="F10">
				<t id="en">kelvin per hour</t>
			</c>
			<c id="F11">
				<t id="en">kelvin per minute</t>
			</c>
			<c id="F12">
				<t id="en">kelvin per second</t>
			</c>
			<c id="F13">
				<t id="en">slug</t>
			</c>
			<c id="F14">
				<t id="en">gram per kelvin</t>
			</c>
			<c id="F15">
				<t id="en">kilogram per kelvin</t>
			</c>
			<c id="F16">
				<t id="en">milligram per kelvin</t>
			</c>
			<c id="F17">
				<t id="en">pound-force per foot</t>
			</c>
			<c id="F18">
				<t id="en">kilogram square centimetre</t>
			</c>
			<c id="F19">
				<t id="en">kilogram square millimetre</t>
			</c>
			<c id="F20">
				<t id="en">pound inch squared</t>
			</c>
			<c id="F21">
				<t id="en">pound-force inch</t>
			</c>
			<c id="F22">
				<t id="en">pound-force foot per ampere</t>
			</c>
			<c id="F23">
				<t id="en">gram per cubic decimetre</t>
			</c>
			<c id="F24">
				<t id="en">kilogram per kilomol</t>
			</c>
			<c id="F25">
				<t id="en">gram per hertz</t>
			</c>
			<c id="F26">
				<t id="en">gram per day</t>
			</c>
			<c id="F27">
				<t id="en">gram per hour</t>
			</c>
			<c id="F28">
				<t id="en">gram per minute</t>
			</c>
			<c id="F29">
				<t id="en">gram per second</t>
			</c>
			<c id="F30">
				<t id="en">kilogram per day</t>
			</c>
			<c id="F31">
				<t id="en">kilogram per minute</t>
			</c>
			<c id="F32">
				<t id="en">milligram per day</t>
			</c>
			<c id="F33">
				<t id="en">milligram per minute</t>
			</c>
			<c id="F34">
				<t id="en">milligram per second</t>
			</c>
			<c id="F35">
				<t id="en">gram per day kelvin</t>
			</c>
			<c id="F36">
				<t id="en">gram per hour kelvin</t>
			</c>
			<c id="F37">
				<t id="en">gram per minute kelvin</t>
			</c>
			<c id="F38">
				<t id="en">gram per second kelvin</t>
			</c>
			<c id="F39">
				<t id="en">kilogram per day kelvin</t>
			</c>
			<c id="F40">
				<t id="en">kilogram per hour kelvin</t>
			</c>
			<c id="F41">
				<t id="en">kilogram per minute kelvin</t>
			</c>
			<c id="F42">
				<t id="en">kilogram per second kelvin</t>
			</c>
			<c id="F43">
				<t id="en">milligram per day kelvin</t>
			</c>
			<c id="F44">
				<t id="en">milligram per hour kelvin</t>
			</c>
			<c id="F45">
				<t id="en">milligram per minute kelvin</t>
			</c>
			<c id="F46">
				<t id="en">milligram per second kelvin</t>
			</c>
			<c id="F47">
				<t id="en">newton per millimetre</t>
			</c>
			<c id="F48">
				<t id="en">pound-force per inch</t>
			</c>
			<c id="F49">
				<t id="en">rod [unit of distance]</t>
			</c>
			<c id="F50">
				<t id="en">micrometre per kelvin</t>
			</c>
			<c id="F51">
				<t id="en">centimetre per kelvin</t>
			</c>
			<c id="F52">
				<t id="en">metre per kelvin</t>
			</c>
			<c id="F53">
				<t id="en">millimetre per kelvin</t>
			</c>
			<c id="F54">
				<t id="en">milliohm per metre</t>
			</c>
			<c id="F55">
				<t id="en">ohm per mile (statute mile)</t>
			</c>
			<c id="F56">
				<t id="en">ohm per kilometre</t>
			</c>
			<c id="F57">
				<t id="en">milliampere per pound-force per square inch</t>
			</c>
			<c id="F58">
				<t id="en">reciprocal bar</t>
			</c>
			<c id="F59">
				<t id="en">milliampere per bar</t>
			</c>
			<c id="F60">
				<t id="en">degree Celsius per bar</t>
			</c>
			<c id="F61">
				<t id="en">kelvin per bar</t>
			</c>
			<c id="F62">
				<t id="en">gram per day bar</t>
			</c>
			<c id="F63">
				<t id="en">gram per hour bar</t>
			</c>
			<c id="F64">
				<t id="en">gram per minute bar</t>
			</c>
			<c id="F65">
				<t id="en">gram per second bar</t>
			</c>
			<c id="F66">
				<t id="en">kilogram per day bar</t>
			</c>
			<c id="F67">
				<t id="en">kilogram per hour bar</t>
			</c>
			<c id="F68">
				<t id="en">kilogram per minute bar</t>
			</c>
			<c id="F69">
				<t id="en">kilogram per second bar</t>
			</c>
			<c id="F70">
				<t id="en">milligram per day bar</t>
			</c>
			<c id="F71">
				<t id="en">milligram per hour bar</t>
			</c>
			<c id="F72">
				<t id="en">milligram per minute bar</t>
			</c>
			<c id="F73">
				<t id="en">milligram per second bar</t>
			</c>
			<c id="F74">
				<t id="en">gram per bar</t>
			</c>
			<c id="F75">
				<t id="en">milligram per bar</t>
			</c>
			<c id="F76">
				<t id="en">milliampere per millimetre</t>
			</c>
			<c id="F77">
				<t id="en">pascal second per kelvin</t>
			</c>
			<c id="F78">
				<t id="en">inch of water</t>
			</c>
			<c id="F79">
				<t id="en">inch of mercury</t>
			</c>
			<c id="F80">
				<t id="en">water horse power</t>
			</c>
			<c id="F81">
				<t id="en">bar per kelvin</t>
			</c>
			<c id="F82">
				<t id="en">hectopascal per kelvin</t>
			</c>
			<c id="F83">
				<t id="en">kilopascal per kelvin</t>
			</c>
			<c id="F84">
				<t id="en">millibar per kelvin</t>
			</c>
			<c id="F85">
				<t id="en">megapascal per kelvin</t>
			</c>
			<c id="F86">
				<t id="en">poise per kelvin</t>
			</c>
			<c id="F87">
				<t id="en">volt per litre minute</t>
			</c>
			<c id="F88">
				<t id="en">newton centimetre</t>
			</c>
			<c id="F89">
				<t id="en">newton metre per degree</t>
			</c>
			<c id="F90">
				<t id="en">newton metre per ampere</t>
			</c>
			<c id="F91">
				<t id="en">bar litre per second</t>
			</c>
			<c id="F92">
				<t id="en">bar cubic metre per second</t>
			</c>
			<c id="F93">
				<t id="en">hectopascal litre per second</t>
			</c>
			<c id="F94">
				<t id="en">hectopascal cubic metre per second</t>
			</c>
			<c id="F95">
				<t id="en">millibar litre per second</t>
			</c>
			<c id="F96">
				<t id="en">millibar cubic metre per second</t>
			</c>
			<c id="F97">
				<t id="en">megapascal litre per second</t>
			</c>
			<c id="F98">
				<t id="en">megapascal cubic metre per second</t>
			</c>
			<c id="F99">
				<t id="en">pascal litre per second</t>
			</c>
			<c id="FAH">
				<t id="en">degree Fahrenheit</t>
			</c>
			<c id="FAR">
				<t id="en">farad</t>
			</c>
			<c id="FBM">
				<t id="en">fibre metre</t>
			</c>
			<c id="FC">
				<t id="en">thousand cubic foot</t>
			</c>
			<c id="FF">
				<t id="en">hundred cubic metre</t>
			</c>
			<c id="FH">
				<t id="en">micromole</t>
			</c>
			<c id="FIT">
				<t id="en">failures in time</t>
			</c>
			<c id="FL">
				<t id="en">flake ton</t>
			</c>
			<c id="FNU">
				<t id="en">Formazin nephelometric unit</t>
			</c>
			<c id="FOT">
				<t id="en">foot</t>
			</c>
			<c id="FP">
				<t id="en">pound per square foot</t>
			</c>
			<c id="FR">
				<t id="en">foot per minute</t>
			</c>
			<c id="FS">
				<t id="en">foot per second</t>
			</c>
			<c id="FTK">
				<t id="en">square foot</t>
			</c>
			<c id="FTQ">
				<t id="en">cubic foot</t>
			</c>
			<c id="G01">
				<t id="en">pascal cubic metre per second</t>
			</c>
			<c id="G2">
				<t id="en">US gallon per minute</t>
			</c>
			<c id="G3">
				<t id="en">Imperial gallon per minute</t>
			</c>
			<c id="G04">
				<t id="en">centimetre per bar</t>
			</c>
			<c id="G05">
				<t id="en">metre per bar</t>
			</c>
			<c id="G06">
				<t id="en">millimetre per bar</t>
			</c>
			<c id="G08">
				<t id="en">square inch per second</t>
			</c>
			<c id="G09">
				<t id="en">square metre per second kelvin</t>
			</c>
			<c id="G10">
				<t id="en">stokes per kelvin</t>
			</c>
			<c id="G11">
				<t id="en">gram per cubic centimetre bar</t>
			</c>
			<c id="G12">
				<t id="en">gram per cubic decimetre bar</t>
			</c>
			<c id="G13">
				<t id="en">gram per litre bar</t>
			</c>
			<c id="G14">
				<t id="en">gram per cubic metre bar</t>
			</c>
			<c id="G15">
				<t id="en">gram per millilitre bar</t>
			</c>
			<c id="G16">
				<t id="en">kilogram per cubic centimetre bar</t>
			</c>
			<c id="G17">
				<t id="en">kilogram per litre bar</t>
			</c>
			<c id="G18">
				<t id="en">kilogram per cubic metre bar</t>
			</c>
			<c id="G19">
				<t id="en">newton metre per kilogram</t>
			</c>
			<c id="G20">
				<t id="en">pound-force foot per pound</t>
			</c>
			<c id="G21">
				<t id="en">cup [unit of volume]</t>
			</c>
			<c id="G23">
				<t id="en">peck</t>
			</c>
			<c id="G24">
				<t id="en">tablespoon (US)</t>
			</c>
			<c id="G25">
				<t id="en">teaspoon (US)</t>
			</c>
			<c id="G26">
				<t id="en">stere</t>
			</c>
			<c id="G27">
				<t id="en">cubic centimetre per kelvin</t>
			</c>
			<c id="G28">
				<t id="en">litre per kelvin</t>
			</c>
			<c id="G29">
				<t id="en">cubic metre per kelvin</t>
			</c>
			<c id="G30">
				<t id="en">millilitre per kelvin</t>
			</c>
			<c id="G31">
				<t id="en">kilogram per cubic centimetre</t>
			</c>
			<c id="G32">
				<t id="en">ounce (avoirdupois) per cubic yard</t>
			</c>
			<c id="G33">
				<t id="en">gram per cubic centimetre kelvin</t>
			</c>
			<c id="G34">
				<t id="en">gram per cubic decimetre kelvin</t>
			</c>
			<c id="G35">
				<t id="en">gram per litre kelvin</t>
			</c>
			<c id="G36">
				<t id="en">gram per cubic metre kelvin</t>
			</c>
			<c id="G37">
				<t id="en">gram per millilitre kelvin</t>
			</c>
			<c id="G38">
				<t id="en">kilogram per cubic centimetre kelvin</t>
			</c>
			<c id="G39">
				<t id="en">kilogram per litre kelvin</t>
			</c>
			<c id="G40">
				<t id="en">kilogram per cubic metre kelvin</t>
			</c>
			<c id="G41">
				<t id="en">square metre per second bar</t>
			</c>
			<c id="G42">
				<t id="en">microsiemens per centimetre</t>
			</c>
			<c id="G43">
				<t id="en">microsiemens per metre</t>
			</c>
			<c id="G44">
				<t id="en">nanosiemens per centimetre</t>
			</c>
			<c id="G45">
				<t id="en">nanosiemens per metre</t>
			</c>
			<c id="G46">
				<t id="en">stokes per bar</t>
			</c>
			<c id="G47">
				<t id="en">cubic centimetre per day</t>
			</c>
			<c id="G48">
				<t id="en">cubic centimetre per hour</t>
			</c>
			<c id="G49">
				<t id="en">cubic centimetre per minute</t>
			</c>
			<c id="G50">
				<t id="en">gallon (US) per hour</t>
			</c>
			<c id="G51">
				<t id="en">litre per second</t>
			</c>
			<c id="G52">
				<t id="en">cubic metre per day</t>
			</c>
			<c id="G53">
				<t id="en">cubic metre per minute</t>
			</c>
			<c id="G54">
				<t id="en">millilitre per day</t>
			</c>
			<c id="G55">
				<t id="en">millilitre per hour</t>
			</c>
			<c id="G56">
				<t id="en">cubic inch per hour</t>
			</c>
			<c id="G57">
				<t id="en">cubic inch per minute</t>
			</c>
			<c id="G58">
				<t id="en">cubic inch per second</t>
			</c>
			<c id="G59">
				<t id="en">milliampere per litre minute</t>
			</c>
			<c id="G60">
				<t id="en">volt per bar</t>
			</c>
			<c id="G61">
				<t id="en">cubic centimetre per day kelvin</t>
			</c>
			<c id="G62">
				<t id="en">cubic centimetre per hour kelvin</t>
			</c>
			<c id="G63">
				<t id="en">cubic centimetre per minute kelvin</t>
			</c>
			<c id="G64">
				<t id="en">cubic centimetre per second kelvin</t>
			</c>
			<c id="G65">
				<t id="en">litre per day kelvin</t>
			</c>
			<c id="G66">
				<t id="en">litre per hour kelvin</t>
			</c>
			<c id="G67">
				<t id="en">litre per minute kelvin</t>
			</c>
			<c id="G68">
				<t id="en">litre per second kelvin</t>
			</c>
			<c id="G69">
				<t id="en">cubic metre per day kelvin</t>
			</c>
			<c id="G70">
				<t id="en">cubic metre per hour kelvin</t>
			</c>
			<c id="G71">
				<t id="en">cubic metre per minute kelvin</t>
			</c>
			<c id="G72">
				<t id="en">cubic metre per second kelvin</t>
			</c>
			<c id="G73">
				<t id="en">millilitre per day kelvin</t>
			</c>
			<c id="G74">
				<t id="en">millilitre per hour kelvin</t>
			</c>
			<c id="G75">
				<t id="en">millilitre per minute kelvin</t>
			</c>
			<c id="G76">
				<t id="en">millilitre per second kelvin</t>
			</c>
			<c id="G77">
				<t id="en">millimetre to the fourth power</t>
			</c>
			<c id="G78">
				<t id="en">cubic centimetre per day bar</t>
			</c>
			<c id="G79">
				<t id="en">cubic centimetre per hour bar</t>
			</c>
			<c id="G80">
				<t id="en">cubic centimetre per minute bar</t>
			</c>
			<c id="G81">
				<t id="en">cubic centimetre per second bar</t>
			</c>
			<c id="G82">
				<t id="en">litre per day bar</t>
			</c>
			<c id="G83">
				<t id="en">litre per hour bar</t>
			</c>
			<c id="G84">
				<t id="en">litre per minute bar</t>
			</c>
			<c id="G85">
				<t id="en">litre per second bar</t>
			</c>
			<c id="G86">
				<t id="en">cubic metre per day bar</t>
			</c>
			<c id="G87">
				<t id="en">cubic metre per hour bar</t>
			</c>
			<c id="G88">
				<t id="en">cubic metre per minute bar</t>
			</c>
			<c id="G89">
				<t id="en">cubic metre per second bar</t>
			</c>
			<c id="G90">
				<t id="en">millilitre per day bar</t>
			</c>
			<c id="G91">
				<t id="en">millilitre per hour bar</t>
			</c>
			<c id="G92">
				<t id="en">millilitre per minute bar</t>
			</c>
			<c id="G93">
				<t id="en">millilitre per second bar</t>
			</c>
			<c id="G94">
				<t id="en">cubic centimetre per bar</t>
			</c>
			<c id="G95">
				<t id="en">litre per bar</t>
			</c>
			<c id="G96">
				<t id="en">cubic metre per bar</t>
			</c>
			<c id="G97">
				<t id="en">millilitre per bar</t>
			</c>
			<c id="G98">
				<t id="en">microhenry per kiloohm</t>
			</c>
			<c id="G99">
				<t id="en">microhenry per ohm</t>
			</c>
			<c id="GB">
				<t id="en">gallon (US) per day</t>
			</c>
			<c id="GBQ">
				<t id="en">gigabecquerel</t>
			</c>
			<c id="GDW">
				<t id="en">gram, dry weight</t>
			</c>
			<c id="GE">
				<t id="en">pound per gallon (US)</t>
			</c>
			<c id="GF">
				<t id="en">gram per metre (gram per 100 centimetres)</t>
			</c>
			<c id="GFI">
				<t id="en">gram of fissile isotope</t>
			</c>
			<c id="GGR">
				<t id="en">great gross</t>
			</c>
			<c id="GIA">
				<t id="en">gill (US)</t>
			</c>
			<c id="GIC">
				<t id="en">gram, including container</t>
			</c>
			<c id="GII">
				<t id="en">gill (UK)</t>
			</c>
			<c id="GIP">
				<t id="en">gram, including inner packaging</t>
			</c>
			<c id="GJ">
				<t id="en">gram per millilitre</t>
			</c>
			<c id="GL">
				<t id="en">gram per litre</t>
			</c>
			<c id="GLD">
				<t id="en">dry gallon (US)</t>
			</c>
			<c id="GLI">
				<t id="en">gallon (UK)</t>
			</c>
			<c id="GLL">
				<t id="en">gallon (US)</t>
			</c>
			<c id="GM">
				<t id="en">gram per square metre</t>
			</c>
			<c id="GO">
				<t id="en">milligram per square metre</t>
			</c>
			<c id="GP">
				<t id="en">milligram per cubic metre</t>
			</c>
			<c id="GQ">
				<t id="en">microgram per cubic metre</t>
			</c>
			<c id="GRM">
				<t id="en">gram</t>
			</c>
			<c id="GRN">
				<t id="en">grain</t>
			</c>
			<c id="GRO">
				<t id="en">gross</t>
			</c>
			<c id="GV">
				<t id="en">gigajoule</t>
			</c>
			<c id="GWH">
				<t id="en">gigawatt hour</t>
			</c>
			<c id="H03">
				<t id="en">henry per kiloohm</t>
			</c>
			<c id="H04">
				<t id="en">henry per ohm</t>
			</c>
			<c id="H05">
				<t id="en">millihenry per kiloohm</t>
			</c>
			<c id="H06">
				<t id="en">millihenry per ohm</t>
			</c>
			<c id="H07">
				<t id="en">pascal second per bar</t>
			</c>
			<c id="H08">
				<t id="en">microbecquerel</t>
			</c>
			<c id="H09">
				<t id="en">reciprocal year</t>
			</c>
			<c id="H10">
				<t id="en">reciprocal hour</t>
			</c>
			<c id="H11">
				<t id="en">reciprocal month</t>
			</c>
			<c id="H12">
				<t id="en">degree Celsius per hour</t>
			</c>
			<c id="H13">
				<t id="en">degree Celsius per minute</t>
			</c>
			<c id="H14">
				<t id="en">degree Celsius per second</t>
			</c>
			<c id="H15">
				<t id="en">square centimetre per gram</t>
			</c>
			<c id="H16">
				<t id="en">square decametre</t>
			</c>
			<c id="H18">
				<t id="en">square hectometre</t>
			</c>
			<c id="H19">
				<t id="en">cubic hectometre</t>
			</c>
			<c id="H20">
				<t id="en">cubic kilometre</t>
			</c>
			<c id="H21">
				<t id="en">blank</t>
			</c>
			<c id="H22">
				<t id="en">volt square inch per pound-force</t>
			</c>
			<c id="H23">
				<t id="en">volt per inch</t>
			</c>
			<c id="H24">
				<t id="en">volt per microsecond</t>
			</c>
			<c id="H25">
				<t id="en">percent per kelvin</t>
			</c>
			<c id="H26">
				<t id="en">ohm per metre</t>
			</c>
			<c id="H27">
				<t id="en">degree per metre</t>
			</c>
			<c id="H28">
				<t id="en">microfarad per kilometre</t>
			</c>
			<c id="H29">
				<t id="en">microgram per litre</t>
			</c>
			<c id="H30">
				<t id="en">square micrometre (square micron)</t>
			</c>
			<c id="H31">
				<t id="en">ampere per kilogram</t>
			</c>
			<c id="H32">
				<t id="en">ampere squared second</t>
			</c>
			<c id="H33">
				<t id="en">farad per kilometre</t>
			</c>
			<c id="H34">
				<t id="en">hertz metre</t>
			</c>
			<c id="H35">
				<t id="en">kelvin metre per watt</t>
			</c>
			<c id="H36">
				<t id="en">megaohm per kilometre</t>
			</c>
			<c id="H37">
				<t id="en">megaohm per metre</t>
			</c>
			<c id="H38">
				<t id="en">megaampere</t>
			</c>
			<c id="H39">
				<t id="en">megahertz kilometre</t>
			</c>
			<c id="H40">
				<t id="en">newton per ampere</t>
			</c>
			<c id="H41">
				<t id="en">newton metre watt to the power minus 0,5</t>
			</c>
			<c id="H42">
				<t id="en">pascal per metre</t>
			</c>
			<c id="H43">
				<t id="en">siemens per centimetre</t>
			</c>
			<c id="H44">
				<t id="en">teraohm</t>
			</c>
			<c id="H45">
				<t id="en">volt second per metre</t>
			</c>
			<c id="H46">
				<t id="en">volt per second</t>
			</c>
			<c id="H47">
				<t id="en">watt per cubic metre</t>
			</c>
			<c id="H48">
				<t id="en">attofarad</t>
			</c>
			<c id="H49">
				<t id="en">centimetre per hour</t>
			</c>
			<c id="H50">
				<t id="en">reciprocal cubic centimetre</t>
			</c>
			<c id="H51">
				<t id="en">decibel per kilometre</t>
			</c>
			<c id="H52">
				<t id="en">decibel per metre</t>
			</c>
			<c id="H53">
				<t id="en">kilogram per bar</t>
			</c>
			<c id="H54">
				<t id="en">kilogram per cubic decimetre kelvin</t>
			</c>
			<c id="H55">
				<t id="en">kilogram per cubic decimetre bar</t>
			</c>
			<c id="H56">
				<t id="en">kilogram per square metre second</t>
			</c>
			<c id="H57">
				<t id="en">inch per two pi radiant</t>
			</c>
			<c id="H58">
				<t id="en">metre per volt second</t>
			</c>
			<c id="H59">
				<t id="en">square metre per newton</t>
			</c>
			<c id="H60">
				<t id="en">cubic metre per cubic metre</t>
			</c>
			<c id="H61">
				<t id="en">millisiemens per centimetre</t>
			</c>
			<c id="H62">
				<t id="en">millivolt per minute</t>
			</c>
			<c id="H63">
				<t id="en">milligram per square centimetre</t>
			</c>
			<c id="H64">
				<t id="en">milligram per gram</t>
			</c>
			<c id="H65">
				<t id="en">millilitre per cubic metre</t>
			</c>
			<c id="H66">
				<t id="en">millimetre per year</t>
			</c>
			<c id="H67">
				<t id="en">millimetre per hour</t>
			</c>
			<c id="H68">
				<t id="en">millimole per gram</t>
			</c>
			<c id="H69">
				<t id="en">picopascal per kilometre</t>
			</c>
			<c id="H70">
				<t id="en">picosecond</t>
			</c>
			<c id="H71">
				<t id="en">percent per month</t>
			</c>
			<c id="H72">
				<t id="en">percent per hectobar</t>
			</c>
			<c id="H73">
				<t id="en">percent per decakelvin</t>
			</c>
			<c id="H74">
				<t id="en">watt per metre</t>
			</c>
			<c id="H75">
				<t id="en">decapascal</t>
			</c>
			<c id="H76">
				<t id="en">gram per millimetre</t>
			</c>
			<c id="H77">
				<t id="en">module width</t>
			</c>
			<c id="H79">
				<t id="en">French gauge</t>
			</c>
			<c id="H80">
				<t id="en">rack unit</t>
			</c>
			<c id="H81">
				<t id="en">millimetre per minute</t>
			</c>
			<c id="H82">
				<t id="en">big point</t>
			</c>
			<c id="H83">
				<t id="en">litre per kilogram</t>
			</c>
			<c id="H84">
				<t id="en">gram millimetre</t>
			</c>
			<c id="H85">
				<t id="en">reciprocal week</t>
			</c>
			<c id="H87">
				<t id="en">piece</t>
			</c>
			<c id="H88">
				<t id="en">megaohm kilometre</t>
			</c>
			<c id="H89">
				<t id="en">percent per ohm</t>
			</c>
			<c id="H90">
				<t id="en">percent per degree</t>
			</c>
			<c id="H91">
				<t id="en">percent per ten thousand</t>
			</c>
			<c id="H92">
				<t id="en">percent per one hundred thousand</t>
			</c>
			<c id="H93">
				<t id="en">percent per hundred</t>
			</c>
			<c id="H94">
				<t id="en">percent per thousand</t>
			</c>
			<c id="H95">
				<t id="en">percent per volt</t>
			</c>
			<c id="H96">
				<t id="en">percent per bar</t>
			</c>
			<c id="H98">
				<t id="en">percent per inch</t>
			</c>
			<c id="H99">
				<t id="en">percent per metre</t>
			</c>
			<c id="HA">
				<t id="en">hank</t>
			</c>
			<c id="HAD">
				<t id="en">Piece Day</t>
			</c>
			<c id="HBA">
				<t id="en">hectobar</t>
			</c>
			<c id="HBX">
				<t id="en">hundred boxes</t>
			</c>
			<c id="HC">
				<t id="en">hundred count</t>
			</c>
			<c id="HDW">
				<t id="en">hundred kilogram, dry weight</t>
			</c>
			<c id="HEA">
				<t id="en">head</t>
			</c>
			<c id="HGM">
				<t id="en">hectogram</t>
			</c>
			<c id="HH">
				<t id="en">hundred cubic foot</t>
			</c>
			<c id="HIU">
				<t id="en">hundred international unit</t>
			</c>
			<c id="HKM">
				<t id="en">hundred kilogram, net mass</t>
			</c>
			<c id="HLT">
				<t id="en">hectolitre</t>
			</c>
			<c id="HM">
				<t id="en">mile per hour (statute mile)</t>
			</c>
			<c id="HMO">
				<t id="en">Piece Month</t>
			</c>
			<c id="HMQ">
				<t id="en">million cubic metre</t>
			</c>
			<c id="HMT">
				<t id="en">hectometre</t>
			</c>
			<c id="HPA">
				<t id="en">hectolitre of pure alcohol</t>
			</c>
			<c id="HTZ">
				<t id="en">hertz</t>
			</c>
			<c id="HUR">
				<t id="en">hour</t>
			</c>
			<c id="HWE">
				<t id="en">Piece Week</t>
			</c>
			<c id="IA">
				<t id="en">inch pound (pound inch)</t>
			</c>
			<c id="IE">
				<t id="en">person</t>
			</c>
			<c id="INH">
				<t id="en">inch</t>
			</c>
			<c id="INK">
				<t id="en">square inch</t>
			</c>
			<c id="INQ">
				<t id="en">cubic inch</t>
			</c>
			<c id="ISD">
				<t id="en">international sugar degree</t>
			</c>
			<c id="IU">
				<t id="en">inch per second</t>
			</c>
			<c id="IUG">
				<t id="en">international unit per gram</t>
			</c>
			<c id="IV">
				<t id="en">inch per second squared</t>
			</c>
			<c id="J2">
				<t id="en">joule per kilogram</t>
			</c>
			<c id="J10">
				<t id="en">percent per millimetre</t>
			</c>
			<c id="J12">
				<t id="en">per mille per psi</t>
			</c>
			<c id="J13">
				<t id="en">degree API</t>
			</c>
			<c id="J14">
				<t id="en">degree Baume (origin scale)</t>
			</c>
			<c id="J15">
				<t id="en">degree Baume (US heavy)</t>
			</c>
			<c id="J16">
				<t id="en">degree Baume (US light)</t>
			</c>
			<c id="J17">
				<t id="en">degree Balling</t>
			</c>
			<c id="J18">
				<t id="en">degree Brix</t>
			</c>
			<c id="J19">
				<t id="en">degree Fahrenheit hour square foot per British thermal unit (thermochemical)</t>
			</c>
			<c id="J20">
				<t id="en">degree Fahrenheit per kelvin</t>
			</c>
			<c id="J21">
				<t id="en">degree Fahrenheit per bar</t>
			</c>
			<c id="J22">
				<t id="en">degree Fahrenheit hour square foot per British thermal unit (international
            table)</t>
			</c>
			<c id="J23">
				<t id="en">degree Fahrenheit per hour</t>
			</c>
			<c id="J24">
				<t id="en">degree Fahrenheit per minute</t>
			</c>
			<c id="J25">
				<t id="en">degree Fahrenheit per second</t>
			</c>
			<c id="J26">
				<t id="en">reciprocal degree Fahrenheit</t>
			</c>
			<c id="J27">
				<t id="en">degree Oechsle</t>
			</c>
			<c id="J28">
				<t id="en">degree Rankine per hour</t>
			</c>
			<c id="J29">
				<t id="en">degree Rankine per minute</t>
			</c>
			<c id="J30">
				<t id="en">degree Rankine per second</t>
			</c>
			<c id="J31">
				<t id="en">degree Twaddell</t>
			</c>
			<c id="J32">
				<t id="en">micropoise</t>
			</c>
			<c id="J33">
				<t id="en">microgram per kilogram</t>
			</c>
			<c id="J34">
				<t id="en">microgram per cubic metre kelvin</t>
			</c>
			<c id="J35">
				<t id="en">microgram per cubic metre bar</t>
			</c>
			<c id="J36">
				<t id="en">microlitre per litre</t>
			</c>
			<c id="J38">
				<t id="en">baud</t>
			</c>
			<c id="J39">
				<t id="en">British thermal unit (mean)</t>
			</c>
			<c id="J40">
				<t id="en">British thermal unit (international table) foot per hour square foot degree
            Fahrenheit</t>
			</c>
			<c id="J41">
				<t id="en">British thermal unit (international table) inch per hour square foot degree
            Fahrenheit</t>
			</c>
			<c id="J42">
				<t id="en">British thermal unit (international table) inch per second square foot degree
            Fahrenheit</t>
			</c>
			<c id="J43">
				<t id="en">British thermal unit (international table) per pound degree Fahrenheit</t>
			</c>
			<c id="J44">
				<t id="en">British thermal unit (international table) per minute</t>
			</c>
			<c id="J45">
				<t id="en">British thermal unit (international table) per second</t>
			</c>
			<c id="J46">
				<t id="en">British thermal unit (thermochemical) foot per hour square foot degree
            Fahrenheit</t>
			</c>
			<c id="J47">
				<t id="en">British thermal unit (thermochemical) per hour</t>
			</c>
			<c id="J48">
				<t id="en">British thermal unit (thermochemical) inch per hour square foot degree
            Fahrenheit</t>
			</c>
			<c id="J49">
				<t id="en">British thermal unit (thermochemical) inch per second square foot degree
            Fahrenheit</t>
			</c>
			<c id="J50">
				<t id="en">British thermal unit (thermochemical) per pound degree Fahrenheit</t>
			</c>
			<c id="J51">
				<t id="en">British thermal unit (thermochemical) per minute</t>
			</c>
			<c id="J52">
				<t id="en">British thermal unit (thermochemical) per second</t>
			</c>
			<c id="J53">
				<t id="en">coulomb square metre per kilogram</t>
			</c>
			<c id="J54">
				<t id="en">megabaud</t>
			</c>
			<c id="J55">
				<t id="en">watt second</t>
			</c>
			<c id="J56">
				<t id="en">bar per bar</t>
			</c>
			<c id="J57">
				<t id="en">barrel (UK petroleum)</t>
			</c>
			<c id="J58">
				<t id="en">barrel (UK petroleum) per minute</t>
			</c>
			<c id="J59">
				<t id="en">barrel (UK petroleum) per day</t>
			</c>
			<c id="J60">
				<t id="en">barrel (UK petroleum) per hour</t>
			</c>
			<c id="J61">
				<t id="en">barrel (UK petroleum) per second</t>
			</c>
			<c id="J62">
				<t id="en">barrel (US petroleum) per hour</t>
			</c>
			<c id="J63">
				<t id="en">barrel (US petroleum) per second</t>
			</c>
			<c id="J64">
				<t id="en">bushel (UK) per day</t>
			</c>
			<c id="J65">
				<t id="en">bushel (UK) per hour</t>
			</c>
			<c id="J66">
				<t id="en">bushel (UK) per minute</t>
			</c>
			<c id="J67">
				<t id="en">bushel (UK) per second</t>
			</c>
			<c id="J68">
				<t id="en">bushel (US dry) per day</t>
			</c>
			<c id="J69">
				<t id="en">bushel (US dry) per hour</t>
			</c>
			<c id="J70">
				<t id="en">bushel (US dry) per minute</t>
			</c>
			<c id="J71">
				<t id="en">bushel (US dry) per second</t>
			</c>
			<c id="J72">
				<t id="en">centinewton metre</t>
			</c>
			<c id="J73">
				<t id="en">centipoise per kelvin</t>
			</c>
			<c id="J74">
				<t id="en">centipoise per bar</t>
			</c>
			<c id="J75">
				<t id="en">calorie (mean)</t>
			</c>
			<c id="J76">
				<t id="en">calorie (international table) per gram degree Celsius</t>
			</c>
			<c id="J78">
				<t id="en">calorie (thermochemical) per centimetre second degree Celsius</t>
			</c>
			<c id="J79">
				<t id="en">calorie (thermochemical) per gram degree Celsius</t>
			</c>
			<c id="J81">
				<t id="en">calorie (thermochemical) per minute</t>
			</c>
			<c id="J82">
				<t id="en">calorie (thermochemical) per second</t>
			</c>
			<c id="J83">
				<t id="en">clo</t>
			</c>
			<c id="J84">
				<t id="en">centimetre per second kelvin</t>
			</c>
			<c id="J85">
				<t id="en">centimetre per second bar</t>
			</c>
			<c id="J87">
				<t id="en">cubic centimetre per cubic metre</t>
			</c>
			<c id="J90">
				<t id="en">cubic decimetre per day</t>
			</c>
			<c id="J91">
				<t id="en">cubic decimetre per cubic metre</t>
			</c>
			<c id="J92">
				<t id="en">cubic decimetre per minute</t>
			</c>
			<c id="J93">
				<t id="en">cubic decimetre per second</t>
			</c>
			<c id="J95">
				<t id="en">ounce (UK fluid) per day</t>
			</c>
			<c id="J96">
				<t id="en">ounce (UK fluid) per hour</t>
			</c>
			<c id="J97">
				<t id="en">ounce (UK fluid) per minute</t>
			</c>
			<c id="J98">
				<t id="en">ounce (UK fluid) per second</t>
			</c>
			<c id="J99">
				<t id="en">ounce (US fluid) per day</t>
			</c>
			<c id="JE">
				<t id="en">joule per kelvin</t>
			</c>
			<c id="JK">
				<t id="en">megajoule per kilogram</t>
			</c>
			<c id="JM">
				<t id="en">megajoule per cubic metre</t>
			</c>
			<c id="JNT">
				<t id="en">pipeline joint</t>
			</c>
			<c id="JOU">
				<t id="en">joule</t>
			</c>
			<c id="JPS">
				<t id="en">hundred metre</t>
			</c>
			<c id="JWL">
				<t id="en">number of jewels</t>
			</c>
			<c id="K1">
				<t id="en">kilowatt demand</t>
			</c>
			<c id="K2">
				<t id="en">kilovolt ampere reactive demand</t>
			</c>
			<c id="K3">
				<t id="en">kilovolt ampere reactive hour</t>
			</c>
			<c id="K6">
				<t id="en">kilolitre</t>
			</c>
			<c id="K10">
				<t id="en">ounce (US fluid) per hour</t>
			</c>
			<c id="K11">
				<t id="en">ounce (US fluid) per minute</t>
			</c>
			<c id="K12">
				<t id="en">ounce (US fluid) per second</t>
			</c>
			<c id="K13">
				<t id="en">foot per degree Fahrenheit</t>
			</c>
			<c id="K14">
				<t id="en">foot per hour</t>
			</c>
			<c id="K15">
				<t id="en">foot pound-force per hour</t>
			</c>
			<c id="K16">
				<t id="en">foot pound-force per minute</t>
			</c>
			<c id="K17">
				<t id="en">foot per psi</t>
			</c>
			<c id="K18">
				<t id="en">foot per second degree Fahrenheit</t>
			</c>
			<c id="K19">
				<t id="en">foot per second psi</t>
			</c>
			<c id="K20">
				<t id="en">reciprocal cubic foot</t>
			</c>
			<c id="K21">
				<t id="en">cubic foot per degree Fahrenheit</t>
			</c>
			<c id="K22">
				<t id="en">cubic foot per day</t>
			</c>
			<c id="K23">
				<t id="en">cubic foot per psi</t>
			</c>
			<c id="K26">
				<t id="en">gallon (UK) per day</t>
			</c>
			<c id="K27">
				<t id="en">gallon (UK) per hour</t>
			</c>
			<c id="K28">
				<t id="en">gallon (UK) per second</t>
			</c>
			<c id="K30">
				<t id="en">gallon (US liquid) per second</t>
			</c>
			<c id="K31">
				<t id="en">gram-force per square centimetre</t>
			</c>
			<c id="K32">
				<t id="en">gill (UK) per day</t>
			</c>
			<c id="K33">
				<t id="en">gill (UK) per hour</t>
			</c>
			<c id="K34">
				<t id="en">gill (UK) per minute</t>
			</c>
			<c id="K35">
				<t id="en">gill (UK) per second</t>
			</c>
			<c id="K36">
				<t id="en">gill (US) per day</t>
			</c>
			<c id="K37">
				<t id="en">gill (US) per hour</t>
			</c>
			<c id="K38">
				<t id="en">gill (US) per minute</t>
			</c>
			<c id="K39">
				<t id="en">gill (US) per second</t>
			</c>
			<c id="K40">
				<t id="en">standard acceleration of free fall</t>
			</c>
			<c id="K41">
				<t id="en">grain per gallon (US)</t>
			</c>
			<c id="K42">
				<t id="en">horsepower (boiler)</t>
			</c>
			<c id="K43">
				<t id="en">horsepower (electric)</t>
			</c>
			<c id="K45">
				<t id="en">inch per degree Fahrenheit</t>
			</c>
			<c id="K46">
				<t id="en">inch per psi</t>
			</c>
			<c id="K47">
				<t id="en">inch per second degree Fahrenheit</t>
			</c>
			<c id="K48">
				<t id="en">inch per second psi</t>
			</c>
			<c id="K49">
				<t id="en">reciprocal cubic inch</t>
			</c>
			<c id="K50">
				<t id="en">kilobaud</t>
			</c>
			<c id="K51">
				<t id="en">kilocalorie (mean)</t>
			</c>
			<c id="K52">
				<t id="en">kilocalorie (international table) per hour metre degree Celsius</t>
			</c>
			<c id="K53">
				<t id="en">kilocalorie (thermochemical)</t>
			</c>
			<c id="K54">
				<t id="en">kilocalorie (thermochemical) per minute</t>
			</c>
			<c id="K55">
				<t id="en">kilocalorie (thermochemical) per second</t>
			</c>
			<c id="K58">
				<t id="en">kilomole per hour</t>
			</c>
			<c id="K59">
				<t id="en">kilomole per cubic metre kelvin</t>
			</c>
			<c id="K60">
				<t id="en">kilomole per cubic metre bar</t>
			</c>
			<c id="K61">
				<t id="en">kilomole per minute</t>
			</c>
			<c id="K62">
				<t id="en">litre per litre</t>
			</c>
			<c id="K63">
				<t id="en">reciprocal litre</t>
			</c>
			<c id="K64">
				<t id="en">pound (avoirdupois) per degree Fahrenheit</t>
			</c>
			<c id="K65">
				<t id="en">pound (avoirdupois) square foot</t>
			</c>
			<c id="K66">
				<t id="en">pound (avoirdupois) per day</t>
			</c>
			<c id="K67">
				<t id="en">pound per foot hour</t>
			</c>
			<c id="K68">
				<t id="en">pound per foot second</t>
			</c>
			<c id="K69">
				<t id="en">pound (avoirdupois) per cubic foot degree Fahrenheit</t>
			</c>
			<c id="K70">
				<t id="en">pound (avoirdupois) per cubic foot psi</t>
			</c>
			<c id="K71">
				<t id="en">pound (avoirdupois) per gallon (UK)</t>
			</c>
			<c id="K73">
				<t id="en">pound (avoirdupois) per hour degree Fahrenheit</t>
			</c>
			<c id="K74">
				<t id="en">pound (avoirdupois) per hour psi</t>
			</c>
			<c id="K75">
				<t id="en">pound (avoirdupois) per cubic inch degree Fahrenheit</t>
			</c>
			<c id="K76">
				<t id="en">pound (avoirdupois) per cubic inch psi</t>
			</c>
			<c id="K77">
				<t id="en">pound (avoirdupois) per psi</t>
			</c>
			<c id="K78">
				<t id="en">pound (avoirdupois) per minute</t>
			</c>
			<c id="K79">
				<t id="en">pound (avoirdupois) per minute degree Fahrenheit</t>
			</c>
			<c id="K80">
				<t id="en">pound (avoirdupois) per minute psi</t>
			</c>
			<c id="K81">
				<t id="en">pound (avoirdupois) per second</t>
			</c>
			<c id="K82">
				<t id="en">pound (avoirdupois) per second degree Fahrenheit</t>
			</c>
			<c id="K83">
				<t id="en">pound (avoirdupois) per second psi</t>
			</c>
			<c id="K84">
				<t id="en">pound per cubic yard</t>
			</c>
			<c id="K85">
				<t id="en">pound-force per square foot</t>
			</c>
			<c id="K86">
				<t id="en">pound-force per square inch degree Fahrenheit</t>
			</c>
			<c id="K87">
				<t id="en">psi cubic inch per second</t>
			</c>
			<c id="K88">
				<t id="en">psi litre per second</t>
			</c>
			<c id="K89">
				<t id="en">psi cubic metre per second</t>
			</c>
			<c id="K90">
				<t id="en">psi cubic yard per second</t>
			</c>
			<c id="K91">
				<t id="en">pound-force second per square foot</t>
			</c>
			<c id="K92">
				<t id="en">pound-force second per square inch</t>
			</c>
			<c id="K93">
				<t id="en">reciprocal psi</t>
			</c>
			<c id="K94">
				<t id="en">quart (UK liquid) per day</t>
			</c>
			<c id="K95">
				<t id="en">quart (UK liquid) per hour</t>
			</c>
			<c id="K96">
				<t id="en">quart (UK liquid) per minute</t>
			</c>
			<c id="K97">
				<t id="en">quart (UK liquid) per second</t>
			</c>
			<c id="K98">
				<t id="en">quart (US liquid) per day</t>
			</c>
			<c id="K99">
				<t id="en">quart (US liquid) per hour</t>
			</c>
			<c id="KA">
				<t id="en">cake</t>
			</c>
			<c id="KAT">
				<t id="en">katal</t>
			</c>
			<c id="KB">
				<t id="en">kilocharacter</t>
			</c>
			<c id="KBA">
				<t id="en">kilobar</t>
			</c>
			<c id="KCC">
				<t id="en">kilogram of choline chloride</t>
			</c>
			<c id="KDW">
				<t id="en">kilogram drained net weight</t>
			</c>
			<c id="KEL">
				<t id="en">kelvin</t>
			</c>
			<c id="KGM">
				<t id="en">kilogram</t>
			</c>
			<c id="KGS">
				<t id="en">kilogram per second</t>
			</c>
			<c id="KHY">
				<t id="en">kilogram of hydrogen peroxide</t>
			</c>
			<c id="KHZ">
				<t id="en">kilohertz</t>
			</c>
			<c id="KI">
				<t id="en">kilogram per millimetre width</t>
			</c>
			<c id="KIC">
				<t id="en">kilogram, including container</t>
			</c>
			<c id="KIP">
				<t id="en">kilogram, including inner packaging</t>
			</c>
			<c id="KJ">
				<t id="en">kilosegment</t>
			</c>
			<c id="KJO">
				<t id="en">kilojoule</t>
			</c>
			<c id="KL">
				<t id="en">kilogram per metre</t>
			</c>
			<c id="KLK">
				<t id="en">lactic dry material percentage</t>
			</c>
			<c id="KLX">
				<t id="en">kilolux</t>
			</c>
			<c id="KMA">
				<t id="en">kilogram of methylamine</t>
			</c>
			<c id="KMH">
				<t id="en">kilometre per hour</t>
			</c>
			<c id="KMK">
				<t id="en">square kilometre</t>
			</c>
			<c id="KMQ">
				<t id="en">kilogram per cubic metre</t>
			</c>
			<c id="KMT">
				<t id="en">kilometre</t>
			</c>
			<c id="KNI">
				<t id="en">kilogram of nitrogen</t>
			</c>
			<c id="KNM">
				<t id="en">kilonewton per square metre</t>
			</c>
			<c id="KNS">
				<t id="en">kilogram named substance</t>
			</c>
			<c id="KNT">
				<t id="en">knot</t>
			</c>
			<c id="KO">
				<t id="en">milliequivalence caustic potash per gram of product</t>
			</c>
			<c id="KPA">
				<t id="en">kilopascal</t>
			</c>
			<c id="KPH">
				<t id="en">kilogram of potassium hydroxide (caustic potash)</t>
			</c>
			<c id="KPO">
				<t id="en">kilogram of potassium oxide</t>
			</c>
			<c id="KPP">
				<t id="en">kilogram of phosphorus pentoxide (phosphoric anhydride)</t>
			</c>
			<c id="KR">
				<t id="en">kiloroentgen</t>
			</c>
			<c id="KSD">
				<t id="en">kilogram of substance 90 % dry</t>
			</c>
			<c id="KSH">
				<t id="en">kilogram of sodium hydroxide (caustic soda)</t>
			</c>
			<c id="KT">
				<t id="en">kit</t>
			</c>
			<c id="KTN">
				<t id="en">kilotonne</t>
			</c>
			<c id="KUR">
				<t id="en">kilogram of uranium</t>
			</c>
			<c id="KVA">
				<t id="en">kilovolt - ampere</t>
			</c>
			<c id="KVR">
				<t id="en">kilovar</t>
			</c>
			<c id="KVT">
				<t id="en">kilovolt</t>
			</c>
			<c id="KW">
				<t id="en">kilogram per millimetre</t>
			</c>
			<c id="KWH">
				<t id="en">kilowatt hour</t>
			</c>
			<c id="KWN">
				<t id="en">Kilowatt hour per normalized cubic metre</t>
			</c>
			<c id="KWO">
				<t id="en">kilogram of tungsten trioxide</t>
			</c>
			<c id="KWS">
				<t id="en">Kilowatt hour per standard cubic metre</t>
			</c>
			<c id="KWT">
				<t id="en">kilowatt</t>
			</c>
			<c id="KWY">
				<t id="en">kilowatt year</t>
			</c>
			<c id="KX">
				<t id="en">millilitre per kilogram</t>
			</c>
			<c id="L2">
				<t id="en">litre per minute</t>
			</c>
			<c id="L10">
				<t id="en">quart (US liquid) per minute</t>
			</c>
			<c id="L11">
				<t id="en">quart (US liquid) per second</t>
			</c>
			<c id="L12">
				<t id="en">metre per second kelvin</t>
			</c>
			<c id="L13">
				<t id="en">metre per second bar</t>
			</c>
			<c id="L14">
				<t id="en">square metre hour degree Celsius per kilocalorie (international table)</t>
			</c>
			<c id="L15">
				<t id="en">millipascal second per kelvin</t>
			</c>
			<c id="L16">
				<t id="en">millipascal second per bar</t>
			</c>
			<c id="L17">
				<t id="en">milligram per cubic metre kelvin</t>
			</c>
			<c id="L18">
				<t id="en">milligram per cubic metre bar</t>
			</c>
			<c id="L19">
				<t id="en">millilitre per litre</t>
			</c>
			<c id="L20">
				<t id="en">reciprocal cubic millimetre</t>
			</c>
			<c id="L21">
				<t id="en">cubic millimetre per cubic metre</t>
			</c>
			<c id="L23">
				<t id="en">mole per hour</t>
			</c>
			<c id="L24">
				<t id="en">mole per kilogram kelvin</t>
			</c>
			<c id="L25">
				<t id="en">mole per kilogram bar</t>
			</c>
			<c id="L26">
				<t id="en">mole per litre kelvin</t>
			</c>
			<c id="L27">
				<t id="en">mole per litre bar</t>
			</c>
			<c id="L28">
				<t id="en">mole per cubic metre kelvin</t>
			</c>
			<c id="L29">
				<t id="en">mole per cubic metre bar</t>
			</c>
			<c id="L30">
				<t id="en">mole per minute</t>
			</c>
			<c id="L31">
				<t id="en">milliroentgen aequivalent men</t>
			</c>
			<c id="L32">
				<t id="en">nanogram per kilogram</t>
			</c>
			<c id="L33">
				<t id="en">ounce (avoirdupois) per day</t>
			</c>
			<c id="L34">
				<t id="en">ounce (avoirdupois) per hour</t>
			</c>
			<c id="L35">
				<t id="en">ounce (avoirdupois) per minute</t>
			</c>
			<c id="L36">
				<t id="en">ounce (avoirdupois) per second</t>
			</c>
			<c id="L37">
				<t id="en">ounce (avoirdupois) per gallon (UK)</t>
			</c>
			<c id="L38">
				<t id="en">ounce (avoirdupois) per gallon (US)</t>
			</c>
			<c id="L39">
				<t id="en">ounce (avoirdupois) per cubic inch</t>
			</c>
			<c id="L40">
				<t id="en">ounce (avoirdupois)-force</t>
			</c>
			<c id="L41">
				<t id="en">ounce (avoirdupois)-force inch</t>
			</c>
			<c id="L42">
				<t id="en">picosiemens per metre</t>
			</c>
			<c id="L43">
				<t id="en">peck (UK)</t>
			</c>
			<c id="L44">
				<t id="en">peck (UK) per day</t>
			</c>
			<c id="L45">
				<t id="en">peck (UK) per hour</t>
			</c>
			<c id="L46">
				<t id="en">peck (UK) per minute</t>
			</c>
			<c id="L47">
				<t id="en">peck (UK) per second</t>
			</c>
			<c id="L48">
				<t id="en">peck (US dry) per day</t>
			</c>
			<c id="L49">
				<t id="en">peck (US dry) per hour</t>
			</c>
			<c id="L50">
				<t id="en">peck (US dry) per minute</t>
			</c>
			<c id="L51">
				<t id="en">peck (US dry) per second</t>
			</c>
			<c id="L52">
				<t id="en">psi per psi</t>
			</c>
			<c id="L53">
				<t id="en">pint (UK) per day</t>
			</c>
			<c id="L54">
				<t id="en">pint (UK) per hour</t>
			</c>
			<c id="L55">
				<t id="en">pint (UK) per minute</t>
			</c>
			<c id="L56">
				<t id="en">pint (UK) per second</t>
			</c>
			<c id="L57">
				<t id="en">pint (US liquid) per day</t>
			</c>
			<c id="L58">
				<t id="en">pint (US liquid) per hour</t>
			</c>
			<c id="L59">
				<t id="en">pint (US liquid) per minute</t>
			</c>
			<c id="L60">
				<t id="en">pint (US liquid) per second</t>
			</c>
			<c id="L63">
				<t id="en">slug per day</t>
			</c>
			<c id="L64">
				<t id="en">slug per foot second</t>
			</c>
			<c id="L65">
				<t id="en">slug per cubic foot</t>
			</c>
			<c id="L66">
				<t id="en">slug per hour</t>
			</c>
			<c id="L67">
				<t id="en">slug per minute</t>
			</c>
			<c id="L68">
				<t id="en">slug per second</t>
			</c>
			<c id="L69">
				<t id="en">tonne per kelvin</t>
			</c>
			<c id="L70">
				<t id="en">tonne per bar</t>
			</c>
			<c id="L71">
				<t id="en">tonne per day</t>
			</c>
			<c id="L72">
				<t id="en">tonne per day kelvin</t>
			</c>
			<c id="L73">
				<t id="en">tonne per day bar</t>
			</c>
			<c id="L74">
				<t id="en">tonne per hour kelvin</t>
			</c>
			<c id="L75">
				<t id="en">tonne per hour bar</t>
			</c>
			<c id="L76">
				<t id="en">tonne per cubic metre kelvin</t>
			</c>
			<c id="L77">
				<t id="en">tonne per cubic metre bar</t>
			</c>
			<c id="L78">
				<t id="en">tonne per minute</t>
			</c>
			<c id="L79">
				<t id="en">tonne per minute kelvin</t>
			</c>
			<c id="L80">
				<t id="en">tonne per minute bar</t>
			</c>
			<c id="L81">
				<t id="en">tonne per second</t>
			</c>
			<c id="L82">
				<t id="en">tonne per second kelvin</t>
			</c>
			<c id="L83">
				<t id="en">tonne per second bar</t>
			</c>
			<c id="L84">
				<t id="en">ton (UK shipping)</t>
			</c>
			<c id="L85">
				<t id="en">ton long per day</t>
			</c>
			<c id="L86">
				<t id="en">ton (US shipping)</t>
			</c>
			<c id="L87">
				<t id="en">ton short per degree Fahrenheit</t>
			</c>
			<c id="L88">
				<t id="en">ton short per day</t>
			</c>
			<c id="L89">
				<t id="en">ton short per hour degree Fahrenheit</t>
			</c>
			<c id="L90">
				<t id="en">ton short per hour psi</t>
			</c>
			<c id="L91">
				<t id="en">ton short per psi</t>
			</c>
			<c id="L92">
				<t id="en">ton (UK long) per cubic yard</t>
			</c>
			<c id="L93">
				<t id="en">ton (US short) per cubic yard</t>
			</c>
			<c id="L94">
				<t id="en">ton-force (US short)</t>
			</c>
			<c id="L95">
				<t id="en">common year</t>
			</c>
			<c id="L96">
				<t id="en">sidereal year</t>
			</c>
			<c id="L98">
				<t id="en">yard per degree Fahrenheit</t>
			</c>
			<c id="L99">
				<t id="en">yard per psi</t>
			</c>
			<c id="LA">
				<t id="en">pound per cubic inch</t>
			</c>
			<c id="LAC">
				<t id="en">lactose excess percentage</t>
			</c>
			<c id="LBR">
				<t id="en">pound</t>
			</c>
			<c id="LBT">
				<t id="en">troy pound (US)</t>
			</c>
			<c id="LD">
				<t id="en">litre per day</t>
			</c>
			<c id="LEF">
				<t id="en">leaf</t>
			</c>
			<c id="LF">
				<t id="en">linear foot</t>
			</c>
			<c id="LH">
				<t id="en">labour hour</t>
			</c>
			<c id="LK">
				<t id="en">link</t>
			</c>
			<c id="LM">
				<t id="en">linear metre</t>
			</c>
			<c id="LN">
				<t id="en">length</t>
			</c>
			<c id="LO">
				<t id="en">lot [unit of procurement]</t>
			</c>
			<c id="LP">
				<t id="en">liquid pound</t>
			</c>
			<c id="LPA">
				<t id="en">litre of pure alcohol</t>
			</c>
			<c id="LR">
				<t id="en">layer</t>
			</c>
			<c id="LS">
				<t id="en">lump sum</t>
			</c>
			<c id="LTN">
				<t id="en">ton (UK) or long ton (US)</t>
			</c>
			<c id="LTR">
				<t id="en">litre</t>
			</c>
			<c id="LUB">
				<t id="en">metric ton, lubricating oil</t>
			</c>
			<c id="LUM">
				<t id="en">lumen</t>
			</c>
			<c id="LUX">
				<t id="en">lux</t>
			</c>
			<c id="LY">
				<t id="en">linear yard</t>
			</c>
			<c id="M1">
				<t id="en">milligram per litre</t>
			</c>
			<c id="M4">
				<t id="en">monetary value</t>
			</c>
			<c id="M5">
				<t id="en">microcurie</t>
			</c>
			<c id="M7">
				<t id="en">micro-inch</t>
			</c>
			<c id="M9">
				<t id="en">million Btu per 1000 cubic foot</t>
			</c>
			<c id="M10">
				<t id="en">reciprocal cubic yard</t>
			</c>
			<c id="M11">
				<t id="en">cubic yard per degree Fahrenheit</t>
			</c>
			<c id="M12">
				<t id="en">cubic yard per day</t>
			</c>
			<c id="M13">
				<t id="en">cubic yard per hour</t>
			</c>
			<c id="M14">
				<t id="en">cubic yard per psi</t>
			</c>
			<c id="M15">
				<t id="en">cubic yard per minute</t>
			</c>
			<c id="M16">
				<t id="en">cubic yard per second</t>
			</c>
			<c id="M17">
				<t id="en">kilohertz metre</t>
			</c>
			<c id="M18">
				<t id="en">gigahertz metre</t>
			</c>
			<c id="M19">
				<t id="en">Beaufort</t>
			</c>
			<c id="M20">
				<t id="en">reciprocal megakelvin or megakelvin to the power minus one</t>
			</c>
			<c id="M21">
				<t id="en">reciprocal kilovolt - ampere reciprocal hour</t>
			</c>
			<c id="M22">
				<t id="en">millilitre per square centimetre minute</t>
			</c>
			<c id="M23">
				<t id="en">newton per centimetre</t>
			</c>
			<c id="M24">
				<t id="en">ohm kilometre</t>
			</c>
			<c id="M25">
				<t id="en">percent per degree Celsius</t>
			</c>
			<c id="M26">
				<t id="en">gigaohm per metre</t>
			</c>
			<c id="M27">
				<t id="en">megahertz metre</t>
			</c>
			<c id="M29">
				<t id="en">kilogram per kilogram</t>
			</c>
			<c id="M30">
				<t id="en">reciprocal volt - ampere reciprocal second</t>
			</c>
			<c id="M31">
				<t id="en">kilogram per kilometre</t>
			</c>
			<c id="M32">
				<t id="en">pascal second per litre</t>
			</c>
			<c id="M33">
				<t id="en">millimole per litre</t>
			</c>
			<c id="M34">
				<t id="en">newton metre per square metre</t>
			</c>
			<c id="M35">
				<t id="en">millivolt - ampere</t>
			</c>
			<c id="M36">
				<t id="en">30-day month</t>
			</c>
			<c id="M37">
				<t id="en">actual/360</t>
			</c>
			<c id="M38">
				<t id="en">kilometre per second squared</t>
			</c>
			<c id="M39">
				<t id="en">centimetre per second squared</t>
			</c>
			<c id="M40">
				<t id="en">yard per second squared</t>
			</c>
			<c id="M41">
				<t id="en">millimetre per second squared</t>
			</c>
			<c id="M42">
				<t id="en">mile (statute mile) per second squared</t>
			</c>
			<c id="M43">
				<t id="en">mil</t>
			</c>
			<c id="M44">
				<t id="en">revolution</t>
			</c>
			<c id="M45">
				<t id="en">degree [unit of angle] per second squared</t>
			</c>
			<c id="M46">
				<t id="en">revolution per minute</t>
			</c>
			<c id="M47">
				<t id="en">circular mil</t>
			</c>
			<c id="M48">
				<t id="en">square mile (based on U.S. survey foot)</t>
			</c>
			<c id="M49">
				<t id="en">chain (based on U.S. survey foot)</t>
			</c>
			<c id="M50">
				<t id="en">furlong</t>
			</c>
			<c id="M51">
				<t id="en">foot (U.S. survey)</t>
			</c>
			<c id="M52">
				<t id="en">mile (based on U.S. survey foot)</t>
			</c>
			<c id="M53">
				<t id="en">metre per pascal</t>
			</c>
			<c id="M55">
				<t id="en">metre per radiant</t>
			</c>
			<c id="M56">
				<t id="en">shake</t>
			</c>
			<c id="M57">
				<t id="en">mile per minute</t>
			</c>
			<c id="M58">
				<t id="en">mile per second</t>
			</c>
			<c id="M59">
				<t id="en">metre per second pascal</t>
			</c>
			<c id="M60">
				<t id="en">metre per hour</t>
			</c>
			<c id="M61">
				<t id="en">inch per year</t>
			</c>
			<c id="M62">
				<t id="en">kilometre per second</t>
			</c>
			<c id="M63">
				<t id="en">inch per minute</t>
			</c>
			<c id="M64">
				<t id="en">yard per second</t>
			</c>
			<c id="M65">
				<t id="en">yard per minute</t>
			</c>
			<c id="M66">
				<t id="en">yard per hour</t>
			</c>
			<c id="M67">
				<t id="en">acre-foot (based on U.S. survey foot)</t>
			</c>
			<c id="M68">
				<t id="en">cord (128 ft3)</t>
			</c>
			<c id="M69">
				<t id="en">cubic mile (UK statute)</t>
			</c>
			<c id="M70">
				<t id="en">ton, register</t>
			</c>
			<c id="M71">
				<t id="en">cubic metre per pascal</t>
			</c>
			<c id="M72">
				<t id="en">bel</t>
			</c>
			<c id="M73">
				<t id="en">kilogram per cubic metre pascal</t>
			</c>
			<c id="M74">
				<t id="en">kilogram per pascal</t>
			</c>
			<c id="M75">
				<t id="en">kilopound-force</t>
			</c>
			<c id="M76">
				<t id="en">poundal</t>
			</c>
			<c id="M77">
				<t id="en">kilogram metre per second squared</t>
			</c>
			<c id="M78">
				<t id="en">pond</t>
			</c>
			<c id="M79">
				<t id="en">square foot per hour</t>
			</c>
			<c id="M80">
				<t id="en">stokes per pascal</t>
			</c>
			<c id="M81">
				<t id="en">square centimetre per second</t>
			</c>
			<c id="M82">
				<t id="en">square metre per second pascal</t>
			</c>
			<c id="M83">
				<t id="en">denier</t>
			</c>
			<c id="M84">
				<t id="en">pound per yard</t>
			</c>
			<c id="M85">
				<t id="en">ton, assay</t>
			</c>
			<c id="M86">
				<t id="en">pfund</t>
			</c>
			<c id="M87">
				<t id="en">kilogram per second pascal</t>
			</c>
			<c id="M88">
				<t id="en">tonne per month</t>
			</c>
			<c id="M89">
				<t id="en">tonne per year</t>
			</c>
			<c id="M90">
				<t id="en">kilopound per hour</t>
			</c>
			<c id="M91">
				<t id="en">pound per pound</t>
			</c>
			<c id="M92">
				<t id="en">pound-force foot</t>
			</c>
			<c id="M93">
				<t id="en">newton metre per radian</t>
			</c>
			<c id="M94">
				<t id="en">kilogram metre</t>
			</c>
			<c id="M95">
				<t id="en">poundal foot</t>
			</c>
			<c id="M96">
				<t id="en">poundal inch</t>
			</c>
			<c id="M97">
				<t id="en">dyne metre</t>
			</c>
			<c id="M98">
				<t id="en">kilogram centimetre per second</t>
			</c>
			<c id="M99">
				<t id="en">gram centimetre per second</t>
			</c>
			<c id="MAH">
				<t id="en">megavolt ampere reactive hour</t>
			</c>
			<c id="MAL">
				<t id="en">megalitre</t>
			</c>
			<c id="MAM">
				<t id="en">megametre</t>
			</c>
			<c id="MAR">
				<t id="en">megavar</t>
			</c>
			<c id="MAW">
				<t id="en">megawatt</t>
			</c>
			<c id="MBE">
				<t id="en">thousand standard brick equivalent</t>
			</c>
			<c id="MBF">
				<t id="en">thousand board foot</t>
			</c>
			<c id="MBR">
				<t id="en">millibar</t>
			</c>
			<c id="MC">
				<t id="en">microgram</t>
			</c>
			<c id="MCU">
				<t id="en">millicurie</t>
			</c>
			<c id="MD">
				<t id="en">air dry metric ton</t>
			</c>
			<c id="MGM">
				<t id="en">milligram</t>
			</c>
			<c id="MHZ">
				<t id="en">megahertz</t>
			</c>
			<c id="MIK">
				<t id="en">square mile (statute mile)</t>
			</c>
			<c id="MIL">
				<t id="en">thousand</t>
			</c>
			<c id="MIN">
				<t id="en">minute [unit of time]</t>
			</c>
			<c id="MIO">
				<t id="en">million</t>
			</c>
			<c id="MIU">
				<t id="en">million international unit</t>
			</c>
			<c id="MKD">
				<t id="en">Square Metre Day</t>
			</c>
			<c id="MKM">
				<t id="en">Square Metre Month</t>
			</c>
			<c id="MKW">
				<t id="en">Square Metre Week</t>
			</c>
			<c id="MLD">
				<t id="en">milliard</t>
			</c>
			<c id="MLT">
				<t id="en">millilitre</t>
			</c>
			<c id="MMK">
				<t id="en">square millimetre</t>
			</c>
			<c id="MMQ">
				<t id="en">cubic millimetre</t>
			</c>
			<c id="MMT">
				<t id="en">millimetre</t>
			</c>
			<c id="MND">
				<t id="en">kilogram, dry weight</t>
			</c>
			<c id="MNJ">
				<t id="en">Mega Joule per Normalised cubic Metre</t>
			</c>
			<c id="MON">
				<t id="en">month</t>
			</c>
			<c id="MPA">
				<t id="en">megapascal</t>
			</c>
			<c id="MQD">
				<t id="en">Cubic Metre Day</t>
			</c>
			<c id="MQH">
				<t id="en">cubic metre per hour</t>
			</c>
			<c id="MQM">
				<t id="en">Cubic Metre Month</t>
			</c>
			<c id="MQS">
				<t id="en">cubic metre per second</t>
			</c>
			<c id="MQW">
				<t id="en">Cubic Metre Week</t>
			</c>
			<c id="MRD">
				<t id="en">Metre Day</t>
			</c>
			<c id="MRM">
				<t id="en">Metre Month</t>
			</c>
			<c id="MRW">
				<t id="en">Metre Week</t>
			</c>
			<c id="MSK">
				<t id="en">metre per second squared</t>
			</c>
			<c id="MTK">
				<t id="en">square metre</t>
			</c>
			<c id="MTQ">
				<t id="en">cubic metre</t>
			</c>
			<c id="MTR">
				<t id="en">metre</t>
			</c>
			<c id="MTS">
				<t id="en">metre per second</t>
			</c>
			<c id="MTZ">
				<t id="en">milihertz</t>
			</c>
			<c id="MVA">
				<t id="en">megavolt - ampere</t>
			</c>
			<c id="MWH">
				<t id="en">megawatt hour (1000 kW.h)</t>
			</c>
			<c id="N1">
				<t id="en">pen calorie</t>
			</c>
			<c id="N3">
				<t id="en">print point</t>
			</c>
			<c id="N10">
				<t id="en">pound foot per second</t>
			</c>
			<c id="N11">
				<t id="en">pound inch per second</t>
			</c>
			<c id="N12">
				<t id="en">Pferdestaerke</t>
			</c>
			<c id="N13">
				<t id="en">centimetre of mercury (0 ºC)</t>
			</c>
			<c id="N14">
				<t id="en">centimetre of water (4 ºC)</t>
			</c>
			<c id="N15">
				<t id="en">foot of water (39.2 ºF)</t>
			</c>
			<c id="N16">
				<t id="en">inch of mercury (32 ºF)</t>
			</c>
			<c id="N17">
				<t id="en">inch of mercury (60 ºF)</t>
			</c>
			<c id="N18">
				<t id="en">inch of water (39.2 ºF)</t>
			</c>
			<c id="N19">
				<t id="en">inch of water (60 ºF)</t>
			</c>
			<c id="N20">
				<t id="en">kip per square inch</t>
			</c>
			<c id="N21">
				<t id="en">poundal per square foot</t>
			</c>
			<c id="N22">
				<t id="en">ounce (avoirdupois) per square inch</t>
			</c>
			<c id="N23">
				<t id="en">conventional metre of water</t>
			</c>
			<c id="N24">
				<t id="en">gram per square millimetre</t>
			</c>
			<c id="N25">
				<t id="en">pound per square yard</t>
			</c>
			<c id="N26">
				<t id="en">poundal per square inch</t>
			</c>
			<c id="N27">
				<t id="en">foot to the fourth power</t>
			</c>
			<c id="N28">
				<t id="en">cubic decimetre per kilogram</t>
			</c>
			<c id="N29">
				<t id="en">cubic foot per pound</t>
			</c>
			<c id="N30">
				<t id="en">cubic inch per pound</t>
			</c>
			<c id="N31">
				<t id="en">kilonewton per metre</t>
			</c>
			<c id="N32">
				<t id="en">poundal per inch</t>
			</c>
			<c id="N33">
				<t id="en">pound-force per yard</t>
			</c>
			<c id="N34">
				<t id="en">poundal second per square foot</t>
			</c>
			<c id="N35">
				<t id="en">poise per pascal</t>
			</c>
			<c id="N36">
				<t id="en">newton second per square metre</t>
			</c>
			<c id="N37">
				<t id="en">kilogram per metre second</t>
			</c>
			<c id="N38">
				<t id="en">kilogram per metre minute</t>
			</c>
			<c id="N39">
				<t id="en">kilogram per metre day</t>
			</c>
			<c id="N40">
				<t id="en">kilogram per metre hour</t>
			</c>
			<c id="N41">
				<t id="en">gram per centimetre second</t>
			</c>
			<c id="N42">
				<t id="en">poundal second per square inch</t>
			</c>
			<c id="N43">
				<t id="en">pound per foot minute</t>
			</c>
			<c id="N44">
				<t id="en">pound per foot day</t>
			</c>
			<c id="N45">
				<t id="en">cubic metre per second pascal</t>
			</c>
			<c id="N46">
				<t id="en">foot poundal</t>
			</c>
			<c id="N47">
				<t id="en">inch poundal</t>
			</c>
			<c id="N48">
				<t id="en">watt per square centimetre</t>
			</c>
			<c id="N49">
				<t id="en">watt per square inch</t>
			</c>
			<c id="N50">
				<t id="en">British thermal unit (international table) per square foot hour</t>
			</c>
			<c id="N51">
				<t id="en">British thermal unit (thermochemical) per square foot hour</t>
			</c>
			<c id="N52">
				<t id="en">British thermal unit (thermochemical) per square foot minute</t>
			</c>
			<c id="N53">
				<t id="en">British thermal unit (international table) per square foot second</t>
			</c>
			<c id="N54">
				<t id="en">British thermal unit (thermochemical) per square foot second</t>
			</c>
			<c id="N55">
				<t id="en">British thermal unit (international table) per square inch second</t>
			</c>
			<c id="N56">
				<t id="en">calorie (thermochemical) per square centimetre minute</t>
			</c>
			<c id="N57">
				<t id="en">calorie (thermochemical) per square centimetre second</t>
			</c>
			<c id="N58">
				<t id="en">British thermal unit (international table) per cubic foot</t>
			</c>
			<c id="N59">
				<t id="en">British thermal unit (thermochemical) per cubic foot</t>
			</c>
			<c id="N60">
				<t id="en">British thermal unit (international table) per degree Fahrenheit</t>
			</c>
			<c id="N61">
				<t id="en">British thermal unit (thermochemical) per degree Fahrenheit</t>
			</c>
			<c id="N62">
				<t id="en">British thermal unit (international table) per degree Rankine</t>
			</c>
			<c id="N63">
				<t id="en">British thermal unit (thermochemical) per degree Rankine</t>
			</c>
			<c id="N64">
				<t id="en">British thermal unit (thermochemical) per pound degree Rankine</t>
			</c>
			<c id="N65">
				<t id="en">kilocalorie (international table) per gram kelvin</t>
			</c>
			<c id="N66">
				<t id="en">British thermal unit (39 ºF)</t>
			</c>
			<c id="N67">
				<t id="en">British thermal unit (59 ºF)</t>
			</c>
			<c id="N68">
				<t id="en">British thermal unit (60 ºF)</t>
			</c>
			<c id="N69">
				<t id="en">calorie (20 ºC)</t>
			</c>
			<c id="N70">
				<t id="en">quad (1015 BtuIT)</t>
			</c>
			<c id="N71">
				<t id="en">therm (EC)</t>
			</c>
			<c id="N72">
				<t id="en">therm (U.S.)</t>
			</c>
			<c id="N73">
				<t id="en">British thermal unit (thermochemical) per pound</t>
			</c>
			<c id="N74">
				<t id="en">British thermal unit (international table) per hour square foot degree
            Fahrenheit</t>
			</c>
			<c id="N75">
				<t id="en">British thermal unit (thermochemical) per hour square foot degree Fahrenheit</t>
			</c>
			<c id="N76">
				<t id="en">British thermal unit (international table) per second square foot degree
            Fahrenheit</t>
			</c>
			<c id="N77">
				<t id="en">British thermal unit (thermochemical) per second square foot degree Fahrenheit</t>
			</c>
			<c id="N78">
				<t id="en">kilowatt per square metre kelvin</t>
			</c>
			<c id="N79">
				<t id="en">kelvin per pascal</t>
			</c>
			<c id="N80">
				<t id="en">watt per metre degree Celsius</t>
			</c>
			<c id="N81">
				<t id="en">kilowatt per metre kelvin</t>
			</c>
			<c id="N82">
				<t id="en">kilowatt per metre degree Celsius</t>
			</c>
			<c id="N83">
				<t id="en">metre per degree Celcius metre</t>
			</c>
			<c id="N84">
				<t id="en">degree Fahrenheit hour per British thermal unit (international table)</t>
			</c>
			<c id="N85">
				<t id="en">degree Fahrenheit hour per British thermal unit (thermochemical)</t>
			</c>
			<c id="N86">
				<t id="en">degree Fahrenheit second per British thermal unit (international table)</t>
			</c>
			<c id="N87">
				<t id="en">degree Fahrenheit second per British thermal unit (thermochemical)</t>
			</c>
			<c id="N88">
				<t id="en">degree Fahrenheit hour square foot per British thermal unit (international table)
            inch</t>
			</c>
			<c id="N89">
				<t id="en">degree Fahrenheit hour square foot per British thermal unit (thermochemical)
            inch</t>
			</c>
			<c id="N90">
				<t id="en">kilofarad</t>
			</c>
			<c id="N91">
				<t id="en">reciprocal joule</t>
			</c>
			<c id="N92">
				<t id="en">picosiemens</t>
			</c>
			<c id="N93">
				<t id="en">ampere per pascal</t>
			</c>
			<c id="N94">
				<t id="en">franklin</t>
			</c>
			<c id="N95">
				<t id="en">ampere minute</t>
			</c>
			<c id="N96">
				<t id="en">biot</t>
			</c>
			<c id="N97">
				<t id="en">gilbert</t>
			</c>
			<c id="N98">
				<t id="en">volt per pascal</t>
			</c>
			<c id="N99">
				<t id="en">picovolt</t>
			</c>
			<c id="NA">
				<t id="en">milligram per kilogram</t>
			</c>
			<c id="NAR">
				<t id="en">number of articles</t>
			</c>
			<c id="NCL">
				<t id="en">number of cells</t>
			</c>
			<c id="NEW">
				<t id="en">newton</t>
			</c>
			<c id="NF">
				<t id="en">message</t>
			</c>
			<c id="NIL">
				<t id="en">nil</t>
			</c>
			<c id="NIU">
				<t id="en">number of international units</t>
			</c>
			<c id="NL">
				<t id="en">load</t>
			</c>
			<c id="NM3">
				<t id="en">Normalised cubic metre</t>
			</c>
			<c id="NMI">
				<t id="en">nautical mile</t>
			</c>
			<c id="NMP">
				<t id="en">number of packs</t>
			</c>
			<c id="NPT">
				<t id="en">number of parts</t>
			</c>
			<c id="NT">
				<t id="en">net ton</t>
			</c>
			<c id="NTU">
				<t id="en">Nephelometric turbidity unit</t>
			</c>
			<c id="NU">
				<t id="en">newton metre</t>
			</c>
			<c id="NX">
				<t id="en">part per thousand</t>
			</c>
			<c id="OA">
				<t id="en">panel</t>
			</c>
			<c id="ODE">
				<t id="en">ozone depletion equivalent</t>
			</c>
			<c id="ODG">
				<t id="en">ODS Grams</t>
			</c>
			<c id="ODK">
				<t id="en">ODS Kilograms</t>
			</c>
			<c id="ODM">
				<t id="en">ODS Milligrams</t>
			</c>
			<c id="OHM">
				<t id="en">ohm</t>
			</c>
			<c id="ON">
				<t id="en">ounce per square yard</t>
			</c>
			<c id="ONZ">
				<t id="en">ounce (avoirdupois)</t>
			</c>
			<c id="OPM">
				<t id="en">oscillations per minute</t>
			</c>
			<c id="OT">
				<t id="en">overtime hour</t>
			</c>
			<c id="OZA">
				<t id="en">fluid ounce (US)</t>
			</c>
			<c id="OZI">
				<t id="en">fluid ounce (UK)</t>
			</c>
			<c id="P1">
				<t id="en">percent</t>
			</c>
			<c id="P2">
				<t id="en">pound per foot</t>
			</c>
			<c id="P5">
				<t id="en">five pack</t>
			</c>
			<c id="P10">
				<t id="en">coulomb per metre</t>
			</c>
			<c id="P11">
				<t id="en">kiloweber</t>
			</c>
			<c id="P12">
				<t id="en">gamma</t>
			</c>
			<c id="P13">
				<t id="en">kilotesla</t>
			</c>
			<c id="P14">
				<t id="en">joule per second</t>
			</c>
			<c id="P15">
				<t id="en">joule per minute</t>
			</c>
			<c id="P16">
				<t id="en">joule per hour</t>
			</c>
			<c id="P17">
				<t id="en">joule per day</t>
			</c>
			<c id="P18">
				<t id="en">kilojoule per second</t>
			</c>
			<c id="P19">
				<t id="en">kilojoule per minute</t>
			</c>
			<c id="P20">
				<t id="en">kilojoule per hour</t>
			</c>
			<c id="P21">
				<t id="en">kilojoule per day</t>
			</c>
			<c id="P22">
				<t id="en">nanoohm</t>
			</c>
			<c id="P23">
				<t id="en">ohm circular-mil per foot</t>
			</c>
			<c id="P24">
				<t id="en">kilohenry</t>
			</c>
			<c id="P25">
				<t id="en">lumen per square foot</t>
			</c>
			<c id="P26">
				<t id="en">phot</t>
			</c>
			<c id="P27">
				<t id="en">footcandle</t>
			</c>
			<c id="P28">
				<t id="en">candela per square inch</t>
			</c>
			<c id="P29">
				<t id="en">footlambert</t>
			</c>
			<c id="P30">
				<t id="en">lambert</t>
			</c>
			<c id="P31">
				<t id="en">stilb</t>
			</c>
			<c id="P32">
				<t id="en">candela per square foot</t>
			</c>
			<c id="P33">
				<t id="en">kilocandela</t>
			</c>
			<c id="P34">
				<t id="en">millicandela</t>
			</c>
			<c id="P35">
				<t id="en">Hefner-Kerze</t>
			</c>
			<c id="P36">
				<t id="en">international candle</t>
			</c>
			<c id="P37">
				<t id="en">British thermal unit (international table) per square foot</t>
			</c>
			<c id="P38">
				<t id="en">British thermal unit (thermochemical) per square foot</t>
			</c>
			<c id="P39">
				<t id="en">calorie (thermochemical) per square centimetre</t>
			</c>
			<c id="P40">
				<t id="en">langley</t>
			</c>
			<c id="P41">
				<t id="en">decade (logarithmic)</t>
			</c>
			<c id="P42">
				<t id="en">pascal squared second</t>
			</c>
			<c id="P43">
				<t id="en">bel per metre</t>
			</c>
			<c id="P44">
				<t id="en">pound mole</t>
			</c>
			<c id="P45">
				<t id="en">pound mole per second</t>
			</c>
			<c id="P46">
				<t id="en">pound mole per minute</t>
			</c>
			<c id="P47">
				<t id="en">kilomole per kilogram</t>
			</c>
			<c id="P48">
				<t id="en">pound mole per pound</t>
			</c>
			<c id="P49">
				<t id="en">newton square metre per ampere</t>
			</c>
			<c id="P50">
				<t id="en">weber metre</t>
			</c>
			<c id="P51">
				<t id="en">mol per kilogram pascal</t>
			</c>
			<c id="P52">
				<t id="en">mol per cubic metre pascal</t>
			</c>
			<c id="P53">
				<t id="en">unit pole</t>
			</c>
			<c id="P54">
				<t id="en">milligray per second</t>
			</c>
			<c id="P55">
				<t id="en">microgray per second</t>
			</c>
			<c id="P56">
				<t id="en">nanogray per second</t>
			</c>
			<c id="P57">
				<t id="en">gray per minute</t>
			</c>
			<c id="P58">
				<t id="en">milligray per minute</t>
			</c>
			<c id="P59">
				<t id="en">microgray per minute</t>
			</c>
			<c id="P60">
				<t id="en">nanogray per minute</t>
			</c>
			<c id="P61">
				<t id="en">gray per hour</t>
			</c>
			<c id="P62">
				<t id="en">milligray per hour</t>
			</c>
			<c id="P63">
				<t id="en">microgray per hour</t>
			</c>
			<c id="P64">
				<t id="en">nanogray per hour</t>
			</c>
			<c id="P65">
				<t id="en">sievert per second</t>
			</c>
			<c id="P66">
				<t id="en">millisievert per second</t>
			</c>
			<c id="P67">
				<t id="en">microsievert per second</t>
			</c>
			<c id="P68">
				<t id="en">nanosievert per second</t>
			</c>
			<c id="P69">
				<t id="en">rem per second</t>
			</c>
			<c id="P70">
				<t id="en">sievert per hour</t>
			</c>
			<c id="P71">
				<t id="en">millisievert per hour</t>
			</c>
			<c id="P72">
				<t id="en">microsievert per hour</t>
			</c>
			<c id="P73">
				<t id="en">nanosievert per hour</t>
			</c>
			<c id="P74">
				<t id="en">sievert per minute</t>
			</c>
			<c id="P75">
				<t id="en">millisievert per minute</t>
			</c>
			<c id="P76">
				<t id="en">microsievert per minute</t>
			</c>
			<c id="P77">
				<t id="en">nanosievert per minute</t>
			</c>
			<c id="P78">
				<t id="en">reciprocal square inch</t>
			</c>
			<c id="P79">
				<t id="en">pascal square metre per kilogram</t>
			</c>
			<c id="P80">
				<t id="en">millipascal per metre</t>
			</c>
			<c id="P81">
				<t id="en">kilopascal per metre</t>
			</c>
			<c id="P82">
				<t id="en">hectopascal per metre</t>
			</c>
			<c id="P83">
				<t id="en">standard atmosphere per metre</t>
			</c>
			<c id="P84">
				<t id="en">technical atmosphere per metre</t>
			</c>
			<c id="P85">
				<t id="en">torr per metre</t>
			</c>
			<c id="P86">
				<t id="en">psi per inch</t>
			</c>
			<c id="P87">
				<t id="en">cubic metre per second square metre</t>
			</c>
			<c id="P88">
				<t id="en">rhe</t>
			</c>
			<c id="P89">
				<t id="en">pound-force foot per inch</t>
			</c>
			<c id="P90">
				<t id="en">pound-force inch per inch</t>
			</c>
			<c id="P91">
				<t id="en">perm (0 ºC)</t>
			</c>
			<c id="P92">
				<t id="en">perm (23 ºC)</t>
			</c>
			<c id="P93">
				<t id="en">byte per second</t>
			</c>
			<c id="P94">
				<t id="en">kilobyte per second</t>
			</c>
			<c id="P95">
				<t id="en">megabyte per second</t>
			</c>
			<c id="P96">
				<t id="en">reciprocal volt</t>
			</c>
			<c id="P97">
				<t id="en">reciprocal radian</t>
			</c>
			<c id="P98">
				<t id="en">pascal to the power sum of stoichiometric numbers</t>
			</c>
			<c id="P99">
				<t id="en">mole per cubiv metre to the power sum of stoichiometric numbers</t>
			</c>
			<c id="PAL">
				<t id="en">pascal</t>
			</c>
			<c id="PD">
				<t id="en">pad</t>
			</c>
			<c id="PFL">
				<t id="en">proof litre</t>
			</c>
			<c id="PGL">
				<t id="en">proof gallon</t>
			</c>
			<c id="PI">
				<t id="en">pitch</t>
			</c>
			<c id="PLA">
				<t id="en">degree Plato</t>
			</c>
			<c id="PO">
				<t id="en">pound per inch of length</t>
			</c>
			<c id="PQ">
				<t id="en">page per inch</t>
			</c>
			<c id="PR">
				<t id="en">pair</t>
			</c>
			<c id="PS">
				<t id="en">pound-force per square inch</t>
			</c>
			<c id="PTD">
				<t id="en">dry pint (US)</t>
			</c>
			<c id="PTI">
				<t id="en">pint (UK)</t>
			</c>
			<c id="PTL">
				<t id="en">liquid pint (US)</t>
			</c>
			<c id="PTN">
				<t id="en">portion</t>
			</c>
			<c id="Q3">
				<t id="en">meal</t>
			</c>
			<c id="Q10">
				<t id="en">joule per tesla</t>
			</c>
			<c id="Q11">
				<t id="en">erlang</t>
			</c>
			<c id="Q12">
				<t id="en">octet</t>
			</c>
			<c id="Q13">
				<t id="en">octet per second</t>
			</c>
			<c id="Q14">
				<t id="en">shannon</t>
			</c>
			<c id="Q15">
				<t id="en">hartley</t>
			</c>
			<c id="Q16">
				<t id="en">natural unit of information</t>
			</c>
			<c id="Q17">
				<t id="en">shannon per second</t>
			</c>
			<c id="Q18">
				<t id="en">hartley per second</t>
			</c>
			<c id="Q19">
				<t id="en">natural unit of information per second</t>
			</c>
			<c id="Q20">
				<t id="en">second per kilogramm</t>
			</c>
			<c id="Q21">
				<t id="en">watt square metre</t>
			</c>
			<c id="Q22">
				<t id="en">second per radian cubic metre</t>
			</c>
			<c id="Q23">
				<t id="en">weber to the power minus one</t>
			</c>
			<c id="Q24">
				<t id="en">reciprocal inch</t>
			</c>
			<c id="Q25">
				<t id="en">dioptre</t>
			</c>
			<c id="Q26">
				<t id="en">one per one</t>
			</c>
			<c id="Q27">
				<t id="en">newton metre per metre</t>
			</c>
			<c id="Q28">
				<t id="en">kilogram per square metre pascal second</t>
			</c>
			<c id="Q29">
				<t id="en">microgram per hectogram</t>
			</c>
			<c id="Q30">
				<t id="en">pH (potential of Hydrogen)</t>
			</c>
			<c id="Q31">
				<t id="en">kilojoule per gram</t>
			</c>
			<c id="Q32">
				<t id="en">femtolitre</t>
			</c>
			<c id="Q33">
				<t id="en">picolitre</t>
			</c>
			<c id="Q34">
				<t id="en">nanolitre</t>
			</c>
			<c id="Q35">
				<t id="en">megawatts per minute</t>
			</c>
			<c id="Q36">
				<t id="en">square metre per cubic metre</t>
			</c>
			<c id="Q37">
				<t id="en">Standard cubic metre per day</t>
			</c>
			<c id="Q38">
				<t id="en">Standard cubic metre per hour</t>
			</c>
			<c id="Q39">
				<t id="en">Normalized cubic metre per day</t>
			</c>
			<c id="Q40">
				<t id="en">Normalized cubic metre per hour</t>
			</c>
			<c id="Q41">
				<t id="en">Joule per normalised cubic metre</t>
			</c>
			<c id="Q42">
				<t id="en">Joule per standard cubic metre</t>
			</c>
			<c id="QA">
				<t id="en">page - facsimile</t>
			</c>
			<c id="QAN">
				<t id="en">quarter (of a year)</t>
			</c>
			<c id="QB">
				<t id="en">page - hardcopy</t>
			</c>
			<c id="QR">
				<t id="en">quire</t>
			</c>
			<c id="QTD">
				<t id="en">dry quart (US)</t>
			</c>
			<c id="QTI">
				<t id="en">quart (UK)</t>
			</c>
			<c id="QTL">
				<t id="en">liquid quart (US)</t>
			</c>
			<c id="QTR">
				<t id="en">quarter (UK)</t>
			</c>
			<c id="R1">
				<t id="en">pica</t>
			</c>
			<c id="R9">
				<t id="en">thousand cubic metre</t>
			</c>
			<c id="RH">
				<t id="en">running or operating hour</t>
			</c>
			<c id="RM">
				<t id="en">ream</t>
			</c>
			<c id="ROM">
				<t id="en">room</t>
			</c>
			<c id="RP">
				<t id="en">pound per ream</t>
			</c>
			<c id="RPM">
				<t id="en">revolutions per minute</t>
			</c>
			<c id="RPS">
				<t id="en">revolutions per second</t>
			</c>
			<c id="RT">
				<t id="en">revenue ton mile</t>
			</c>
			<c id="S3">
				<t id="en">square foot per second</t>
			</c>
			<c id="S4">
				<t id="en">square metre per second</t>
			</c>
			<c id="SAN">
				<t id="en">half year (6 months)</t>
			</c>
			<c id="SCO">
				<t id="en">score</t>
			</c>
			<c id="SCR">
				<t id="en">scruple</t>
			</c>
			<c id="SEC">
				<t id="en">second [unit of time]</t>
			</c>
			<c id="SET">
				<t id="en">set</t>
			</c>
			<c id="SG">
				<t id="en">segment</t>
			</c>
			<c id="SIE">
				<t id="en">siemens</t>
			</c>
			<c id="SM3">
				<t id="en">Standard cubic metre</t>
			</c>
			<c id="SMI">
				<t id="en">mile (statute mile)</t>
			</c>
			<c id="SQ">
				<t id="en">square</t>
			</c>
			<c id="SQR">
				<t id="en">square, roofing</t>
			</c>
			<c id="SR">
				<t id="en">strip</t>
			</c>
			<c id="STC">
				<t id="en">stick</t>
			</c>
			<c id="STI">
				<t id="en">stone (UK)</t>
			</c>
			<c id="STK">
				<t id="en">stick, cigarette</t>
			</c>
			<c id="STL">
				<t id="en">standard litre</t>
			</c>
			<c id="STN">
				<t id="en">ton (US) or short ton (UK/US)</t>
			</c>
			<c id="STW">
				<t id="en">straw</t>
			</c>
			<c id="SW">
				<t id="en">skein</t>
			</c>
			<c id="SX">
				<t id="en">shipment</t>
			</c>
			<c id="SYR">
				<t id="en">syringe</t>
			</c>
			<c id="T0">
				<t id="en">telecommunication line in service</t>
			</c>
			<c id="T3">
				<t id="en">thousand piece</t>
			</c>
			<c id="TAH">
				<t id="en">kiloampere hour (thousand ampere hour)</t>
			</c>
			<c id="TAN">
				<t id="en">total acid number</t>
			</c>
			<c id="TI">
				<t id="en">thousand square inch</t>
			</c>
			<c id="TIC">
				<t id="en">metric ton, including container</t>
			</c>
			<c id="TIP">
				<t id="en">metric ton, including inner packaging</t>
			</c>
			<c id="TKM">
				<t id="en">tonne kilometre</t>
			</c>
			<c id="TMS">
				<t id="en">kilogram of imported meat, less offal</t>
			</c>
			<c id="TNE">
				<t id="en">tonne (metric ton)</t>
			</c>
			<c id="TP">
				<t id="en">ten pack</t>
			</c>
			<c id="TPI">
				<t id="en">teeth per inch</t>
			</c>
			<c id="TPR">
				<t id="en">ten pair</t>
			</c>
			<c id="TQD">
				<t id="en">thousand cubic metre per day</t>
			</c>
			<c id="TRL">
				<t id="en">trillion (EUR)</t>
			</c>
			<c id="TST">
				<t id="en">ten set</t>
			</c>
			<c id="TTS">
				<t id="en">ten thousand sticks</t>
			</c>
			<c id="U1">
				<t id="en">treatment</t>
			</c>
			<c id="U2">
				<t id="en">tablet</t>
			</c>
			<c id="UB">
				<t id="en">telecommunication line in service average</t>
			</c>
			<c id="UC">
				<t id="en">telecommunication port</t>
			</c>
			<c id="VA">
				<t id="en">volt - ampere per kilogram</t>
			</c>
			<c id="VLT">
				<t id="en">volt</t>
			</c>
			<c id="VP">
				<t id="en">percent volume</t>
			</c>
			<c id="W2">
				<t id="en">wet kilo</t>
			</c>
			<c id="WA">
				<t id="en">watt per kilogram</t>
			</c>
			<c id="WB">
				<t id="en">wet pound</t>
			</c>
			<c id="WCD">
				<t id="en">cord</t>
			</c>
			<c id="WE">
				<t id="en">wet ton</t>
			</c>
			<c id="WEB">
				<t id="en">weber</t>
			</c>
			<c id="WEE">
				<t id="en">week</t>
			</c>
			<c id="WG">
				<t id="en">wine gallon</t>
			</c>
			<c id="WHR">
				<t id="en">watt hour</t>
			</c>
			<c id="WM">
				<t id="en">working month</t>
			</c>
			<c id="WSD">
				<t id="en">standard</t>
			</c>
			<c id="WTT">
				<t id="en">watt</t>
			</c>
			<c id="X1">
				<t id="en">Gunter's chain</t>
			</c>
			<c id="X1A">
				<t id="en">Drum, steel</t>
			</c>
			<c id="X1B">
				<t id="en">Drum, aluminium</t>
			</c>
			<c id="X1D">
				<t id="en">Drum, plywood</t>
			</c>
			<c id="X1F">
				<t id="en">Container, flexible</t>
			</c>
			<c id="X1G">
				<t id="en">Drum, fibre</t>
			</c>
			<c id="X1W">
				<t id="en">Drum, wooden</t>
			</c>
			<c id="X2C">
				<t id="en">Barrel, wooden</t>
			</c>
			<c id="X3A">
				<t id="en">Jerrican, steel</t>
			</c>
			<c id="X3H">
				<t id="en">Jerrican, plastic</t>
			</c>
			<c id="X4A">
				<t id="en">Box, steel</t>
			</c>
			<c id="X4B">
				<t id="en">Box, aluminium</t>
			</c>
			<c id="X4C">
				<t id="en">Box, natural wood</t>
			</c>
			<c id="X4D">
				<t id="en">Box, plywood</t>
			</c>
			<c id="X4F">
				<t id="en">Box, reconstituted wood</t>
			</c>
			<c id="X4G">
				<t id="en">Box, fibreboard</t>
			</c>
			<c id="X4H">
				<t id="en">Box, plastic</t>
			</c>
			<c id="X5H">
				<t id="en">Bag, woven plastic</t>
			</c>
			<c id="X5L">
				<t id="en">Bag, textile</t>
			</c>
			<c id="X5M">
				<t id="en">Bag, paper</t>
			</c>
			<c id="X6H">
				<t id="en">Composite packaging, plastic receptacle</t>
			</c>
			<c id="X6P">
				<t id="en">Composite packaging, glass receptacle</t>
			</c>
			<c id="X7A">
				<t id="en">Case, car</t>
			</c>
			<c id="X7B">
				<t id="en">Case, wooden</t>
			</c>
			<c id="X8A">
				<t id="en">Pallet, wooden</t>
			</c>
			<c id="X8B">
				<t id="en">Crate, wooden</t>
			</c>
			<c id="X8C">
				<t id="en">Bundle, wooden</t>
			</c>
			<c id="X43">
				<t id="en">Bag, super bulk</t>
			</c>
			<c id="X44">
				<t id="en">Bag, polybag</t>
			</c>
			<c id="XAA">
				<t id="en">Intermediate bulk container, rigid plastic</t>
			</c>
			<c id="XAB">
				<t id="en">Receptacle, fibre</t>
			</c>
			<c id="XAC">
				<t id="en">Receptacle, paper</t>
			</c>
			<c id="XAD">
				<t id="en">Receptacle, wooden</t>
			</c>
			<c id="XAE">
				<t id="en">Aerosol</t>
			</c>
			<c id="XAF">
				<t id="en">Pallet, modular, collars 80cms * 60cms</t>
			</c>
			<c id="XAG">
				<t id="en">Pallet, shrinkwrapped</t>
			</c>
			<c id="XAH">
				<t id="en">Pallet, 100cms * 110cms</t>
			</c>
			<c id="XAI">
				<t id="en">Clamshell</t>
			</c>
			<c id="XAJ">
				<t id="en">Cone</t>
			</c>
			<c id="XAL">
				<t id="en">Ball</t>
			</c>
			<c id="XAM">
				<t id="en">Ampoule, non-protected</t>
			</c>
			<c id="XAP">
				<t id="en">Ampoule, protected</t>
			</c>
			<c id="XAT">
				<t id="en">Atomizer</t>
			</c>
			<c id="XAV">
				<t id="en">Capsule</t>
			</c>
			<c id="XB4">
				<t id="en">Belt</t>
			</c>
			<c id="XBA">
				<t id="en">Barrel</t>
			</c>
			<c id="XBB">
				<t id="en">Bobbin</t>
			</c>
			<c id="XBC">
				<t id="en">Bottlecrate / bottlerack</t>
			</c>
			<c id="XBD">
				<t id="en">Board</t>
			</c>
			<c id="XBE">
				<t id="en">Bundle</t>
			</c>
			<c id="XBF">
				<t id="en">Balloon, non-protected</t>
			</c>
			<c id="XBG">
				<t id="en">Bag</t>
			</c>
			<c id="XBH">
				<t id="en">Bunch</t>
			</c>
			<c id="XBI">
				<t id="en">Bin</t>
			</c>
			<c id="XBJ">
				<t id="en">Bucket</t>
			</c>
			<c id="XBK">
				<t id="en">Basket</t>
			</c>
			<c id="XBL">
				<t id="en">Bale, compressed</t>
			</c>
			<c id="XBM">
				<t id="en">Basin</t>
			</c>
			<c id="XBN">
				<t id="en">Bale, non-compressed</t>
			</c>
			<c id="XBO">
				<t id="en">Bottle, non-protected, cylindrical</t>
			</c>
			<c id="XBP">
				<t id="en">Balloon, protected</t>
			</c>
			<c id="XBQ">
				<t id="en">Bottle, protected cylindrical</t>
			</c>
			<c id="XBR">
				<t id="en">Bar</t>
			</c>
			<c id="XBS">
				<t id="en">Bottle, non-protected, bulbous</t>
			</c>
			<c id="XBT">
				<t id="en">Bolt</t>
			</c>
			<c id="XBU">
				<t id="en">Butt</t>
			</c>
			<c id="XBV">
				<t id="en">Bottle, protected bulbous</t>
			</c>
			<c id="XBW">
				<t id="en">Box, for liquids</t>
			</c>
			<c id="XBX">
				<t id="en">Box</t>
			</c>
			<c id="XBY">
				<t id="en">Board, in bundle/bunch/truss</t>
			</c>
			<c id="XBZ">
				<t id="en">Bars, in bundle/bunch/truss</t>
			</c>
			<c id="XCA">
				<t id="en">Can, rectangular</t>
			</c>
			<c id="XCB">
				<t id="en">Crate, beer</t>
			</c>
			<c id="XCC">
				<t id="en">Churn</t>
			</c>
			<c id="XCD">
				<t id="en">Can, with handle and spout</t>
			</c>
			<c id="XCE">
				<t id="en">Creel</t>
			</c>
			<c id="XCF">
				<t id="en">Coffer</t>
			</c>
			<c id="XCG">
				<t id="en">Cage</t>
			</c>
			<c id="XCH">
				<t id="en">Chest</t>
			</c>
			<c id="XCI">
				<t id="en">Canister</t>
			</c>
			<c id="XCJ">
				<t id="en">Coffin</t>
			</c>
			<c id="XCK">
				<t id="en">Cask</t>
			</c>
			<c id="XCL">
				<t id="en">Coil</t>
			</c>
			<c id="XCM">
				<t id="en">Card</t>
			</c>
			<c id="XCN">
				<t id="en">Container, not otherwise specified as transport equipment</t>
			</c>
			<c id="XCO">
				<t id="en">Carboy, non-protected</t>
			</c>
			<c id="XCP">
				<t id="en">Carboy, protected</t>
			</c>
			<c id="XCQ">
				<t id="en">Cartridge</t>
			</c>
			<c id="XCR">
				<t id="en">Crate</t>
			</c>
			<c id="XCS">
				<t id="en">Case</t>
			</c>
			<c id="XCT">
				<t id="en">Carton</t>
			</c>
			<c id="XCU">
				<t id="en">Cup</t>
			</c>
			<c id="XCV">
				<t id="en">Cover</t>
			</c>
			<c id="XCW">
				<t id="en">Cage, roll</t>
			</c>
			<c id="XCX">
				<t id="en">Can, cylindrical</t>
			</c>
			<c id="XCY">
				<t id="en">Cylinder</t>
			</c>
			<c id="XCZ">
				<t id="en">Canvas</t>
			</c>
			<c id="XDA">
				<t id="en">Crate, multiple layer, plastic</t>
			</c>
			<c id="XDB">
				<t id="en">Crate, multiple layer, wooden</t>
			</c>
			<c id="XDC">
				<t id="en">Crate, multiple layer, cardboard</t>
			</c>
			<c id="XDG">
				<t id="en">Cage, Commonwealth Handling Equipment Pool (CHEP)</t>
			</c>
			<c id="XDH">
				<t id="en">Box, Commonwealth Handling Equipment Pool (CHEP), Eurobox</t>
			</c>
			<c id="XDI">
				<t id="en">Drum, iron</t>
			</c>
			<c id="XDJ">
				<t id="en">Demijohn, non-protected</t>
			</c>
			<c id="XDK">
				<t id="en">Crate, bulk, cardboard</t>
			</c>
			<c id="XDL">
				<t id="en">Crate, bulk, plastic</t>
			</c>
			<c id="XDM">
				<t id="en">Crate, bulk, wooden</t>
			</c>
			<c id="XDN">
				<t id="en">Dispenser</t>
			</c>
			<c id="XDP">
				<t id="en">Demijohn, protected</t>
			</c>
			<c id="XDR">
				<t id="en">Drum</t>
			</c>
			<c id="XDS">
				<t id="en">Tray, one layer no cover, plastic</t>
			</c>
			<c id="XDT">
				<t id="en">Tray, one layer no cover, wooden</t>
			</c>
			<c id="XDU">
				<t id="en">Tray, one layer no cover, polystyrene</t>
			</c>
			<c id="XDV">
				<t id="en">Tray, one layer no cover, cardboard</t>
			</c>
			<c id="XDW">
				<t id="en">Tray, two layers no cover, plastic tray</t>
			</c>
			<c id="XDX">
				<t id="en">Tray, two layers no cover, wooden</t>
			</c>
			<c id="XDY">
				<t id="en">Tray, two layers no cover, cardboard</t>
			</c>
			<c id="XEC">
				<t id="en">Bag, plastic</t>
			</c>
			<c id="XED">
				<t id="en">Case, with pallet base</t>
			</c>
			<c id="XEE">
				<t id="en">Case, with pallet base, wooden</t>
			</c>
			<c id="XEF">
				<t id="en">Case, with pallet base, cardboard</t>
			</c>
			<c id="XEG">
				<t id="en">Case, with pallet base, plastic</t>
			</c>
			<c id="XEH">
				<t id="en">Case, with pallet base, metal</t>
			</c>
			<c id="XEI">
				<t id="en">Case, isothermic</t>
			</c>
			<c id="XEN">
				<t id="en">Envelope</t>
			</c>
			<c id="XFB">
				<t id="en">Flexibag</t>
			</c>
			<c id="XFC">
				<t id="en">Crate, fruit</t>
			</c>
			<c id="XFD">
				<t id="en">Crate, framed</t>
			</c>
			<c id="XFE">
				<t id="en">Flexitank</t>
			</c>
			<c id="XFI">
				<t id="en">Firkin</t>
			</c>
			<c id="XFL">
				<t id="en">Flask</t>
			</c>
			<c id="XFO">
				<t id="en">Footlocker</t>
			</c>
			<c id="XFP">
				<t id="en">Filmpack</t>
			</c>
			<c id="XFR">
				<t id="en">Frame</t>
			</c>
			<c id="XFT">
				<t id="en">Foodtainer</t>
			</c>
			<c id="XFW">
				<t id="en">Cart, flatbed</t>
			</c>
			<c id="XFX">
				<t id="en">Bag, flexible container</t>
			</c>
			<c id="XGB">
				<t id="en">Bottle, gas</t>
			</c>
			<c id="XGI">
				<t id="en">Girder</t>
			</c>
			<c id="XGL">
				<t id="en">Container, gallon</t>
			</c>
			<c id="XGR">
				<t id="en">Receptacle, glass</t>
			</c>
			<c id="XGU">
				<t id="en">Tray, containing horizontally stacked flat items</t>
			</c>
			<c id="XGY">
				<t id="en">Bag, gunny</t>
			</c>
			<c id="XGZ">
				<t id="en">Girders, in bundle/bunch/truss</t>
			</c>
			<c id="XHA">
				<t id="en">Basket, with handle, plastic</t>
			</c>
			<c id="XHB">
				<t id="en">Basket, with handle, wooden</t>
			</c>
			<c id="XHC">
				<t id="en">Basket, with handle, cardboard</t>
			</c>
			<c id="XHG">
				<t id="en">Hogshead</t>
			</c>
			<c id="XHN">
				<t id="en">Hanger</t>
			</c>
			<c id="XHR">
				<t id="en">Hamper</t>
			</c>
			<c id="XIA">
				<t id="en">Package, display, wooden</t>
			</c>
			<c id="XIB">
				<t id="en">Package, display, cardboard</t>
			</c>
			<c id="XIC">
				<t id="en">Package, display, plastic</t>
			</c>
			<c id="XID">
				<t id="en">Package, display, metal</t>
			</c>
			<c id="XIE">
				<t id="en">Package, show</t>
			</c>
			<c id="XIF">
				<t id="en">Package, flow</t>
			</c>
			<c id="XIG">
				<t id="en">Package, paper wrapped</t>
			</c>
			<c id="XIH">
				<t id="en">Drum, plastic</t>
			</c>
			<c id="XIK">
				<t id="en">Package, cardboard, with bottle grip-holes</t>
			</c>
			<c id="XIL">
				<t id="en">Tray, rigid, lidded stackable (CEN TS 14482:2002)</t>
			</c>
			<c id="XIN">
				<t id="en">Ingot</t>
			</c>
			<c id="XIZ">
				<t id="en">Ingots, in bundle/bunch/truss</t>
			</c>
			<c id="XJB">
				<t id="en">Bag, jumbo</t>
			</c>
			<c id="XJC">
				<t id="en">Jerrican, rectangular</t>
			</c>
			<c id="XJG">
				<t id="en">Jug</t>
			</c>
			<c id="XJR">
				<t id="en">Jar</t>
			</c>
			<c id="XJT">
				<t id="en">Jutebag</t>
			</c>
			<c id="XJY">
				<t id="en">Jerrican, cylindrical</t>
			</c>
			<c id="XKG">
				<t id="en">Keg</t>
			</c>
			<c id="XKI">
				<t id="en">Kit</t>
			</c>
			<c id="XLE">
				<t id="en">Luggage</t>
			</c>
			<c id="XLG">
				<t id="en">Log</t>
			</c>
			<c id="XLT">
				<t id="en">Lot</t>
			</c>
			<c id="XLU">
				<t id="en">Lug</t>
			</c>
			<c id="XLV">
				<t id="en">Liftvan</t>
			</c>
			<c id="XLZ">
				<t id="en">Logs, in bundle/bunch/truss</t>
			</c>
			<c id="XMA">
				<t id="en">Crate, metal</t>
			</c>
			<c id="XMB">
				<t id="en">Bag, multiply</t>
			</c>
			<c id="XMC">
				<t id="en">Crate, milk</t>
			</c>
			<c id="XME">
				<t id="en">Container, metal</t>
			</c>
			<c id="XMR">
				<t id="en">Receptacle, metal</t>
			</c>
			<c id="XMS">
				<t id="en">Sack, multi-wall</t>
			</c>
			<c id="XMT">
				<t id="en">Mat</t>
			</c>
			<c id="XMW">
				<t id="en">Receptacle, plastic wrapped</t>
			</c>
			<c id="XMX">
				<t id="en">Matchbox</t>
			</c>
			<c id="XNA">
				<t id="en">Not available</t>
			</c>
			<c id="XNE">
				<t id="en">Unpacked or unpackaged</t>
			</c>
			<c id="XNF">
				<t id="en">Unpacked or unpackaged, single unit</t>
			</c>
			<c id="XNG">
				<t id="en">Unpacked or unpackaged, multiple units</t>
			</c>
			<c id="XNS">
				<t id="en">Nest</t>
			</c>
			<c id="XNT">
				<t id="en">Net</t>
			</c>
			<c id="XNU">
				<t id="en">Net, tube, plastic</t>
			</c>
			<c id="XNV">
				<t id="en">Net, tube, textile</t>
			</c>
			<c id="XO1">
				<t id="en">Two sided cage on wheels with fixing strap</t>
			</c>
			<c id="XO2">
				<t id="en">Trolley</t>
			</c>
			<c id="XO3">
				<t id="en">Oneway pallet ISO 0 - 1/2 EURO Pallet</t>
			</c>
			<c id="XO4">
				<t id="en">Oneway pallet ISO 1 - 1/1 EURO Pallet</t>
			</c>
			<c id="XO5">
				<t id="en">Oneway pallet ISO 2 - 2/1 EURO Pallet</t>
			</c>
			<c id="XO6">
				<t id="en">Pallet with exceptional dimensions</t>
			</c>
			<c id="XO7">
				<t id="en">Wooden pallet 40 cm x 80 cm</t>
			</c>
			<c id="XO8">
				<t id="en">Plastic pallet SRS 60 cm x 80 cm</t>
			</c>
			<c id="XO9">
				<t id="en">Plastic pallet SRS 80 cm x 120 cm</t>
			</c>
			<c id="XOA">
				<t id="en">Pallet, CHEP 40 cm x 60 cm</t>
			</c>
			<c id="XOB">
				<t id="en">Pallet, CHEP 80 cm x 120 cm</t>
			</c>
			<c id="XOC">
				<t id="en">Pallet, CHEP 100 cm x 120 cm</t>
			</c>
			<c id="XOD">
				<t id="en">Pallet, AS 4068-1993</t>
			</c>
			<c id="XOE">
				<t id="en">Pallet, ISO T11</t>
			</c>
			<c id="XOF">
				<t id="en">Platform, unspecified weight or dimension</t>
			</c>
			<c id="XOG">
				<t id="en">Pallet ISO 0 - 1/2 EURO Pallet</t>
			</c>
			<c id="XOH">
				<t id="en">Pallet ISO 1 - 1/1 EURO Pallet</t>
			</c>
			<c id="XOI">
				<t id="en">Pallet ISO 2 – 2/1 EURO Pallet</t>
			</c>
			<c id="XOJ">
				<t id="en">1/4 EURO Pallet</t>
			</c>
			<c id="XOK">
				<t id="en">Block</t>
			</c>
			<c id="XOL">
				<t id="en">1/8 EURO Pallet</t>
			</c>
			<c id="XOM">
				<t id="en">Synthetic pallet ISO 1</t>
			</c>
			<c id="XON">
				<t id="en">Synthetic pallet ISO 2</t>
			</c>
			<c id="XOP">
				<t id="en">Wholesaler pallet</t>
			</c>
			<c id="XOQ">
				<t id="en">Pallet 80 X 100 cm</t>
			</c>
			<c id="XOR">
				<t id="en">Pallet 60 X 100 cm</t>
			</c>
			<c id="XOS">
				<t id="en">Oneway pallet</t>
			</c>
			<c id="XOT">
				<t id="en">Octabin</t>
			</c>
			<c id="XOU">
				<t id="en">Container, outer</t>
			</c>
			<c id="XOV">
				<t id="en">Returnable pallet</t>
			</c>
			<c id="XOW">
				<t id="en">Large bag, pallet sized</t>
			</c>
			<c id="XOX">
				<t id="en">A wheeled pallet with raised rim (81 x 67 x 135)</t>
			</c>
			<c id="XOY">
				<t id="en">A Wheeled pallet with raised rim (81 x 72 x 135)</t>
			</c>
			<c id="XOZ">
				<t id="en">Wheeled pallet with raised rim ( 81 x 60 x 16)</t>
			</c>
			<c id="XP1">
				<t id="en">CHEP pallet 60 cm x 80 cm</t>
			</c>
			<c id="XP2">
				<t id="en">Pan</t>
			</c>
			<c id="XP3">
				<t id="en">LPR pallet 60 cm x 80 cm</t>
			</c>
			<c id="XP4">
				<t id="en">LPR pallet 80 cm x 120 cm</t>
			</c>
			<c id="XPA">
				<t id="en">Packet</t>
			</c>
			<c id="XPB">
				<t id="en">Pallet, box Combined open-ended box and pallet</t>
			</c>
			<c id="XPC">
				<t id="en">Parcel</t>
			</c>
			<c id="XPD">
				<t id="en">Pallet, modular, collars 80cms * 100cms</t>
			</c>
			<c id="XPE">
				<t id="en">Pallet, modular, collars 80cms * 120cms</t>
			</c>
			<c id="XPF">
				<t id="en">Pen</t>
			</c>
			<c id="XPG">
				<t id="en">Plate</t>
			</c>
			<c id="XPH">
				<t id="en">Pitcher</t>
			</c>
			<c id="XPI">
				<t id="en">Pipe</t>
			</c>
			<c id="XPJ">
				<t id="en">Punnet</t>
			</c>
			<c id="XPK">
				<t id="en">Package</t>
			</c>
			<c id="XPL">
				<t id="en">Pail</t>
			</c>
			<c id="XPN">
				<t id="en">Plank</t>
			</c>
			<c id="XPO">
				<t id="en">Pouch</t>
			</c>
			<c id="XPP">
				<t id="en">Piece</t>
			</c>
			<c id="XPR">
				<t id="en">Receptacle, plastic</t>
			</c>
			<c id="XPT">
				<t id="en">Pot</t>
			</c>
			<c id="XPU">
				<t id="en">Tray</t>
			</c>
			<c id="XPV">
				<t id="en">Pipes, in bundle/bunch/truss</t>
			</c>
			<c id="XPX">
				<t id="en">Pallet</t>
			</c>
			<c id="XPY">
				<t id="en">Plates, in bundle/bunch/truss</t>
			</c>
			<c id="XPZ">
				<t id="en">Planks, in bundle/bunch/truss</t>
			</c>
			<c id="XQA">
				<t id="en">Drum, steel, non-removable head</t>
			</c>
			<c id="XQB">
				<t id="en">Drum, steel, removable head</t>
			</c>
			<c id="XQC">
				<t id="en">Drum, aluminium, non-removable head</t>
			</c>
			<c id="XQD">
				<t id="en">Drum, aluminium, removable head</t>
			</c>
			<c id="XQF">
				<t id="en">Drum, plastic, non-removable head</t>
			</c>
			<c id="XQG">
				<t id="en">Drum, plastic, removable head</t>
			</c>
			<c id="XQH">
				<t id="en">Barrel, wooden, bung type</t>
			</c>
			<c id="XQJ">
				<t id="en">Barrel, wooden, removable head</t>
			</c>
			<c id="XQK">
				<t id="en">Jerrican, steel, non-removable head</t>
			</c>
			<c id="XQL">
				<t id="en">Jerrican, steel, removable head</t>
			</c>
			<c id="XQM">
				<t id="en">Jerrican, plastic, non-removable head</t>
			</c>
			<c id="XQN">
				<t id="en">Jerrican, plastic, removable head</t>
			</c>
			<c id="XQP">
				<t id="en">Box, wooden, natural wood, ordinary</t>
			</c>
			<c id="XQQ">
				<t id="en">Box, wooden, natural wood, with sift proof walls</t>
			</c>
			<c id="XQR">
				<t id="en">Box, plastic, expanded</t>
			</c>
			<c id="XQS">
				<t id="en">Box, plastic, solid</t>
			</c>
			<c id="XRD">
				<t id="en">Rod</t>
			</c>
			<c id="XRG">
				<t id="en">Ring</t>
			</c>
			<c id="XRJ">
				<t id="en">Rack, clothing hanger</t>
			</c>
			<c id="XRK">
				<t id="en">Rack</t>
			</c>
			<c id="XRL">
				<t id="en">Reel</t>
			</c>
			<c id="XRO">
				<t id="en">Roll</t>
			</c>
			<c id="XRT">
				<t id="en">Rednet</t>
			</c>
			<c id="XRZ">
				<t id="en">Rods, in bundle/bunch/truss</t>
			</c>
			<c id="XSA">
				<t id="en">Sack</t>
			</c>
			<c id="XSB">
				<t id="en">Slab</t>
			</c>
			<c id="XSC">
				<t id="en">Crate, shallow</t>
			</c>
			<c id="XSD">
				<t id="en">Spindle</t>
			</c>
			<c id="XSE">
				<t id="en">Sea-chest</t>
			</c>
			<c id="XSH">
				<t id="en">Sachet</t>
			</c>
			<c id="XSI">
				<t id="en">Skid</t>
			</c>
			<c id="XSK">
				<t id="en">Case, skeleton</t>
			</c>
			<c id="XSL">
				<t id="en">Slipsheet</t>
			</c>
			<c id="XSM">
				<t id="en">Sheetmetal</t>
			</c>
			<c id="XSO">
				<t id="en">Spool</t>
			</c>
			<c id="XSP">
				<t id="en">Sheet, plastic wrapping</t>
			</c>
			<c id="XSS">
				<t id="en">Case, steel</t>
			</c>
			<c id="XST">
				<t id="en">Sheet</t>
			</c>
			<c id="XSU">
				<t id="en">Suitcase</t>
			</c>
			<c id="XSV">
				<t id="en">Envelope, steel</t>
			</c>
			<c id="XSW">
				<t id="en">Shrinkwrapped</t>
			</c>
			<c id="XSX">
				<t id="en">Set</t>
			</c>
			<c id="XSY">
				<t id="en">Sleeve</t>
			</c>
			<c id="XSZ">
				<t id="en">Sheets, in bundle/bunch/truss</t>
			</c>
			<c id="XT1">
				<t id="en">Tablet</t>
			</c>
			<c id="XTB">
				<t id="en">Tub</t>
			</c>
			<c id="XTC">
				<t id="en">Tea-chest</t>
			</c>
			<c id="XTD">
				<t id="en">Tube, collapsible</t>
			</c>
			<c id="XTE">
				<t id="en">Tyre</t>
			</c>
			<c id="XTG">
				<t id="en">Tank container, generic</t>
			</c>
			<c id="XTI">
				<t id="en">Tierce</t>
			</c>
			<c id="XTK">
				<t id="en">Tank, rectangular</t>
			</c>
			<c id="XTL">
				<t id="en">Tub, with lid</t>
			</c>
			<c id="XTN">
				<t id="en">Tin</t>
			</c>
			<c id="XTO">
				<t id="en">Tun</t>
			</c>
			<c id="XTR">
				<t id="en">Trunk</t>
			</c>
			<c id="XTS">
				<t id="en">Truss</t>
			</c>
			<c id="XTT">
				<t id="en">Bag, tote</t>
			</c>
			<c id="XTU">
				<t id="en">Tube</t>
			</c>
			<c id="XTV">
				<t id="en">Tube, with nozzle</t>
			</c>
			<c id="XTW">
				<t id="en">Pallet, triwall</t>
			</c>
			<c id="XTY">
				<t id="en">Tank, cylindrical</t>
			</c>
			<c id="XTZ">
				<t id="en">Tubes, in bundle/bunch/truss</t>
			</c>
			<c id="XUC">
				<t id="en">Uncaged</t>
			</c>
			<c id="XUN">
				<t id="en">Unit</t>
			</c>
			<c id="XVA">
				<t id="en">Vat</t>
			</c>
			<c id="XVG">
				<t id="en">Bulk, gas (at 1031 mbar and 15°C)</t>
			</c>
			<c id="XVI">
				<t id="en">Vial</t>
			</c>
			<c id="XVK">
				<t id="en">Vanpack</t>
			</c>
			<c id="XVL">
				<t id="en">Bulk, liquid</t>
			</c>
			<c id="XVN">
				<t id="en">Vehicle</t>
			</c>
			<c id="XVO">
				<t id="en">Bulk, solid, large particles (“nodules”)</t>
			</c>
			<c id="XVP">
				<t id="en">Vacuum-packed</t>
			</c>
			<c id="XVQ">
				<t id="en">Bulk, liquefied gas (at abnormal temperature/pressure)</t>
			</c>
			<c id="XVR">
				<t id="en">Bulk, solid, granular particles (“grains”)</t>
			</c>
			<c id="XVS">
				<t id="en">Bulk, scrap metal</t>
			</c>
			<c id="XVY">
				<t id="en">Bulk, solid, fine particles (“powders”)</t>
			</c>
			<c id="XWA">
				<t id="en">Intermediate bulk container</t>
			</c>
			<c id="XWB">
				<t id="en">Wickerbottle</t>
			</c>
			<c id="XWC">
				<t id="en">Intermediate bulk container, steel</t>
			</c>
			<c id="XWD">
				<t id="en">Intermediate bulk container, aluminium</t>
			</c>
			<c id="XWF">
				<t id="en">Intermediate bulk container, metal</t>
			</c>
			<c id="XWG">
				<t id="en">Intermediate bulk container, steel, pressurised &gt; 10 kpa</t>
			</c>
			<c id="XWH">
				<t id="en">Intermediate bulk container, aluminium, pressurised &gt; 10 kpa</t>
			</c>
			<c id="XWJ">
				<t id="en">Intermediate bulk container, metal, pressure 10 kpa</t>
			</c>
			<c id="XWK">
				<t id="en">Intermediate bulk container, steel, liquid</t>
			</c>
			<c id="XWL">
				<t id="en">Intermediate bulk container, aluminium, liquid</t>
			</c>
			<c id="XWM">
				<t id="en">Intermediate bulk container, metal, liquid</t>
			</c>
			<c id="XWN">
				<t id="en">Intermediate bulk container, woven plastic, without coat/liner</t>
			</c>
			<c id="XWP">
				<t id="en">Intermediate bulk container, woven plastic, coated</t>
			</c>
			<c id="XWQ">
				<t id="en">Intermediate bulk container, woven plastic, with liner</t>
			</c>
			<c id="XWR">
				<t id="en">Intermediate bulk container, woven plastic, coated and liner</t>
			</c>
			<c id="XWS">
				<t id="en">Intermediate bulk container, plastic film</t>
			</c>
			<c id="XWT">
				<t id="en">Intermediate bulk container, textile with out coat/liner</t>
			</c>
			<c id="XWU">
				<t id="en">Intermediate bulk container, natural wood, with inner liner</t>
			</c>
			<c id="XWV">
				<t id="en">Intermediate bulk container, textile, coated</t>
			</c>
			<c id="XWW">
				<t id="en">Intermediate bulk container, textile, with liner</t>
			</c>
			<c id="XWX">
				<t id="en">Intermediate bulk container, textile, coated and liner</t>
			</c>
			<c id="XWY">
				<t id="en">Intermediate bulk container, plywood, with inner liner</t>
			</c>
			<c id="XWZ">
				<t id="en">Intermediate bulk container, reconstituted wood, with inner liner</t>
			</c>
			<c id="XXA">
				<t id="en">Bag, woven plastic, without inner coat/liner</t>
			</c>
			<c id="XXB">
				<t id="en">Bag, woven plastic, sift proof</t>
			</c>
			<c id="XXC">
				<t id="en">Bag, woven plastic, water resistant</t>
			</c>
			<c id="XXD">
				<t id="en">Bag, plastics film</t>
			</c>
			<c id="XXF">
				<t id="en">Bag, textile, without inner coat/liner</t>
			</c>
			<c id="XXG">
				<t id="en">Bag, textile, sift proof</t>
			</c>
			<c id="XXH">
				<t id="en">Bag, textile, water resistant</t>
			</c>
			<c id="XXJ">
				<t id="en">Bag, paper, multi-wall</t>
			</c>
			<c id="XXK">
				<t id="en">Bag, paper, multi-wall, water resistant</t>
			</c>
			<c id="XYA">
				<t id="en">Composite packaging, plastic receptacle in steel drum</t>
			</c>
			<c id="XYB">
				<t id="en">Composite packaging, plastic receptacle in steel crate box</t>
			</c>
			<c id="XYC">
				<t id="en">Composite packaging, plastic receptacle in aluminium drum</t>
			</c>
			<c id="XYD">
				<t id="en">Composite packaging, plastic receptacle in aluminium crate</t>
			</c>
			<c id="XYF">
				<t id="en">Composite packaging, plastic receptacle in wooden box</t>
			</c>
			<c id="XYG">
				<t id="en">Composite packaging, plastic receptacle in plywood drum</t>
			</c>
			<c id="XYH">
				<t id="en">Composite packaging, plastic receptacle in plywood box</t>
			</c>
			<c id="XYJ">
				<t id="en">Composite packaging, plastic receptacle in fibre drum</t>
			</c>
			<c id="XYK">
				<t id="en">Composite packaging, plastic receptacle in fibreboard box</t>
			</c>
			<c id="XYL">
				<t id="en">Composite packaging, plastic receptacle in plastic drum</t>
			</c>
			<c id="XYM">
				<t id="en">Composite packaging, plastic receptacle in solid plastic box</t>
			</c>
			<c id="XYN">
				<t id="en">Composite packaging, glass receptacle in steel drum</t>
			</c>
			<c id="XYP">
				<t id="en">Composite packaging, glass receptacle in steel crate box</t>
			</c>
			<c id="XYQ">
				<t id="en">Composite packaging, glass receptacle in aluminium drum</t>
			</c>
			<c id="XYR">
				<t id="en">Composite packaging, glass receptacle in aluminium crate</t>
			</c>
			<c id="XYS">
				<t id="en">Composite packaging, glass receptacle in wooden box</t>
			</c>
			<c id="XYT">
				<t id="en">Composite packaging, glass receptacle in plywood drum</t>
			</c>
			<c id="XYV">
				<t id="en">Composite packaging, glass receptacle in wickerwork hamper</t>
			</c>
			<c id="XYW">
				<t id="en">Composite packaging, glass receptacle in fibre drum</t>
			</c>
			<c id="XYX">
				<t id="en">Composite packaging, glass receptacle in fibreboard box</t>
			</c>
			<c id="XYY">
				<t id="en">Composite packaging, glass receptacle in expandable plastic pack</t>
			</c>
			<c id="XYZ">
				<t id="en">Composite packaging, glass receptacle in solid plastic pack</t>
			</c>
			<c id="XZA">
				<t id="en">Intermediate bulk container, paper, multi-wall</t>
			</c>
			<c id="XZB">
				<t id="en">Bag, large</t>
			</c>
			<c id="XZC">
				<t id="en">Intermediate bulk container, paper, multi-wall, water resistant</t>
			</c>
			<c id="XZD">
				<t id="en">Intermediate bulk container, rigid plastic, with structural equipment, solids</t>
			</c>
			<c id="XZF">
				<t id="en">Intermediate bulk container, rigid plastic, freestanding, solids</t>
			</c>
			<c id="XZG">
				<t id="en">Intermediate bulk container, rigid plastic, with structural equipment,
            pressurised</t>
			</c>
			<c id="XZH">
				<t id="en">Intermediate bulk container, rigid plastic, freestanding, pressurised</t>
			</c>
			<c id="XZJ">
				<t id="en">Intermediate bulk container, rigid plastic, with structural equipment, liquids</t>
			</c>
			<c id="XZK">
				<t id="en">Intermediate bulk container, rigid plastic, freestanding, liquids</t>
			</c>
			<c id="XZL">
				<t id="en">Intermediate bulk container, composite, rigid plastic, solids</t>
			</c>
			<c id="XZM">
				<t id="en">Intermediate bulk container, composite, flexible plastic, solids</t>
			</c>
			<c id="XZN">
				<t id="en">Intermediate bulk container, composite, rigid plastic, pressurised</t>
			</c>
			<c id="XZP">
				<t id="en">Intermediate bulk container, composite, flexible plastic, pressurised</t>
			</c>
			<c id="XZQ">
				<t id="en">Intermediate bulk container, composite, rigid plastic, liquids</t>
			</c>
			<c id="XZR">
				<t id="en">Intermediate bulk container, composite, flexible plastic, liquids</t>
			</c>
			<c id="XZS">
				<t id="en">Intermediate bulk container, composite</t>
			</c>
			<c id="XZT">
				<t id="en">Intermediate bulk container, fibreboard</t>
			</c>
			<c id="XZU">
				<t id="en">Intermediate bulk container, flexible</t>
			</c>
			<c id="XZV">
				<t id="en">Intermediate bulk container, metal, other than steel</t>
			</c>
			<c id="XZW">
				<t id="en">Intermediate bulk container, natural wood</t>
			</c>
			<c id="XZX">
				<t id="en">Intermediate bulk container, plywood</t>
			</c>
			<c id="XZY">
				<t id="en">Intermediate bulk container, reconstituted wood</t>
			</c>
			<c id="XZZ">
				<t id="en">Mutually defined</t>
			</c>
			<c id="YDK">
				<t id="en">square yard</t>
			</c>
			<c id="YDQ">
				<t id="en">cubic yard</t>
			</c>
			<c id="YRD">
				<t id="en">yard</t>
			</c>
			<c id="Z9">
				<t id="en">nanomole</t>
			</c>
			<c id="Z11">
				<t id="en">hanging container</t>
			</c>
			<c id="ZP">
				<t id="en">page</t>
			</c>
			<c id="ZZ">
				<t id="en">mutually defined</t>
			</c>
		</cl>
	</xsl:variable>
	<xsl:function name="u:label">
		<xsl:param name="part" />
		<xsl:param name="value" />
		<xsl:choose>
			<xsl:when test="$labels/g[@id=$part]/f[@id=$value]/t[@id=$language]">
				<xsl:value-of select="$labels/g[@id=$part]/f[@id=$value]/t[@id=$language]/text()" />
			</xsl:when>
			<xsl:otherwise>
				<span class="mtr">[label:<xsl:value-of select="$part" />.<xsl:value-of select="$value" />]</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<xsl:variable name="labels">
		<g id="attachments">
			<f id="Attachments">
				<t id="en">Attachments</t>
			</f>
			<f id="Download">
				<t id="en">Download</t>
			</f>
			<f id="Embedded">
				<t id="en">Embedded</t>
			</f>
		</g>
		<g id="delivery">
			<f id="Address">
				<t id="en">Address</t>
			</f>
			<f id="Delivery">
				<t id="en">Delivery</t>
			</f>
			<f id="DeliveryDate">
				<t id="en">Date</t>
			</f>
			<f id="DeliveryID">
				<t id="en">Location</t>
			</f>
		</g>
		<g id="document">
			<f id="CreditNote">
				<t id="en">Credit Note</t>
			</f>
			<f id="Invoice">
				<t id="en">Invoice</t>
			</f>
		</g>
		<g id="item">
			<f id="BuyersItemIdentification">
				<t id="en">Buyers Item Identification</t>
			</f>
			<f id="CommodityClassification">
				<t id="en">Commodity Classification</t>
			</f>
			<f id="OriginCountry">
				<t id="en">Origin Country</t>
			</f>
			<f id="SellersItemIdentification">
				<t id="en">Sellers Item Identification</t>
			</f>
			<f id="StandardItemIdentification">
				<t id="en">Standard Item Identification</t>
			</f>
		</g>
		<g id="line">
			<f id="Allowance">
				<t id="en">Allowance</t>
			</f>
			<f id="AllowanceIncluded">
				<t id="en">Included allowance</t>
			</f>
			<f id="AllowanceTotalAmount">
				<t id="en">Allowance Total</t>
			</f>
			<f id="Charge">
				<t id="en">Charge</t>
			</f>
			<f id="ChargeIncluded">
				<t id="en">Included charge</t>
			</f>
			<f id="ChargeTotalAmount">
				<t id="en">Charge Total</t>
			</f>
			<f id="DocumentReference">
				<t id="en">Document Reference</t>
			</f>
			<f id="InvoicePeriod">
				<t id="en">Invoice Period</t>
			</f>
			<f id="LineExtensionAmount">
				<t id="en">Line Total</t>
			</f>
			<f id="OrderLineReference">
				<t id="en">Order Line</t>
			</f>
		</g>
		<g id="metadata">
			<f id="AccountingCost">
				<t id="en">Accounting Cost</t>
			</f>
			<f id="BuyerReference">
				<t id="en">Buyer Reference</t>
			</f>
			<f id="ContractDocumentReference">
				<t id="en">Contract Reference</t>
			</f>
			<f id="DespatchDocumentReference">
				<t id="en">Despatch Reference</t>
			</f>
			<f id="DocumentCurrencyCode">
				<t id="en">Currency</t>
			</f>
			<f id="DueDate">
				<t id="en">Due Date</t>
			</f>
			<f id="ID">
				<t id="en">Identifier</t>
			</f>
			<f id="InvoiceDocumentReference">
				<t id="en">Preceding Invoice Reference</t>
			</f>
			<f id="InvoicePeriod">
				<t id="en">Invoice Period</t>
			</f>
			<f id="IssueDate">
				<t id="en">Issue Date</t>
			</f>
			<f id="Metadata">
				<t id="en">Metadata</t>
			</f>
			<f id="ObjectIdentifier">
				<t id="en">Call for Tender/Lot</t>
			</f>
			<f id="OrderReference">
				<t id="en">Order Reference</t>
			</f>
			<f id="OriginatorDocumentReference">
				<t id="en">Originator Reference</t>
			</f>
			<f id="ProjectReference">
				<t id="en">Project Reference</t>
			</f>
			<f id="ReceiptDocumentReference">
				<t id="en">Receipt Reference</t>
			</f>
			<f id="TaxCurrencyCode">
				<t id="en">Tax Currency</t>
			</f>
			<f id="TaxPointDate">
				<t id="en">Tax Date</t>
			</f>
		</g>
		<g id="party">
			<f id="BankingReference">
				<t id="en">Banking Reference</t>
			</f>
			<f id="Customer">
				<t id="en">Customer</t>
			</f>
			<f id="EndpointID">
				<t id="en">Technical Address</t>
			</f>
			<f id="PartyIdentification">
				<t id="en">Party Identification</t>
			</f>
			<f id="PartyTaxScheme">
				<t id="en">Tax Identification</t>
			</f>
			<f id="Supplier">
				<t id="en">Supplier</t>
			</f>
		</g>
		<g id="payment">
			<f id="Payment">
				<t id="en">Payment</t>
			</f>
			<f id="PaymentMeansCode">
				<t id="en">Payment means</t>
			</f>
			<f id="PaymentID">
				<t id="en">Remittance information</t>
			</f>
			<f id="Account">
				<t id="en">Account</t>
			</f>
			<f id="MandateReference">
				<t id="en">Mandate reference</t>
			</f>
			<f id="DebitedAccount">
				<t id="en">Debited account</t>
			</f>
			<f id="CardAccount">
				<t id="en">Card account</t>
			</f>
		</g>
		<g id="tax">
			<f id="Category">
				<t id="en">Category</t>
			</f>
			<f id="Tax">
				<t id="en">Tax</t>
			</f>
			<f id="TaxableAmount">
				<t id="en">Taxable</t>
			</f>
			<f id="TaxAmount">
				<t id="en">Tax</t>
			</f>
			<f id="Total">
				<t id="en">Total</t>
			</f>
		</g>
		<g id="total">
			<f id="PayableAmount">
				<t id="en">Payable</t>
			</f>
			<f id="PayableRoundingAmount">
				<t id="en">Rounding Amount</t>
			</f>
			<f id="PrepaidAmount">
				<t id="en">Prepaid</t>
			</f>
			<f id="TaxExclusiveAmount">
				<t id="en">Tax Exclusive</t>
			</f>
			<f id="TaxInclusiveAmount">
				<t id="en">Tax Inclusive</t>
			</f>
			<f id="Totals">
				<t id="en">Totals</t>
			</f>
		</g>
	</xsl:variable>
	<xsl:param name="language" select="'en'" />
	<xsl:function name="u:lang">
		<xsl:value-of select="$language" />
	</xsl:function>
	<xsl:template name="mode_document">
		<xsl:apply-templates select="*" mode="document" />
	</xsl:template>
	<xsl:param name="mode" select="'document'" />
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$mode = 'document'">
				<xsl:call-template name="mode_document" />
			</xsl:when>
			<xsl:when test="$mode = 'help'">
				<xsl:call-template name="mode_help" />
			</xsl:when>
			<xsl:when test="$mode = 'translation'">
				<xsl:call-template name="mode_translation" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="mode_unknown" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="mode_help">
		<html lang="en">
			<head>
				<xsl:call-template name="doc-head" />
				<title>Help</title>
			</head>
			<body>
				<div id="document">
					<h1>Help</h1>
					<h2 id="supported-modes">Supported modes</h2>
					<ul>
						<li>
							<code>document</code> - Parsing of business document. (Default)</li>
						<li>
							<code>help</code> - Viewing this page.</li>
						<li>
							<code>translation</code> - List of all translatable strings.</li>
					</ul>
					<h2 id="parameters">Parameters</h2>
					<dl>
						<dt>download_attachment</dt>
						<dd>Default value: <code>false</code>
						</dd>
						<dt>language</dt>
						<dd>Default value: <code>en</code>
						</dd>
						<dt>mode</dt>
						<dd>See <a href="#supported-modes">supported modes for usage</a>. Default value: <code>document</code>
						</dd>
						<dt>stylesheet_url</dt>
						<dd>Set this parameter to provide location for stylesheet. This parameter removes the embedded stylesheet. Default value: <code>NONE</code>
						</dd>
					</dl>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="mode_translation">
		<html lang="en">
			<head>
				<xsl:call-template name="doc-head" />
				<title>Translation</title>
			</head>
			<body>
				<div id="document">
					<h1>Translation</h1>
					<p>Use parameter <code>language</code> to change language of presented translation.</p>
					<h2>Labels</h2>
					<ul class="list-unstyled">
						<xsl:for-each select="$labels/g">
							<xsl:variable name="g" select="@id" />
							<xsl:for-each select="f">
								<li>
									<xsl:value-of select="$g" />.<xsl:value-of select="@id" /> = <xsl:copy-of select="u:label($g, @id)" />
								</li>
							</xsl:for-each>
						</xsl:for-each>
					</ul>
					<xsl:for-each select="$codelists/cl">
						<xsl:variable name="cl" select="@id" />
						<h2>Codelist: <xsl:value-of select="@id" />
						</h2>
						<ul class="list-unstyled">
							<xsl:for-each select="c">
								<li>
									<xsl:value-of select="@id" /> = <xsl:copy-of select="u:codelist($cl, @id)" />
								</li>
							</xsl:for-each>
						</ul>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="mode_unknown">
		<html lang="en">
			<head>
				<xsl:call-template name="doc-head" />
				<title>Unknown mode</title>
			</head>
			<body>
				<div id="document">
					<h1>Unknown mode</h1>
					<p type="lead">Provided mode <code>
							<xsl:value-of select="$mode" />
						</code> is unknown. Please use mode <code>help</code> for more information.</p>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:param name="download_attachment" select="'false'" />
	<xsl:template name="attachments-block">
		<h3>
			<xsl:copy-of select="u:label('attachments', 'Attachments')" />
		</h3>
		<xsl:choose>
			<xsl:when test="cac:AdditionalDocumentReference[cac:Attachment]">
				<ul>
					<xsl:apply-templates select="cac:AdditionalDocumentReference[cac:Attachment]" mode="attachment" />
				</ul>
			</xsl:when>
			<xsl:otherwise>
				<em>No attachments provided.</em>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cac:AdditionalDocumentReference[cac:Attachment]" mode="attachment">
		<li>
			<xsl:value-of select="cbc:ID" />
			<xsl:if test="cbc:DocumentDescription">
				<br />
				<small>
					<xsl:value-of select="cbc:DocumentDescription" />
				</small>
			</xsl:if>
			<br />
			<xsl:apply-templates select="cac:Attachment/*" mode="attachment" />
		</li>
	</xsl:template>
	<xsl:template match="cac:ExternalReference" mode="attachment">
		<small>
			<a href="{cbc:URI}">
				<xsl:value-of select="cbc:URI" />
			</a>
		</small>
	</xsl:template>
	<xsl:template match="cbc:EmbeddedDocumentBinaryObject" mode="attachment">
		<xsl:choose>
			<xsl:when test="xs:boolean($download_attachment) = true()">
				<small>
					<a href="data:{@mimeCode};base64,{replace(text(), '\s', '')}" download="{@filename}">
						<xsl:copy-of select="u:label('attachments', 'Download')" /> <xsl:value-of select="@filename" />
					</a> (<xsl:value-of select="@mimeCode" />)</small>
			</xsl:when>
			<xsl:otherwise>
				<small>
					<xsl:copy-of select="u:label('attachments', 'Embedded')" />: <xsl:value-of select="@filename" /> (<xsl:value-of select="@mimeCode" />)</small>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="attachment" />
	<xsl:template match="cbc:ID" mode="common">
		<small>
			<xsl:value-of select="@schemeID" />:</small>
		<xsl:value-of select="text()" />
	</xsl:template>
	<xsl:template match="cbc:*[ends-with(local-name(), 'Amount')]" mode="common">
		<xsl:value-of select="format-number(text(), '###,##0.00')" /> <small>
			<xsl:value-of select="@currencyID" />
		</small>
	</xsl:template>
	<xsl:template match="cac:*[ends-with(local-name(), 'Period')]" mode="common">
		<xsl:apply-templates select="cbc:StartDate" mode="common" /> - <xsl:apply-templates select="cbc:EndDate" mode="common" />
	</xsl:template>
	<xsl:template match="cac:*[ends-with(local-name(), 'Date')]" mode="common">
		<xsl:value-of select="text()" />
	</xsl:template>
	<xsl:template match="cac:*[ends-with(local-name(), 'TaxCategory')]" mode="common">
		<small>
			<xsl:value-of select="cac:TaxScheme/cbc:ID" />:</small>
		<xsl:value-of select="cbc:ID" />
		<small> - <xsl:copy-of select="u:codelist('uncl5305', cbc:ID/text())" /> (<xsl:value-of select="cbc:Percent" />%)</small>
		<xsl:if test="cbc:TaxExemptionReason">
			<br />
			<small>
				<xsl:value-of select="cbc:TaxExemptionReason" />
			</small>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cbc:*[ends-with(local-name(), 'Quantity')]" mode="common">
		<xsl:value-of select="text()" />
		<xsl:if test="@unitCode">
			<xsl:text> </xsl:text>
			<small>
				<xsl:value-of select="@unitCode" /> - <xsl:copy-of select="u:codelist('unecerec20', @unitCode)" />
			</small>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cbc:Note" mode="common">
		<p class="note">
			<xsl:for-each select="tokenize(text(), '\n')">
				<xsl:value-of select="normalize-space(.)" />
				<xsl:if test="position() != last()">
					<br />
				</xsl:if>
			</xsl:for-each>
		</p>
	</xsl:template>
	<xsl:template name="delivery-block">
		<h3>
			<xsl:copy-of select="u:label('delivery', 'Delivery')" />
		</h3>
		<xsl:apply-templates select="cac:Delivery" mode="delivery" />
	</xsl:template>
	<xsl:template match="cac:Delivery" mode="delivery">
		<div style="margin-bottom: 10pt;">
			<dl>
				<xsl:apply-templates select="cbc:ActualDeliveryDate" mode="delivery" />
				<xsl:apply-templates select="cac:DeliveryLocation/cbc:ID" mode="delivery" />
				<xsl:apply-templates select="cac:DeliveryLocation/cac:Address" mode="delivery" />
			</dl>
		</div>
	</xsl:template>
	<xsl:template match="cbc:ActualDeliveryDate" mode="delivery">
		<dt>
			<xsl:copy-of select="u:label('delivery', 'DeliveryDate')" />
		</dt>
		<dd>
			<xsl:value-of select="text()" />
		</dd>
	</xsl:template>
	<xsl:template match="cbc:ID" mode="delivery">
		<dt>
			<xsl:copy-of select="u:label('delivery', 'DeliveryID')" />
		</dt>
		<dd>
			<xsl:apply-templates select="current()" mode="common" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:Address" mode="delivery">
		<dt>
			<xsl:copy-of select="u:label('delivery', 'Address')" />
		</dt>
		<dd>
			<div>
				<xsl:value-of select="cbc:StreetName" />
			</div>
			<div>
				<xsl:value-of select="cbc:AdditionalStreetName" />
			</div>
			<div>
				<span>
					<xsl:value-of select="cbc:PostalZone" />
				</span>
				<span> </span>
				<span>
					<xsl:value-of select="cbc:CityName" />
				</span>
			</div>
			<div>
				<xsl:value-of select="cbc:CountrySubentity" />
			</div>
			<div>
				<xsl:copy-of select="u:codelist('iso3166', cac:Country/cbc:IdentificationCode/text())" />
			</div>
		</dd>
	</xsl:template>
	<xsl:template match="cac:Item" mode="item-info">
		<xsl:apply-templates select="cbc:Name" mode="item-info" />
		<xsl:apply-templates select="cbc:Description" mode="item-info" />
	</xsl:template>
	<xsl:template match="cbc:Name" mode="item-info">
		<div>
			<strong>
				<xsl:value-of select="text()" />
			</strong>
		</div>
	</xsl:template>
	<xsl:template match="cbc:Description" mode="item-info">
		<div>
			<xsl:value-of select="text()" />
		</div>
	</xsl:template>
	<xsl:template match="cac:Item" mode="item-details">
		<xsl:apply-templates select="*" mode="item-details" />
	</xsl:template>
	<xsl:template match="cac:BuyersItemIdentification" mode="item-details">
		<dt>
			<xsl:copy-of select="u:label('item', local-name())" />
		</dt>
		<dd>
			<xsl:value-of select="cbc:ID" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:SellersItemIdentification" mode="item-details">
		<dt>
			<xsl:copy-of select="u:label('item', local-name())" />
		</dt>
		<dd>
			<xsl:value-of select="cbc:ID" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:StandardItemIdentification" mode="item-details">
		<dt>
			<xsl:copy-of select="u:label('item', local-name())" />
		</dt>
		<dd>
			<xsl:apply-templates select="cbc:ID" mode="common" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:CommodityClassification" mode="item-details">
		<dt>
			<xsl:copy-of select="u:label('item', local-name())" />
		</dt>
		<dd>
			<small>
				<xsl:value-of select="cbc:ItemClassificationCode/@listID" />:</small>
			<xsl:value-of select="cbc:ItemClassificationCode" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:OriginCountry" mode="item-details">
		<dt>
			<xsl:copy-of select="u:label('item', local-name())" />
		</dt>
		<dd>
			<xsl:copy-of select="u:codelist('iso3166', cbc:IdentificationCode/text())" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:ClassifiedTaxCategory | cbc:Name | cbc:Description | cac:AdditionalItemProperty" mode="item-details" />
	<xsl:template match="*" mode="item-details">
		<div>[<xsl:value-of select="local-name()" />]</div>
	</xsl:template>
	<xsl:template match="cac:AdditionalItemProperty" mode="item-properties">
		<dt>
			<xsl:value-of select="cbc:Name" />
		</dt>
		<dd>
			<xsl:value-of select="cbc:Value" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator='false']" mode="line">
		<div class="row">
			<div class="col-sm-11 col-sm-offset-1">
				<xsl:value-of select="cbc:AllowanceChargeReason" />
				<xsl:if test="cbc:AllowanceChargeReasonCode"> <small>(<xsl:value-of select="cbc:AllowanceChargeReasonCode" />)</small>
				</xsl:if>
			</div>
		</div>
		<div class="linetotal">
			<div class="row">
				<div class="col-sm-7 col-sm-offset-1">
					<xsl:copy-of select="u:label('line', 'Allowance')" />
				</div>
				<div class="col-sm-2">
					<xsl:apply-templates select="cac:TaxCategory" mode="common" />
				</div>
				<div class="col-sm-2 text-right">-<xsl:apply-templates select="cbc:Amount" mode="common" />
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator='true']" mode="line">
		<div class="row">
			<div class="col-sm-11 col-sm-offset-1">
				<xsl:value-of select="cbc:AllowanceChargeReason" />
				<xsl:if test="cbc:AllowanceChargeReasonCode"> <small>(<xsl:value-of select="cbc:AllowanceChargeReasonCode" />)</small>
				</xsl:if>
			</div>
		</div>
		<div class="linetotal">
			<div class="row">
				<div class="col-sm-7 col-sm-offset-1">
					<xsl:copy-of select="u:label('line', 'Charge')" />
				</div>
				<div class="col-sm-2">
					<xsl:apply-templates select="cac:TaxCategory" mode="common" />
				</div>
				<div class="col-sm-2 text-right">
					<xsl:apply-templates select="cbc:Amount" mode="common" />
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cac:InvoiceLine | cac:CreditNoteLine" mode="line">
		<div class="line">
			<div class="number">
				<xsl:value-of select="cbc:ID" />
			</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="info col-sm-6">
						<xsl:apply-templates select="cac:Item" mode="item-info" />
						<xsl:apply-templates select="cbc:Note" mode="common" />
						<xsl:if test="cac:InvoicePeriod | cac:OrderLineReference | cac:DocumentReference">
							<dl>
								<xsl:apply-templates select="cac:InvoicePeriod" mode="line" />
								<xsl:if test="normalize-space(cac:OrderLineReference/cbc:LineID/text())">
									<dt>
										<xsl:copy-of select="u:label('line', 'OrderLineReference')" />
									</dt>
									<dd>
										<xsl:value-of select="cac:OrderLineReference/cbc:LineID" />
									</dd>
								</xsl:if>
								<xsl:apply-templates select="cac:DocumentReference" mode="line" />
							</dl>
						</xsl:if>
					</div>
					<div class="details col-sm-6">
						<xsl:if test="cac:Item/cac:AdditionalItemProperty">
							<dl>
								<xsl:apply-templates select="cac:Item/cac:AdditionalItemProperty" mode="item-properties" />
							</dl>
						</xsl:if>
						<dl>
							<xsl:apply-templates select="cac:Item" mode="item-details" />
						</dl>
					</div>
				</div>
				<xsl:apply-templates select="cac:Price" mode="line" />
				<xsl:apply-templates select="cac:AllowanceCharge" mode="line-ac" />
			</div>
		</div>
		<div class="linetotal">
			<div class="row">
				<div class="col-sm-3 col-sm-offset-1">
					<xsl:apply-templates select="cbc:InvoicedQuantity" mode="common" />
				</div>
				<div class="col-sm-4">
					<xsl:value-of select="cbc:AccountingCost" />
				</div>
				<div class="col-sm-2">
					<xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory" mode="common" />
				</div>
				<div class="col-sm-2 text-right">
					<xsl:apply-templates select="cbc:LineExtensionAmount" mode="common" />
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cac:InvoicePeriod" mode="line">
		<dt>
			<xsl:copy-of select="u:label('line', local-name())" />
		</dt>
		<dd>
			<xsl:apply-templates select="current()" mode="common" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:DocumentReference" mode="line">
		<dt>
			<xsl:copy-of select="u:label('line', local-name())" />
		</dt>
		<dd>
			<xsl:apply-templates select="cbc:ID" mode="common" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:Price" mode="line">
		<div class="linesupport">
			<div class="row">
				<div class="col-sm-9">Price á <xsl:apply-templates select="cbc:BaseQuantity" mode="common" />
				</div>
				<div class="col-sm-3 text-right">
					<xsl:apply-templates select="cbc:PriceAmount" mode="common" />
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator='true']" mode="line-ac">
		<div class="linesupport">
			<div class="row">
				<div class="col-sm-9">
					<xsl:copy-of select="u:label('line', 'ChargeIncluded')" />: <xsl:value-of select="cbc:AllowanceChargeReason" />
				</div>
				<div class="col-sm-3 text-right">
					<xsl:apply-templates select="cbc:Amount" mode="common" />
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator='false']" mode="line-ac">
		<div class="linesupport">
			<div class="row">
				<div class="col-sm-9">
					<xsl:copy-of select="u:label('line', 'AllowanceIncluded')" />: <xsl:value-of select="cbc:AllowanceChargeReason" />
				</div>
				<div class="col-sm-3 text-right">-<xsl:apply-templates select="cbc:Amount" mode="common" />
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cbc:LineExtensionAmount | cbc:ChargeTotalAmount" mode="line">
		<div class="total">
			<div class="row">
				<div class="col-xs-6 col-sm-8 col-sm-offset-1">
					<xsl:copy-of select="u:label('line', local-name())" />
				</div>
				<div class="col-xs-6 col-sm-2 col-sm-offset-1 text-right">
					<xsl:apply-templates select="current()" mode="common" />
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cbc:AllowanceTotalAmount" mode="line">
		<div class="total">
			<div class="row">
				<div class="col-xs-6 col-sm-8 col-sm-offset-1">
					<xsl:copy-of select="u:label('line', local-name())" />
				</div>
				<div class="col-xs-6 col-sm-2 col-sm-offset-1 text-right">-<xsl:apply-templates select="current()" mode="common" />
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="*" mode="line">
		<div>[<xsl:value-of select="local-name()" />]</div>
	</xsl:template>
	<xsl:template name="metadata">
		<h3>
			<xsl:copy-of select="u:label('metadata', 'Metadata')" />
		</h3>
		<dl>
			<xsl:apply-templates select="cbc:ID" mode="metadata-detail" />
			<xsl:apply-templates select="cbc:BuyerReference" mode="metadata-detail" />
			<xsl:apply-templates select="cac:ProjectReference" mode="metadata-detail" />
			<xsl:apply-templates select="cbc:IssueDate" mode="metadata-detail" />
			<xsl:apply-templates select="cbc:DueDate" mode="metadata-detail" />
			<xsl:apply-templates select="cbc:TaxPointDate" mode="metadata-detail" />
			<xsl:apply-templates select="cac:InvoicePeriod" mode="metadata-detail" />
			<xsl:apply-templates select="cbc:AccountingCost" mode="metadata-detail" />
			<xsl:apply-templates select="cac:OrderReference" mode="metadata-detail" />
			<xsl:apply-templates select="cac:BillingReference" mode="metadata-detail-exact" />
			<xsl:apply-templates select="cac:DespatchDocumentReference" mode="metadata-detail" />
			<xsl:apply-templates select="cac:ReceiptDocumentReference" mode="metadata-detail" />
			<xsl:apply-templates select="cac:OriginatorDocumentReference" mode="metadata-detail" />
			<xsl:apply-templates select="cac:ContractDocumentReference" mode="metadata-detail" />
			<xsl:apply-templates select="cac:AdditionalDocumentReference[cbc:ID[@schemeID]]" mode="metadata-detail-exact" />
			<xsl:apply-templates select="cbc:DocumentCurrencyCode" mode="metadata-detail" />
			<xsl:apply-templates select="cbc:TaxCurrencyCode" mode="metadata-detail" />
		</dl>
	</xsl:template>
	<xsl:template match="cac:BillingReference" mode="metadata-detail-exact">
		<xsl:for-each select="cac:InvoiceDocumentReference">
			<xsl:apply-templates select="." mode="metadata-detail" />
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cac:AdditionalDocumentReference" mode="metadata-detail-exact">
		<dt>
			<xsl:copy-of select="u:label('metadata', 'ObjectIdentifier')" />
		</dt>
		<dd>
			<small>
				<xsl:value-of select="cbc:ID/@schemeID" />:</small>
			<xsl:value-of select="cbc:ID" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:*[ends-with(local-name(), 'Period')]" mode="metadata-detail">
		<dt>
			<xsl:copy-of select="u:label('metadata', local-name())" />
		</dt>
		<dd>
			<xsl:apply-templates select="current()" mode="common" />
			<xsl:if test="cbc:DescriptionCode">
				<span> (<xsl:value-of select="cbc:DescriptionCode" />)</span>
			</xsl:if>
		</dd>
	</xsl:template>
	<xsl:template match="cac:*[ends-with(local-name(), 'Reference')]" mode="metadata-detail">
		<dt>
			<xsl:copy-of select="u:label('metadata', local-name())" />
		</dt>
		<dd>
			<xsl:value-of select="cbc:ID" />
			<xsl:if test="cbc:IssueDate">
				<span> (<xsl:value-of select="cbc:IssueDate" />)</span>
			</xsl:if>
		</dd>
	</xsl:template>
	<xsl:template match="cbc:*" mode="metadata-detail">
		<dt>
			<xsl:copy-of select="u:label('metadata', local-name())" />
		</dt>
		<dd>
			<xsl:value-of select="text()" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:*" mode="metadata-detail">
		<dt>
			<xsl:copy-of select="u:label('metadata', local-name())" />
		</dt>
		<dd>
			<xsl:value-of select="current()" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:Party | cac:PayeeParty | cac:TaxRepresentativeParty" mode="party-with-contact">
		<div class="row">
			<div class="col-md-7">
				<xsl:if test="cac:PartyName | cac:PostalAddress">
					<div style="margin-bottom: 10pt;">
						<xsl:apply-templates select="cac:PartyName" mode="party" />
						<xsl:apply-templates select="cac:PostalAddress" mode="party" />
					</div>
				</xsl:if>
				<xsl:if test="cac:PartyLegalEntity">
					<div style="margin-bottom: 10pt;">
						<xsl:apply-templates select="cac:PartyLegalEntity" mode="party" />
					</div>
				</xsl:if>
			</div>
			<div class="col-md-5">
				<xsl:apply-templates select="cac:Contact" mode="party" />
			</div>
		</div>
		<xsl:if test="cbc:EndpointID | cac:PartyLegalEntity/cbc:CompanyID | cac:PartyIdentification | cac:PartyTaxScheme">
			<dl style="margin-bottom: 10pt;">
				<xsl:apply-templates select="cac:PartyIdentification[cbc:ID[@schemeID]]" mode="party" />
				<xsl:apply-templates select="cac:PartyIdentification[cbc:ID[not(@schemeID)]]" mode="party" />
				<xsl:apply-templates select="cac:PartyTaxScheme" mode="party" />
				<xsl:apply-templates select="cbc:EndpointID" mode="party" />
			</dl>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cac:Party | cac:PayeeParty | cac:TaxRepresentativeParty" mode="party">
		<xsl:if test="cac:PartyName | cac:PostalAddress">
			<div style="margin-bottom: 10pt;">
				<xsl:apply-templates select="cac:PartyName" mode="party" />
				<xsl:apply-templates select="cac:PartyLegalEntity/cbc:RegistrationName" mode="party" />
				<xsl:apply-templates select="cac:PostalAddress" mode="party" />
			</div>
		</xsl:if>
		<xsl:if test="cbc:EndpointID | cac:PartyIdentification | cac:PartyTaxScheme">
			<dl style="margin-bottom: 10pt;">
				<xsl:apply-templates select="cac:PartyLegalEntity/cbc:CompanyID" mode="party" />
				<xsl:apply-templates select="cac:PartyIdentification[cbc:ID[@schemeID]]" mode="party" />
				<xsl:apply-templates select="cac:PartyIdentification[cbc:ID[not(@schemeID)]]" mode="party" />
				<xsl:apply-templates select="cac:PartyTaxScheme" mode="party" />
				<xsl:apply-templates select="cbc:EndpointID" mode="party" />
			</dl>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cac:PartyName" mode="party">
		<div>
			<strong>
				<xsl:value-of select="cbc:Name" />
			</strong>
		</div>
	</xsl:template>
	<xsl:template match="cac:PostalAddress" mode="party">
		<xsl:if test="cbc:StreetName">
			<div>
				<xsl:value-of select="cbc:StreetName" />
			</div>
		</xsl:if>
		<xsl:if test="cbc:AdditionalStreetName">
			<div>
				<xsl:value-of select="cbc:AdditionalStreetName" />
			</div>
		</xsl:if>
		<xsl:if test="cac:AddressLine">
			<xsl:for-each select="cac:AddressLine">
				<div>
					<xsl:value-of select="cbc:Line" />
				</div>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cbc:PostalZone and cbc:CityName">
			<div>
				<span>
					<xsl:value-of select="cbc:PostalZone" />
				</span>
				<span> </span>
				<span>
					<xsl:value-of select="cbc:CityName" />
				</span>
			</div>
		</xsl:if>
		<xsl:if test="cbc:CountrySubentity">
			<div>
				<xsl:value-of select="cbc:CountrySubentity" />
			</div>
		</xsl:if>
		<xsl:if test="cac:Country">
			<div>
				<xsl:copy-of select="u:codelist('iso3166', cac:Country/cbc:IdentificationCode/text())" />
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cac:PartyIdentification[cbc:ID[@schemeID]]" mode="party">
		<dt>
			<xsl:copy-of select="u:label('party', local-name())" />
		</dt>
		<dd>
			<xsl:apply-templates select="cbc:ID" mode="common" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:PartyIdentification[cbc:ID[not(@schemeID)]]" mode="party">
		<dt>
			<xsl:copy-of select="u:label('party', 'BankingReference')" />
		</dt>
		<dd>
			<xsl:value-of select="cbc:ID" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:PartyLegalEntity" mode="party">
		<div>
			<strong>
				<xsl:value-of select="cbc:RegistrationName" />
			</strong> (<xsl:value-of select="cbc:CompanyLegalForm" />)</div>
		<div>
			<small>
				<xsl:value-of select="cbc:CompanyID/@schemeID" />:</small>
			<xsl:value-of select="cbc:CompanyID" />
		</div>
	</xsl:template>
	<xsl:template match="cac:PartyLegalEntity/cbc:CompanyID" mode="party">
		<dt>Legal Company Identifier</dt>
		<dd>
			<xsl:value-of select="text()" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:PartyTaxScheme" mode="party">
		<dt>
			<xsl:copy-of select="u:label('party', local-name())" />
		</dt>
		<dd>
			<small>
				<xsl:value-of select="cac:TaxScheme/cbc:ID" />:</small>
			<xsl:value-of select="cbc:CompanyID" />
		</dd>
	</xsl:template>
	<xsl:template match="cbc:EndpointID" mode="party">
		<dt>
			<xsl:copy-of select="u:label('party', local-name())" />
		</dt>
		<dd>
			<small>
				<xsl:value-of select="@schemeID" />:</small>
			<xsl:value-of select="text()" />
		</dd>
	</xsl:template>
	<xsl:template match="cac:Contact" mode="party">
		<div style="margin-bottom: 10pt;">
			<div>
				<xsl:value-of select="cbc:Name" />
			</div>
			<div>tlf: <xsl:value-of select="cbc:Telephone" />
			</div>
			<div>
				<a href="mailto:{cbc:ElectronicMail}">
					<xsl:value-of select="cbc:ElectronicMail" />
				</a>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cac:PaymentMeans" mode="payment">
		<div class="row">
			<div class="col-sm-2">
				<xsl:value-of select="cbc:PaymentMeansCode" />
			</div>
			<div class="col-sm-10">
				<dl class="row">
					<dt class="col-sm-4">PaymentID</dt>
					<dd class="col-sm-8">
						<xsl:value-of select="cbc:PaymentID" />
					</dd>
					<dt class="col-sm-4">Account</dt>
					<dd class="col-sm-8">
						<xsl:value-of select="cac:PayeeFinancialAccount/cbc:ID" /> (<xsl:value-of select="cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID" />)</dd>
					<xsl:if test="cac:PaymentMandate/cbc:ID">
						<dt class="col-sm-4">
							<xsl:copy-of select="u:label('payment', 'MandateReference')" />
						</dt>
						<dd class="col-sm-8">
							<xsl:value-of select="cac:PaymentMandate/cbc:ID" />
						</dd>
					</xsl:if>
					<xsl:if test="cac:PaymentMandate/cac:PayerFinancialAccount/cbc:ID">
						<dt class="col-sm-4">
							<xsl:copy-of select="u:label('payment', 'DebitedAccount')" />
						</dt>
						<dd class="col-sm-8">
							<xsl:value-of select="cac:PaymentMandate/cac:PayerFinancialAccount/cbc:ID" />
						</dd>
					</xsl:if>
				</dl>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="cac:PaymentTerms" mode="payment">
		<xsl:apply-templates select="cbc:Note" mode="common" />
	</xsl:template>
	<xsl:template match="cac:TaxTotal" mode="tax">
		<table>
			<thead>
				<tr>
					<th>
						<xsl:copy-of select="u:label('tax', 'Category')" />
					</th>
					<th style="width: 20%;">
						<xsl:copy-of select="u:label('tax', 'TaxableAmount')" />
					</th>
					<th style="width: 20%;">
						<xsl:copy-of select="u:label('tax', 'TaxAmount')" />
					</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="cac:TaxSubtotal" mode="tax" />
			</tbody>
			<tfoot>
				<xsl:apply-templates select="cbc:TaxAmount" mode="tax" />
				<xsl:apply-templates select="../cac:TaxTotal[not(cac:TaxSubtotal)]/cbc:TaxAmount" mode="tax" />
			</tfoot>
		</table>
	</xsl:template>
	<xsl:template match="cac:TaxSubtotal" mode="tax">
		<tr>
			<td>
				<xsl:apply-templates select="cac:TaxCategory" mode="common" />
			</td>
			<td class="text-right">
				<xsl:apply-templates select="cbc:TaxableAmount" mode="common" />
			</td>
			<td class="text-right">
				<xsl:apply-templates select="cbc:TaxAmount" mode="common" />
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="cbc:TaxAmount" mode="tax">
		<tr>
			<td colspan="2">
				<xsl:copy-of select="u:label('tax', 'Total')" />
			</td>
			<td class="text-right">
				<xsl:apply-templates select="." mode="common" />
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="cac:LegalMonetaryTotal" mode="total">
		<h3>
			<xsl:copy-of select="u:label('total', 'Totals')" />
		</h3>
		<dl>
			<xsl:apply-templates select="cbc:TaxExclusiveAmount | cbc:TaxInclusiveAmount | cbc:PrepaidAmount | cbc:PayableRoundingAmount | cbc:PayableAmount" mode="total" />
		</dl>
	</xsl:template>
	<xsl:template match="cbc:PayableAmount" mode="total">
		<dt>
			<xsl:copy-of select="u:label('total', local-name())" />
		</dt>
		<dd>
			<strong>
				<xsl:apply-templates select="current()" mode="common" />
			</strong>
		</dd>
	</xsl:template>
	<xsl:template match="cbc:*" mode="total">
		<dt>
			<xsl:copy-of select="u:label('total', local-name())" />
		</dt>
		<dd>
			<xsl:apply-templates select="current()" mode="common" />
		</dd>
	</xsl:template>
	<xsl:template match="*" mode="document">
		<html lang="{$language}">
			<head>
				<xsl:call-template name="doc-head" />
				<title>Unknown document type</title>
			</head>
			<body>
				<div id="document">
					<h1>Unknown document type</h1>
					<p class="lead">The document you tried to render were not recognized.</p>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
