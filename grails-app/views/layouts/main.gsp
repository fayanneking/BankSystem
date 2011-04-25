<!DOCTYPE html>
<html>
    <head>
	<style type="text/css" media="screen">
        #worldBankLogo {
	    margin-top:20px;
	    text-align:center;
        }
        </style>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="worldBankLogo">
		<a href="http://localhost:8080/BankSystem"><img src="${resource(dir:'images',file:'bank_banner.jpg')}" alt="The Worldwide Bank System" border="0" width="880" height="200"/></a>
       		<g:logoutToggle/>
	</div>
        <g:layoutBody />
    </body>
</html>
