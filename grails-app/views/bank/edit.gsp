

<%@ page import="banksystem.Bank" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bank.label', default: 'Bank')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bankInstance}">
            <div class="errors">
                <g:renderErrors bean="${bankInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${bankInstance?.id}" />
                <g:hiddenField name="version" value="${bankInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="bank.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${bankInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="location"><g:message code="bank.location.label" default="Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'location', 'errors')}">
                                    <g:textField name="location" value="${bankInstance?.location}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="website"><g:message code="bank.website.label" default="Website" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${bankInstance?.website}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bankAccounts"><g:message code="bank.bankAccounts.label" default="Bank Accounts" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'bankAccounts', 'errors')}">
                                    
<ul>
<g:each in="${bankInstance?.bankAccounts?}" var="b">
    <li><g:link controller="bankAccount" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="bankAccount" action="create" params="['bank.id': bankInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'bankAccount.label', default: 'BankAccount')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tellers"><g:message code="bank.tellers.label" default="Tellers" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'tellers', 'errors')}">
                                    
<ul>
<g:each in="${bankInstance?.tellers?}" var="t">
    <li><g:link controller="teller" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="teller" action="create" params="['bank.id': bankInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'teller.label', default: 'Teller')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="atms"><g:message code="bank.atms.label" default="Atms" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'atms', 'errors')}">
                                    
<ul>
<g:each in="${bankInstance?.atms?}" var="a">
    <li><g:link controller="ATM" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="ATM" action="create" params="['bank.id': bankInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ATM.label', default: 'ATM')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bankOwner"><g:message code="bank.bankOwner.label" default="Bank Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankInstance, field: 'bankOwner', 'errors')}">
                                    <g:select name="bankOwner.id" from="${banksystem.BankOwner.list()}" optionKey="id" value="${bankInstance?.bankOwner?.id}"  />
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
