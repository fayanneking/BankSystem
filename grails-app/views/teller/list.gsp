
<%@ page import="banksystem.Teller" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'teller.label', default: 'Teller')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'teller.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'teller.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'teller.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="contactNo" title="${message(code: 'teller.contactNo.label', default: 'Contact No')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'teller.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'teller.password.label', default: 'Password')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tellerInstanceList}" status="i" var="tellerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tellerInstance.id}">${fieldValue(bean: tellerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: tellerInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: tellerInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: tellerInstance, field: "contactNo")}</td>
                        
                            <td>${fieldValue(bean: tellerInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: tellerInstance, field: "password")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tellerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
