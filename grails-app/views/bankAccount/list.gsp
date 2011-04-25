
<%@ page import="banksystem.BankAccount" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<style type="text/css" media="screen">
		
		table {
			margin-left:220px;
			margin-right:200px;
			text-align:center;
			font-size:15px;
		}
		.paginateButtons {
			margin-left:220px;
			margin-right:200px;
			text-align:center;
			width:99%;
		}
		.menuButton {
			font-size:13px;
		}
		td {
			 font-size:15px;
			 text-align:center;
		}
		input {
			 font: bold 15px/15px verdana, geneva, helvetica;
			 border: 2px solid #ccc;
		}
		h1 {
			text-align:center;
			margin-top:20px;
			margin-bottom:20px;
			margin-right:200px;
			margin-left:600px;
			font-size: 2.0em;
		}
		</style>
        <g:set var="entityName" value="${message(code: 'bankAccount.label', default: 'BankAccount')}" />
        <title>My Accounts</title>
    </head>
    <body>
        <div class="nav">
			<g:if test="${type == 'user'}">
				<g:render template="/dashboard/userNav" model="${[id:d, name:name, type:type]}" />
			</g:if>
			<g:elseif test="${type == 'teller'}">
				<g:render template="/dashboard/tellerNav" model="${[id:id, name:name, type:type]}" />
			</g:elseif>
			<g:elseif test="${type == 'bankManager'}">
				<g:render template="/dashboard/bankManagerNav" model="${[id:id, name:name, type:type]}" />
			</g:elseif>
			<g:elseif test="${type == 'bankOwner'}">
				<g:render template="/dashboard/bankOwnerNav" model="${[id:id, name:name, type:type]}" />
			</g:elseif>
			<g:elseif test="${type == 'systemAdministrator'}">
				<g:render template="/dashboard/systemAdminNav" model="${[id:id, name:name, type:type]}" />
			</g:elseif>
        </div>
        <div class="body">
            <h1>My Accounts</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="name" title="${message(code: 'bankAccount.name.label', default: 'Name')}" style="text-align:center;" />
                        
                            <g:sortableColumn property="pin" title="${message(code: 'bankAccount.pin.label', default: 'Pin')}" style="text-align:center;" />
                        
                            <g:sortableColumn property="balance" title="${message(code: 'bankAccount.balance.label', default: 'Balance')}" style="text-align:center;" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'bankAccount.dateCreated.label', default: 'Date Created')}" style="text-align:center;" />
                        
                            <th style="text-align:center;"><g:message code="bankAccount.bank.label" default="Bank"/></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bankAccountInstanceList}" status="i" var="bankAccountInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" params="${[userId: id, id: bankAccountInstance.id, name: name, type:type]}">${fieldValue(bean: bankAccountInstance, field: "name")}</g:link></td>
                        
                            <td>${fieldValue(bean: bankAccountInstance, field: "pin")}</td>
                        
                            <td>${fieldValue(bean: bankAccountInstance, field: "balance")}</td>
                        
                            <td><g:formatDate format="MM/dd/yyyy" date="${bankAccountInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: bankAccountInstance, field: "bank")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bankAccountInstanceTotal}"/>
            </div>
        </div>
    </body>
</html>
