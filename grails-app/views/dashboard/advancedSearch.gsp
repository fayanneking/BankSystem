<%@ page import="banksystem.DashboardController" %>
<html>
  <head>
    <title>Teller - Dashboard</title>
    <meta name="layout" content="main" />
    <style type="text/css" media="screen">
	.menuButton {
		font-size:13px;
	}
	h1 {
	    margin-left:170px;
	    margin-top:30px;
	    font-size:1.5em;
	}
	td {
		text-align:center;
		font-size:15px;
		vertical-align:middle;
	}
	.textField {
		font-size:15px;
	}
	.button {
		font-size:15px;
		padding:5px;	
	}
	form {
		margin-left:150px;
		width:50%	
	}
    </style>
  </head>
  <body>
    <div class="nav" style="font-size:15px">
		<g:render template="tellerNav" model="${[id:id, name:name, type:type]}" />
    </div>
    <div id="pageBody" style="margin-right:280px;margin-left:280px;font-size:15px;">		
    	<h1>Advanced Search For Accounts</h1>
	<g:form action="advancedSearchProcessing" params="${[id:id, name:name, type:type]}">
	   <table>
	     <tr>
		<td class="name">
           		<label for="accountName">Account Name:</label>
          	</td>
	     	<td><g:textField class="textField" name="accountName" value="${params.accountName}" /></td>
	     </tr>
	     <tr>
		<td class="name">
           		<label for="fullName">Full Name:</label>
          	</td>
	     	<td><g:textField class="textField" name="fullName" value="${params.fullName}" /></td>
	     </tr>
	     <tr>
		<td class="name">
           		<label for="date">Date Created:</label>
          	</td>
	     	<td><g:datePicker formatDate="MM/dd/yyyy" name="date" value="${params.date}" precision="day" /></td>
	     </tr>
	     <tr>
	     	<td><g:submitButton class="button" name="search" value="Search"/></td>
	     </tr>
	   </table>
	</g:form>  
    </div>
  </body>
</html>
