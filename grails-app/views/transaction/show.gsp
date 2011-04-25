
<%@ page import="banksystem.Transaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transaction.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transaction.teller.label" default="Teller" /></td>
                            
                            <td valign="top" class="value"><g:link controller="teller" action="show" id="${transactionInstance?.teller?.id}">${transactionInstance?.teller?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transaction.atm.label" default="Atm" /></td>
                            
                            <td valign="top" class="value"><g:link controller="ATM" action="show" id="${transactionInstance?.atm?.id}">${transactionInstance?.atm?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transaction.srcAccount.label" default="Src Account" /></td>
                            
                            <td valign="top" class="value"><g:link controller="bankAccount" action="show" id="${transactionInstance?.srcAccount?.id}">${transactionInstance?.srcAccount?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transaction.srcBank.label" default="Src Bank" /></td>
                            
                            <td valign="top" class="value"><g:link controller="bank" action="show" id="${transactionInstance?.srcBank?.id}">${transactionInstance?.srcBank?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transaction.transactionDate.label" default="Transaction Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${transactionInstance?.transactionDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transaction.destAccount.label" default="Dest Account" /></td>
                            
                            <td valign="top" class="value"><g:link controller="bankAccount" action="show" id="${transactionInstance?.destAccount?.id}">${transactionInstance?.destAccount?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transaction.destBank.label" default="Dest Bank" /></td>
                            
                            <td valign="top" class="value"><g:link controller="bank" action="show" id="${transactionInstance?.destBank?.id}">${transactionInstance?.destBank?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="transaction.transactionAmount.label" default="Transaction Amount" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: transactionInstance, field: "transactionAmount")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${transactionInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
