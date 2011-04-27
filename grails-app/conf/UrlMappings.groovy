class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')

		"/$bank?/visit" {
			controller = 'visitBank'
			action = 'transactWithBank'
			params = {params}
		}
		
		"/$bank?/transact" {
			controller = 'visitBank'
			action = 'visitBank'
			params = {params}
		}
		
		"/$bank?/transact/ATM" {
			controller = 'visitBank'
			action = 'transactWithATM'
			params = {params}
		}

		"/$bank?/transact/teller" {
			controller = 'visitBank'
			action = 'transactWithTeller'
			params = {params}
		}

		"/$bank?/transaction/$action?" {
			controller = "transaction"
		}

		"/dashboard/loggedIn" {
			controller = "dashboard"
			action = "getUser"
		}

		"/dashboard/$user?" {
			controller = "dashboard"
			action = "dashboard"
		}
		
		"/dashboard/$user?/$action?" {
			controller = dashboard
		}
		
		"/dashboard/$user?/$name?/myAccounts" {
			controller = 'bankAccount'
			action = 'list'
			params = {params}
		}
	}
}
