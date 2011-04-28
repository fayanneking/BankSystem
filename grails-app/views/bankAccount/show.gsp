
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
			width: 50%
		}
		.buttons {
			margin-left:400px;
			margin-right:auto;
			text-align:center;
			width:50%;
		}
		.menuButton {
			font-size:13px;
		}
		td {
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
			margin-right:auto;
			margin-left:400px;
			font-size: 2.0em;
		}
		</style>
        <g:set var="entityName" value="${message(code: 'bankAccount.label', default: 'BankAccount')}" />
        <title>Account Details</title>
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
			<h1>Account Details</h1>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="bankAccount.name.label" default="Account Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bankAccountInstance, field: "name")}</td>
                         
                        </tr>
                    
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="bankAccount.pin.label" default="Pin" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bankAccountInstance, field: "pin")}
							
					<g:form><g:actionSubmit class="edit" action="edit" value='Update Pin' />	
					<g:hiddenField name="id" value="${bankAccountInstance?.id}" />
					<g:hiddenField name="userId" value="${userId}" />						
					<g:hiddenField name="name" value="${name}" />							
					<g:hiddenField name="type" value="${type}" />
					</g:form>
			   </td>                       
                    
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="bankAccount.balance.label" default="Balance" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bankAccountInstance, field: "balance")}</td>
                        
                        </tr>
                    
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="bankAccount.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM/dd/yyyy" date="${bankAccountInstance?.dateCreated}" /></td>
                          
                        </tr>
                    
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="bankAccount.bank.label" default="Bank" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bankAccountInstance, field: "bank")}</td>
                      
                        </tr>
                    
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="bankAccount.owner.label" default="Owner" /></td>
                            
                            <td valign="top" class="value">${bankAccountInstance?.owner?.encodeAsHTML()}</td>
                          
                        </tr>
					
                        <tr class="prop">
						
                            <td valign="top" class="name"><g:message code="bankAccount.transactionList.label" default="Show Transaction Record" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${bankAccountInstance.transactionList}" var="t">
                                    <li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                        
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${bankAccountInstance?.id}" />
					<g:hiddenField name="name" value="${name}" />
					<g:hiddenField name="type" value="${type}" />
					<g:hiddenField name="userId" value="${userId}" />
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
