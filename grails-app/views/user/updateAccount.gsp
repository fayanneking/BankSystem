

<%@ page import="banksystem.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
	<style type="text/css" media="screen">
		table {
			margin-left:400px;
			margin-right:auto;
			font-size:15px;
			width: 40%
		}
		.buttons {
			margin-left:400px;
			margin-right:200px;
			text-align:center;
			width: 40%;
		}
		.button {
			font-size:15px;
		}
		.menuButton {
			font-size:13px;
		}
		td {
			vertical-align:middle;
			 font-size:15px;
		}
		input {
			 font: bold 15px/15px verdana, geneva, helvetica;
			 border: 2px solid #ccc;
		}
		h1 {
			text-align:center;
			margin-top:20px;
			margin-bottom:20px;
			margin-right:300px;
			margin-left:400px;
			font-size: 2.0em;
		}
		</style>
        <title>Update User Account</title>
    </head>
    <body>
        <div class="nav">
            <g:if test="${type == 'user'}">
		<g:render template="/dashboard/userNav" model="${[id:userAccount?.id, name:userAccount?.name, type:type]}" />
	    </g:if>
	    <g:elseif test="${type == 'teller'}">
		<g:render template="/dashboard/tellerNav" model="${[id:userAccount?.id, name:userAccount?.name, type:type]}" />
	    </g:elseif>
	    <g:elseif test="${type == 'bankManager'}">
		<g:render template="/dashboard/bankManagerNav" model="${[id:userAccount?.id, name:userAccount?.name, type:type]}" />
	    </g:elseif>
	    <g:elseif test="${type == 'bankOwner'}">
		<g:render template="/dashboard/bankOwnerNav" model="${[id:userAccount?.id, name:userAccount?.name, type:type]}" />
	    </g:elseif>
	    <g:elseif test="${type == 'systemAdministrator'}">
		<g:render template="/dashboard/systemAdminNav" model="${[id:userAccount?.id, name:userAccount?.name, type:type]}" />
	    </g:elseif>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userAccount}">
            <div class="errors">
                <g:renderErrors bean="${userAccount}" as="list" />
            </div>
            </g:hasErrors>
	    <h1>Update User Account</h1>
            <g:form method="post" >
                <g:hiddenField name="id" value="${userAccount?.id}" />
		<g:hiddenField name="type" value="${type}" />
                <g:hiddenField name="version" value="${userAccount?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name">Full Name</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userAccount, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${userAccount?.name}" />
                                </td>
                            </tr>

			   <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email">Email Address</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userAccount, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${userAccount?.email}" />
                                </td>
                            </tr>                          

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactNo">Contact Number</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userAccount, field: 'contactNo', 'errors')}">
                                    <g:textField name="contactNo" value="${userAccount?.contactNo}" />
                                </td>
                            </tr>

			    <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username">Username</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userAccount, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${userAccount?.username}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password">Password</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userAccount, field: 'password', 'errors')}">
                                    <g:textField name="password" value="*******" />
                                </td>
                            </tr>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="updateUserAccount" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>                  
                </div>
            </g:form>
        </div>
    </body>
</html>
