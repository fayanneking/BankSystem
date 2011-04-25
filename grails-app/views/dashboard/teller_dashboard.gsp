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
	    margin-left:140px;
	    margin-top:30px;
	    font-size:1.5em;
	}
	.textField {
		margin-left:75px;
		margin-top:20px;
		font-size:15px;
	}
	.button {
		margin-left:140px;
		font-size:15px;
		padding:5px;	
	}
	form {
		margin-top:20px;
	        margin-left:100px;
		width:50%	
	}
    </style>
  </head>
  <body>
    <div class="nav" style="font-size:15px">
		<g:render template="tellerNav" model="${[id:id, name:name, type:type]}" />
    </div>
    <div id="pageBody" style="margin-right:280px;margin-left:280px;font-size:15px;">		
    	<h1>Quick Search For Accounts</h1>
	<g:form action="quickSearch" params="${[id:id, name:name, type:type]}">
	   <table>
	     <tr>
	     	<td><g:textField class="textField" name="query" value="${params.query}" /></td>
	     </tr>
	     <tr>
	     	<td><g:submitButton class="button" name="search" value="Search"/></td>
	     </tr>
	   </table>
	</g:form>  
    </div>
  </body>
</html>
