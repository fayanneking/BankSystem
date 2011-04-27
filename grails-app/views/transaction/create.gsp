

<%@ page import="banksystem.Transaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
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
            <g:hasErrors bean="${transactionInstance}">
            <div class="errors">
                <g:renderErrors bean="${transactionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
		<input type="hidden" name="cName" value="${cName}">
      		<input type="hidden" name="aName" value="${aName}">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="teller"><g:message code="transaction.teller.label" default="Teller" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'teller', 'errors')}">
                                    <g:select name="teller.id" from="${banksystem.Teller.list()}" optionKey="id" value="${transactionInstance?.teller?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="atm"><g:message code="transaction.atm.label" default="Atm" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'atm', 'errors')}">
                                    <g:select name="atm.id" from="${banksystem.ATM.list()}" optionKey="id" value="${transactionInstance?.atm?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="srcAccount"><g:message code="transaction.srcAccount.label" default="Src Account" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'srcAccount', 'errors')}">
                                    <g:select name="srcAccount.id" from="${banksystem.BankAccount.list()}" optionKey="id" value="${transactionInstance?.srcAccount?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="srcBank"><g:message code="transaction.srcBank.label" default="Src Bank" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'srcBank', 'errors')}">
                                    <g:select name="srcBank.id" from="${banksystem.Bank.list()}" optionKey="id" value="${transactionInstance?.srcBank?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="transactionDate"><g:message code="transaction.transactionDate.label" default="Transaction Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'transactionDate', 'errors')}">
                                    <g:datePicker name="transactionDate" precision="day" value="${transactionInstance?.transactionDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="destAccount"><g:message code="transaction.destAccount.label" default="Dest Account" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'destAccount', 'errors')}">
                                    <g:select name="destAccount.id" from="${banksystem.BankAccount.list()}" optionKey="id" value="${transactionInstance?.destAccount?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="destBank"><g:message code="transaction.destBank.label" default="Dest Bank" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'destBank', 'errors')}">
                                    <g:select name="destBank.id" from="${banksystem.Bank.list()}" optionKey="id" value="${transactionInstance?.destBank?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="transactionAmount"><g:message code="transaction.transactionAmount.label" default="Transaction Amount" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'transactionAmount', 'errors')}">
                                    <g:textField name="transactionAmount" value="${fieldValue(bean: transactionInstance, field: 'transactionAmount')}" />
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
