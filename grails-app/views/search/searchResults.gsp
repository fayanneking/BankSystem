<%@ page import="banksystem.BankAccount" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <style type="text/css" media="screen">
	.menuButton {
		font-size:13px;
	}
	h1 {
	    font-size:1.5em;
	    margin-left:auto;
	    margin-right:auto;
	    margin-top:20px;
	}
	h3 {
	    font-size:15px;
	    margin-left:auto;
	    margin-right:auto;
	    margin-top:20px;
	}
	li {
	    font-size:15px;
	    margin-left:auto;
	    margin-right:auto;
	}
    </style>
    <title>Search Results</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton">
        <g:render template="/dashboard/tellerNav" model="${[id:id, name:name, type:type]}" />
      </span>
    </div>
    <div class="body">
      <h1>Search Results</h1>
        <ul>
          <g:if test="${searchResults.results}">
            <g:each var="result" in="${searchResults.results}">
              <li>
                <g:link controller="bankAccount" action="show" params="${[id: result.id, userId: userId, name: name, type: type]}">${result}</g:link>
              </li>
            </g:each>
          </g:if>
          <g:else>
            <h3>No Matching Results Found</h3>
          </g:else>
        </ul>
      </div>
    </div>
  </body>
</html>
