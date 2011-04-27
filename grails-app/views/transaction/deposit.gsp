<%@ page import="banksystem.Transaction" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <style type="text/css" media="screen">
        form {
	     margin-top:30px;
	     margin-left:400px;
	     margin-right:400px;
	     border:1px solid #000;
	     padding : 10px;
	     background-color:#F0F0F0 ;
	}
	td {
	     font-size:15px;
	     vertical-align:middle;
	}
	input {
  	     font: bold 15px/15px verdana, geneva, helvetica;
  	     border: 2px solid #ccc;
	}
    </style>
    <title>Deposit</title>
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
    <g:form action="depositToAccount" id="${bankId}">
		<input type="hidden" name="cName" value="${cName}">
      		<input type="hidden" name="aName" value="${aName}">
      		<input type="hidden" name="type" value="${type}">
      <table>
        <tr class="prop">
	  <td></td><td></td><td></td>
          <td class="name">
            <label for="accountName">Account Name:</label>
          </td>
          <td class="value">
            <input type="text" id="accountName" name="accountName" value="">
          </td>
		<td></td><td></td><td></td>
        </tr>
		<tr class="prop">
			<td></td><td></td><td></td>
			<td class="name">
				<label for="amount">Amount:</label>
			</td>
			<td class="value">
				<input type="text" id="amount" name="amount" value="">
			</td>
			<td></td><td></td><td></td>
        </tr>
        <tr>
          <td></td><td></td><td></td><td></td>
          <td><input type="submit" value="Deposit"/></td>
        </tr>
      </table>
    </g:form>
  </body>
</html>
