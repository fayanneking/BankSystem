

<%@ page import="banksystem.BankAccount" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bankAccount.label', default: 'BankAccount')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bankAccountInstance}">
            <div class="errors">
                <g:renderErrors bean="${bankAccountInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="bankAccount.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankAccountInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${bankAccountInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pin"><g:message code="bankAccount.pin.label" default="Pin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankAccountInstance, field: 'pin', 'errors')}">
                                    <g:textField name="pin" value="${bankAccountInstance?.pin}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="balance"><g:message code="bankAccount.balance.label" default="Balance" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankAccountInstance, field: 'balance', 'errors')}">
                                    <g:textField name="balance" value="${fieldValue(bean: bankAccountInstance, field: 'balance')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bank"><g:message code="bankAccount.bank.label" default="Bank" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankAccountInstance, field: 'bank', 'errors')}">
                                    <g:select name="bank.id" from="${banksystem.Bank.list()}" optionKey="id" value="${bankAccountInstance?.bank?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="owner"><g:message code="bankAccount.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankAccountInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${banksystem.User.list()}" optionKey="id" value="${bankAccountInstance?.owner?.id}"  />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
