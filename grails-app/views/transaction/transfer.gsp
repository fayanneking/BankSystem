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
    <title>Transfer</title>
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
    <g:form action="transferToAccount" id="${bankId}">
      <table>
        <tr class="prop">
			<td></td><td></td><td></td>
			<td class="name">
				<label for="scrAccountName">Source Account Name:</label>
			</td>
			<td class="value">
				<input type="text" id="srcAccountName" name="srcAccountName" value="">
			</td>
			<td></td><td></td><td></td>
        </tr>
        <tr class="prop">
			<td></td><td></td><td></td>
			<td class="name">
				<label for="pin">Pin:</label>
			</td>
			<td class="value">
				<input type="password" id="pin" name="pin" value="">
			</td>
			<td></td><td></td><td></td>
        </tr>
		<tr class="prop">
			<td></td><td></td><td></td>
			<td class="name">
				<label for="destAccountName">Destination Account Name:</label>
			</td>
			<td class="value">
				<input type="text" id="destAccountName" name="destAccountName" value="">
			</td>
			<td></td><td></td><td></td>
        </tr>
		<tr class="prop">
			<td></td><td></td><td></td>
			<td class="name">
				<label for="destBank">Destination Bank:</label>
			</td>
			<td class="value">
				<input type="text" id="destBank" name="destBank" value="">
			</td>
			<td></td><td></td><td></td>
        </tr>
		<tr class="prop">
			<td></td><td></td><td></td>
			<td class="name">
				<label for="amount">Amount to be Transferred:</label>
			</td>
			<td class="value">
				<input type="text" id="amount" name="amount" value="">
			</td>
			<td></td><td></td><td></td>
        </tr>
        <tr>
          <td></td><td></td><td></td><td></td>
          <td><input type="submit" value="Transfer"/></td>
        </tr>
      </table>
    </g:form>
  </body>
</html>
