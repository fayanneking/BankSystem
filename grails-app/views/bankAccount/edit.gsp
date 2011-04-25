

<%@ page import="banksystem.BankAccount" %>
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
        <g:set var="entityName" value="${message(code: 'bankAccount.label', default: 'BankAccount')}" />
        <title>Update Pin</title>
    </head>
    <body>
        <div class="nav">
			<g:if test="${type == 'user'}">
				<g:render template="/dashboard/userNav" model="${[id:userId, name:name, type:type]}" />
			</g:if>
			<g:elseif test="${type == 'teller'}">
				<g:render template="/dashboard/tellerNav" model="${[id:userId, name:name, type:type]}" />
			</g:elseif>
			<g:elseif test="${type == 'bankManager'}">
				<g:render template="/dashboard/bankManagerNav" model="${[id:userId, name:name, type:type]}" />
			</g:elseif>
			<g:elseif test="${type == 'bankOwner'}">
				<g:render template="/dashboard/bankOwnerNav" model="${[id:userId, name:name, type:type]}" />
			</g:elseif>
			<g:elseif test="${type == 'systemAdministrator'}">
				<g:render template="/dashboard/systemAdminNav" model="${[id:userId, name:name, type:type]}" />
			</g:elseif>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bankAccountInstance}">
            <div class="errors">
                <g:renderErrors bean="${bankAccountInstance}" as="list" />
            </div>
            </g:hasErrors>
			<h1>Update Pin</h1>
            <g:form method="post" >
                <g:hiddenField name="id" value="${bankAccountInstance?.id}" />
				<g:hiddenField name="name" value ="${name}" />
				<g:hiddenField name="userId" value ="${userId}" />
				<g:hiddenField name="type" value ="${type}" />
                <g:hiddenField name="version" value="${bankAccountInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
						<tr class="prop">
						
                            <td valign="top" class="name">Account Name</td>
                            
                            <td valign="top" class="value">${bankAccountInstance?.name}</td>
                          
                        </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pin"><g:message code="bankAccount.pin.label" default="Pin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankAccountInstance, field: 'pin', 'errors')}">
                                    <g:textField name="pin" value="${bankAccountInstance?.pin}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
