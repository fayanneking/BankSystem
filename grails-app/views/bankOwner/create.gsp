

<%@ page import="banksystem.BankOwner" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bankOwner.label', default: 'BankOwner')}" />
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
            <g:hasErrors bean="${bankOwnerInstance}">
            <div class="errors">
                <g:renderErrors bean="${bankOwnerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="bankOwner.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankOwnerInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${bankOwnerInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="bankOwner.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankOwnerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${bankOwnerInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contactNo"><g:message code="bankOwner.contactNo.label" default="Contact No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankOwnerInstance, field: 'contactNo', 'errors')}">
                                    <g:textField name="contactNo" value="${bankOwnerInstance?.contactNo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bank"><g:message code="bankOwner.bank.label" default="Bank" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankOwnerInstance, field: 'bank', 'errors')}">
                                    <g:select name="bank.id" from="${banksystem.Bank.list()}" optionKey="id" value="${bankOwnerInstance?.bank?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="bankOwner.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankOwnerInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${bankOwnerInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="bankOwner.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bankOwnerInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${bankOwnerInstance?.password}" />
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
