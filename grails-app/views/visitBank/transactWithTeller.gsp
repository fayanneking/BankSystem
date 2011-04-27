
<%@ page import="banksystem.Teller" %>
<html>
  <head>
    <title>Transaction - Teller</title>
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
	.menuButton {
			font-size:13px;
	}
    </style>
  </head>
  <body>
	<div class="nav">
		<g:if test="${type == 'teller'}">
			<g:render template="/dashboard/tellerNav" model="${[id:tellerId, name:name, type:type]}" />
		</g:if>
		<g:else>
		    <span class="menuButton">
			  <a class="home" href="${resource(dir:'')}">Home</a>
			</span>
		</g:else>
    </div>
    <div id="options">
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
    </g:if>
	<ul> 
		<li class="buttons"><g:link controller="transaction" action="createAccount" params="[id: tellerId, type:type, cName:cName, aName:aName]">Create Account</g:link></li>
		<li class="buttons"><g:link controller="transaction" action="removeAccount" params="[id: tellerId, type:type, cName:cName, aName:aName]">Remove Account</g:link></li>
		<li class="buttons"><g:link controller="transaction"  action="getBalance" params="[id: bankId, type:type, cName:cName, aName:aName]">Get Balance</g:link></li>
		<li class="buttons"><g:link controller="transaction"  action="withdraw" params="[id: bankId, type:type, cName:cName, aName:aName]">Withdraw</g:link></li>
		<li class="buttons"><g:link controller="transaction"  action="deposit" params="[id: bankId, type:type, cName:cName, aName:aName]">Deposit</g:link></li>
		<li class="buttons"><g:link controller="transaction"  action="transfer" params="[id: bankId, type:type, cName:cName, aName:aName]">Transfer Money</g:link></li>
	</ul>
    </div>
  </body>
</html>
