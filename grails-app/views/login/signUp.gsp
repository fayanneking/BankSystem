<%@ page import="banksystem.DashboardController" %>
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
    <title>Sign Up</title>
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
    <g:form action="validateAccount">
      <input type="hidden" name="cName" value="${cName}">
      <input type="hidden" name="aName" value="${aName}">
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
            <label for="username">Desired Username:</label>
          </td>
          <td class="value">
            <input type="text" id="username" name="username" value="">
          </td>
          <td></td><td></td><td></td>
        </tr>
        <tr class="prop">
	  <td></td><td></td><td></td>
          <td class="name">
            <label for="password">Desired Password:</label>
          </td>
          <td class="value">
            <input type="password" id="password" name="password" value="">
          </td>
	  <td></td><td></td><td></td>
        </tr>
        <tr>
          <td></td><td></td><td></td><td></td>
          <td><input type="submit" value="Sign Up"/></td>
        </tr>
      </table>
    </g:form>
  </body>
</html>
