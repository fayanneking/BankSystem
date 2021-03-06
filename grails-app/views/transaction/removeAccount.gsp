
<%@ page import="banksystem.Teller" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
		.menuButton {
			font-size:13px;
		}
    	</style>
        <title>Welcome to <g:message code="${tellerInstance?.bank?.name}" default="the Worldwide Bank System" /></title>
    </head>
    <body>
        <div class="nav">
			<g:if test="${type == 'teller'}">
				<g:render template="/dashboard/tellerNav" model="${[id:id, name:name, type:type]}" />
			</g:if>
			<g:else>
				<span class="menuButton">
				  <a class="home" href="${resource(dir:'')}">Home</a>
				</span>
			</g:else>
        </div>
        <div class="body">
            <h1>Remove An Account</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="deleteAccount" id="${id}">
		<input type="hidden" name="cName" value="${cName}">
      		<input type="hidden" name="aName" value="${aName}">
		<input type="hidden" name="type" value="${type}">
		<input type="hidden" name="name" value="{name}">
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountName">Account Name</label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="text" id="accountName" name="accountName" value="">
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pin">Pin</label>
                                </td>
                                <td valign="top" class="value">
                                    <input type="text" id="pin" name="pin" value="">
                                </td>
                            </tr>                      
			
			    <tr>
				<td valign="top">
				    <input type="submit" value="Remove Account" />
				</td>
			    </tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
