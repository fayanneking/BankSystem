

<%@ page import="banksystem.Bank" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bank.label', default: 'Bank')}" />
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
            <g:hasErrors bean="${bankInstance}">
            <div class="errors">
                <g:renderErrors bean="${bankInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
