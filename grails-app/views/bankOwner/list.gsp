
<%@ page import="banksystem.BankOwner" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bankOwner.label', default: 'BankOwner')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'bankOwner.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'bankOwner.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'bankOwner.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="contactNo" title="${message(code: 'bankOwner.contactNo.label', default: 'Contact No')}" />
                        
                            <th><g:message code="bankOwner.bank.label" default="Bank" /></th>
                        
                            <g:sortableColumn property="username" title="${message(code: 'bankOwner.username.label', default: 'Username')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bankOwnerInstanceList}" status="i" var="bankOwnerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bankOwnerInstance.id}">${fieldValue(bean: bankOwnerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bankOwnerInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: bankOwnerInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: bankOwnerInstance, field: "contactNo")}</td>
                        
                            <td>${fieldValue(bean: bankOwnerInstance, field: "bank")}</td>
                        
                            <td>${fieldValue(bean: bankOwnerInstance, field: "username")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bankOwnerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
