

<%@ page import="banksystem.Teller" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'teller.label', default: 'Teller')}" />
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
            <g:hasErrors bean="${tellerInstance}">
            <div class="errors">
                <g:renderErrors bean="${tellerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${tellerInstance?.id}" />
                <g:hiddenField name="version" value="${tellerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="teller.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tellerInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${tellerInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="teller.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tellerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${tellerInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactNo"><g:message code="teller.contactNo.label" default="Contact No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tellerInstance, field: 'contactNo', 'errors')}">
                                    <g:textField name="contactNo" value="${tellerInstance?.contactNo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="transactions"><g:message code="teller.transactions.label" default="Transactions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tellerInstance, field: 'transactions', 'errors')}">
                                    
<ul>
<g:each in="${tellerInstance?.transactions?}" var="t">
    <li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="transaction" action="create" params="['teller.id': tellerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="teller.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tellerInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${tellerInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="teller.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tellerInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${tellerInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bank"><g:message code="teller.bank.label" default="Bank" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tellerInstance, field: 'bank', 'errors')}">
                                    <g:select name="bank.id" from="${banksystem.Bank.list()}" optionKey="id" value="${tellerInstance?.bank?.id}"  />
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
