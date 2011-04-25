<%@ page import="banksystem.ATM" %>
<html>
  <head>
    <title>Transaction With ATM</title>
	  <meta name="layout" content="main" />
	  <style type="text/css" media="screen">
	ul {
		margin-top:30px;
		list-style : none;
		text-align : center;
	}
	
	.buttons {
  	    font: bold 15px/15px verdana, geneva, helvetica;
  	    border: 2px solid #ccc;
		width:25%;
		padding: 10px;
		margin-top:10px;
		margin-bottom:10px;
		margin-left:auto;
		margin-right:auto;
	}
    </style>
  </head>
  <body>
	<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    </div>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
    </g:if>
    <div id="options">
		<ul> 
			<li class="buttons"><g:link controller="transaction"  action="getBalance" id="${bankId}">Get Balance</g:link></li>
			<li class="buttons"><g:link controller="transaction"  action="withdraw" id="${bankId}">Withdraw</g:link></li>
			<li class="buttons"><g:link controller="transaction"  action="deposit" id="${bankId}">Deposit</g:link></li>
			<li class="buttons"><g:link controller="transaction"  action="transfer" id="${bankId}">Money Transfer</g:link></li>
		</ul>
    </div>
  </body>
</html>
