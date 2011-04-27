<%@ page import="banksystem.DashboardController" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <style type="text/css" media="screen">
	ul {
		list-style : none;
		text-align : center;
	}
	
	.buttons {
  	     font: bold 15px/15px verdana, geneva, helvetica;
  	     border: 2px solid #ccc;
		width:25%;
		padding: 10px;
		margin-top:30px;
		margin-bottom:30px;
		margin-left:auto;
		margin-right:auto;
	}
    </style>
    <title>Visit Bank</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton">
        <a class="home" href="${resource(dir:'')}">Home</a>
      </span>
    </div>
    <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
    </g:if>
    <g:link action="validateBank">
		 <ul> 
			<li class="buttons"><g:link action="transactWithTeller" params="[id: bank.tellers.toList().get(0).id, type: 'user']">Transact With Teller</g:link></li>
			<li class="buttons"><g:link action="transactWithATM" params="[id: bank.atms.toList().get(0).id, type: 'user']">Transact With ATM</g:link></li>
		</ul>
    </g:link>
  </body>
</html>
