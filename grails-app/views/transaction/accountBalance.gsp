
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
	h1 {
		text-align:center
	}
    </style>
    <title>Get Balance</title>
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
	<h1>Account Details</h1>
    <g:form id="${bankId}">
      <input type="hidden" name="cName" value="${cName}">
      <input type="hidden" name="aName" value="${aName}">
      <input type="hidden" name="type" value="${type}">
      <table>
        <tr class="prop">
		  <td></td><td></td><td></td>
          <td class="name">
            <label>Account Name:</label>
          </td>
		  <td></td>
          <td class="name">
            <label><b>${accountName}</b></label>
          </td>
	      <td></td><td></td><td></td>		  
        </tr>
        <tr class="prop">
	     <td></td><td></td><td></td>
         <td class="name">
            <label>Pin:</label>
         </td><td></td>
         <td class="name">
            <label><b>${pin}</b></label>
          </td>
	      <td></td><td></td><td></td>
        </tr>
        <tr>
          <td></td><td></td><td></td>
         <td class="name">
            <label>Balance:</label>
         </td>
         <td>
		 <td class="name">
            <label><b>${balance}</b></label>
          </td>
	      <td></td><td></td><td></td>
        </tr>
		        <tr>
          <td></td><td></td><td></td>
         <td class="name">
            <label>Date Created:</label>
         </td>
         <td>
		 <td class="name">
            <label><b><g:formatDate format="MM/dd/yyyy" date="${dateCreated}" /></b></label>
          </td>
	      <td></td><td></td><td></td>
        </tr>
      </table>
    </g:form>
  </body>
</html>
