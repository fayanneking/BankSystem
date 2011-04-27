
<%@ page import="banksystem.LoginController" %>
<html>
  <head>
    <title>Redirecting to Dashboard...</title>
    <meta name="layout" content="main" />
    <style type="text/css" media="screen">	
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
		<span class="menuButton">
			<a class="home" href="${resource(dir:'')}">Home</a>
		</span>
    </div>
    <div id="options">
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
    </g:if>
	<g:form action="${postUrl}" method='POST' class='cssform'>
					<input type="hidden" name="j_username" value="${j_username}">
					<input type="hidden" name="j_password" value="${j_password}">
					<input type="hidden" name="remember_me" value="${remember_me}">
					<input type="hidden" name="postUrl" value="${postUrl}">
					<input type='hidden' name='spring-security-redirect' value='${params['spring-security-redirect']}'/>
				<p>
					<input type='submit' value="Click button to continue..." />
				</p>
	</g:form>
    </div>
  </body>
</html>
