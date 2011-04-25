
<%@ page import="banksystem.BankManager" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bankManager.label', default: 'BankManager')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'bankManager.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'bankManager.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'bankManager.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="contactNo" title="${message(code: 'bankManager.contactNo.label', default: 'Contact No')}" />
                        
                            <th><g:message code="bankManager.bank.label" default="Bank" /></th>
                        
                            <g:sortableColumn property="username" title="${message(code: 'bankManager.username.label', default: 'Username')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bankManagerInstanceList}" status="i" var="bankManagerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bankManagerInstance.id}">${fieldValue(bean: bankManagerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bankManagerInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: bankManagerInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: bankManagerInstance, field: "contactNo")}</td>
                        
                            <td>${fieldValue(bean: bankManagerInstance, field: "bank")}</td>
                        
                            <td>${fieldValue(bean: bankManagerInstance, field: "username")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bankManagerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
