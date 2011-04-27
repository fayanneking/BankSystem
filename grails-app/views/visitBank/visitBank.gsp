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
    <g:form action="validateBank">
      <table>
		<tr class="prop">
			<td></td><td></td><td></td><td></td><td></td><td></td>
			<td class="name">
				<label for="bank">Bank</label>
			</td>
			<td class="value">
				<input type="text" id="bank" name="bank" value="">
			</td>
			<td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
		<tr class="prop">
			<td></td><td></td><td></td><td></td><td></td><td></td>
			<td class="name">
				<label for="location">Location</label>
			</td>
			<td class="value">
				<input type="text" id="location" name="location" value="">
			</td>
			<td></td><td></td><td></td><td></td><td></td><td></td>
		</tr>
		<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td><input type="submit" value="Go"/></td>
		</tr>
      </table>
    </g:form>
  </body>
</html>
