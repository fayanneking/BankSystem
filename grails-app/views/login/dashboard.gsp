<%@ page import="banksystem.DashboardController" %>
<html>
            <g:if test="${type == 'user'}">
		<g:render template="/dashboard/userDashboard" model="${[id:id, name:name, type:type]}" />
	    </g:if>
	    <g:elseif test="${type == 'teller'}">
		<g:render template="/dashboard/tellerDashboard" model="${[id:id, name:name, type:type]}" />
	    </g:elseif>
	    <g:elseif test="${type == 'bankManager'}">
		<g:render template="/dashboard/bankManagerDashboard" model="${[id:id, name:name, type:type]}" />
	    </g:elseif>
	    <g:elseif test="${type == 'bankOwner'}">
		<g:render template="/dashboard/bankOwnerDashboard" model="${[id:id, name:name, type:type]}" />
	    </g:elseif>
	    <g:elseif test="${type == 'systemAdministrator'}">
		<g:render template="/dashboard/systemAdminDashboard" model="${[id:id, name:name, type:type]}" />
	    </g:elseif>
</html>


