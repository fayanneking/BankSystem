
<%@ page import="banksystem.Transaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'transaction.id.label', default: 'Id')}" />
                        
                            <th><g:message code="transaction.teller.label" default="Teller" /></th>
                        
                            <th><g:message code="transaction.atm.label" default="Atm" /></th>
                        
                            <th><g:message code="transaction.srcAccount.label" default="Src Account" /></th>
                        
                            <th><g:message code="transaction.srcBank.label" default="Src Bank" /></th>
                        
                            <g:sortableColumn property="transactionDate" title="${message(code: 'transaction.transactionDate.label', default: 'Transaction Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: transactionInstance, field: "teller")}</td>
                        
                            <td>${fieldValue(bean: transactionInstance, field: "atm")}</td>
                        
                            <td>${fieldValue(bean: transactionInstance, field: "srcAccount")}</td>
                        
                            <td>${fieldValue(bean: transactionInstance, field: "srcBank")}</td>
                        
                            <td><g:formatDate date="${transactionInstance.transactionDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${transactionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
