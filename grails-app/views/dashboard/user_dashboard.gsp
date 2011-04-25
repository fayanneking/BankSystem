<%@ page import="banksystem.DashboardController" %>
<html>
  <head>
    <title>Teller - Dashboard</title>
    <meta name="layout" content="main" />
    <style type="text/css" media="screen">
        p {
	    margin-top:50px;
	    text-align:center;
	    font-size:15px;
        }
	.menuButton {
		font-size:13px;
	}
    </style>
  </head>
  <body>
    <div class="nav" style="font-size:15px">
        <span class="menuButton">
          <a class="home" href="${resource(dir:'')}">Home</a>
        </span>
        <span class="menuButton">
          <g:link class="create" controller="teller" action="createAccount" id="${id}">
            Create Bank Account
          </g:link>
        </span>
        <span class="menuButton">
          <g:link class="delete" controller="teller" action="removeAccount" id="${id}">
            Remove Bank Account
          </g:link>
        </span>
        <span class="menuButton">
          <g:link class="transact" controller="teller" action="transact" id="${id}">
            Transact with Bank Account
          </g:link>
        </span>
	<span class="menuButton">
          <g:link controller="bankAccount" action="list" params="[id:id, name: name, type: type]">
            View My Personal Accounts
          </g:link>
        </span>
    </div>
    <div id="pageBody" style="margin-right:280px;margin-left:280px;font-size:15px;">
		
      <p>What do you want to do? Let the navigation buttons guide you.</p>
    </div>

  </body>
</html>
