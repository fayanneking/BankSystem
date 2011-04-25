		<span class="menuButton">
          <g:link controller="dashboard" action="dashboard" params="[id: id, name: name, type:'teller']">Home</g:link>
        </span>
        <span class="menuButton">
          <g:link class="create" controller="teller" action="createAccount" params="[id: id, name: name, type:'teller']">
            Create Bank Account
          </g:link>
        </span>
        <span class="menuButton">
          <g:link class="delete" controller="teller" action="removeAccount" params="[id: id, name: name, type:'teller']">
            Remove Bank Account
          </g:link>
        </span>
        <span class="menuButton">
          <g:link class="transact" controller="teller" action="transact" params="[id: id, name: name, type:'teller']">
            Transact with Bank Account
          </g:link>
        </span>
	<span class="menuButton">
          <g:link class="list" controller="bankAccount" action="list" params="[id: id, name: name, type:'teller']">
            View My Personal Accounts
          </g:link>
        </span>
	<span class="menuButton">
          <g:link controller="dashboard" action="updateAccount" params="[id: id, name: name, type:'teller']">
            Manage Online Account
          </g:link>
        </span>
