class UrlMappings {

	static mappings = {

		"/login/verified" {
			controller = "login"
			action = "getUser"
		}

		"/visit/$bank?" {
			controller = 'visitBank'
			action = 'transactWithBank'
			params = {params}
		}
		
		"/transact/$bank?" {
			controller = 'visitBank'
			action = 'visitBank'
			params = {params}
		}
		
		"/transact/$bank/ATM?" {
			controller = 'visitBank'
			action = 'transactWithATM'
			params = {params}
		}

		"/transact/$bank/teller?" {
			controller = 'visitBank'
			action = 'transactWithTeller'
			params = {params}
		}

		"/dashboard/$name?" {
			controller = "login"
			action = "dashboard"
			params = {params}
		}
		
		"/dashboard/$name?/myAccounts" {
			controller = 'bankAccount'
			action = 'list'
			params = {params}
		}

		"/dashboard/$user?/manageAccount" {
			controller = 'user'
			action = 'updateAccount'
			params = {params}
		}

		"/logout" {
			controller = 'login'
			action = 'logout'		
		}

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
