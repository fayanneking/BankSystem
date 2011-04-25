package banksystem

class DashboardController {
	
    def index = { }
	
	def visitBank = {
	}
	
	def validateBank = {
		def bank = Bank.findByName(params.bank)
		if(bank && bank.location == params.location) {
			render(view:'transactWithBank', model:[bank:bank])
		}
		else {
			flash.message = "Bank does not exist in specified location."
			render(view:'visitBank')
		}
	}
	
    def logout = { 
        session.user = null 
        redirect(url:resource(dir:''))
    }
	
    def login = {
        if (params.cName)
            return [cName:params.cName, aName:params.aName]      
    }

    def validate = {
		def user = User.findByUsername(params.username)
		if(user && user.password == params.password) {
			session.user = user
	        redirect(action:"determineType", params:[id : user.id, name: user.name])
        }
        else {
          flash.message = "Invalid username and password."
          render(view:'login')
        }
	
	}
	
	def determineType = {
		def type
		def sysAd = SystemAdministrator.get(params.id)		
		if(!sysAd) {
			def bankOwner = BankOwner.findByName(params.name)
			if(!bankOwner) {
				def bankManager = BankManager.findByName(params.name) 
				if(!bankManager) {
					def teller = Teller.findByName(params.name)
					if(!teller)
						type='user'
					else 
						type='teller'
				}
				else
					type='bankManager'
			}
			else
				type='bankOwner'
		}
		else
			type='systemAdministrator'
		redirect(action:"dashboard", params:[id:params.id, name:params.name, type:type])
	}
 
    def dashboard = {
		def theDashboard
		if(params.type=='user') {
			theDashboard = 'user_dashboard'
		}
		else if(params.type=='teller') {
			theDashboard = 'teller_dashboard'
		}
		else if(params.type=='bankManager') {
			theDashboard= 'bankManager_dashboard'
		}
		else if(params.type=='bankOwner') {
			theDashboard = 'bankOwner_dashboard'
		}
		else if(params.type=='systemAdministrator') {
			theDashboard = 'systemAdmin_dashboard'
		}
		render(view: theDashboard, model: [id: params.id, name: params.name, type: params.type])
    }
	
	def signUp = {
        if (params.cName)
            return [cName:params.cName, aName:params.aName]      
    }
	
    def validateAccount = {
    	def account = BankAccount.findByOwner(params.accountName)
		if( account && account.pin == params.pin ) {
			def user = account.owner
			if( user.username != null ) {
				flash.message = "User has already registered for online transactions."
				render(view:'signUp')
			}
			else if( User.findByUsername(params.username) ) {
				flash.message = "Sorry. Username already taken."
				render(view:'signUp')
			}
			else {
				user.setUsername(params.username)	
				user.setPassword(params.password)
				session.user = user
				redirect(action:"dashboard", params:[id : user.id, name:user.name, type:'user'])
			}
		}
		else {
			flash.message = "Invalid account name and/or pin."
			render(view:'signUp')
		}
    }

    def updateAccount = {
	def userAccount = User.findByName(params.name)
	if(userAccount)
		[userAccount:userAccount, type:params.type]
	else {
		flash.message("User does not exist.")
		redirect(action:"dashboard", params:[id: params.id, name:params.name, type:params.type])
	}
    }

    def updateUserAccount = {
	def userInstance = User.get(params.id)
        if (params.version) {
           def version = params.version.toLong()
           if (userInstance.version > version) {                    
           	userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
		render(view:"updateAccount", model:[userAccount:userInstance, type:params.type])             
                return
           }
         }
         userInstance.properties = params
         if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
         	flash.message = "Your account details have been updated."
		render(view:"updateAccount", model:[userAccount:userInstance, type:params.type])
         }
         else {
	       flash.message = "Update unsuccessful"
               render(view:"updateAccount", model:[userAccount:userInstance, type:params.type])
         }
    }

    def quickSearch = {
	def query = params.query
	if(!query) {
		redirect(action:"dashboard", params:params)
	}	
	try {
		def searchResults = BankAccount.search(query)
		render(view:'searchResults', model: [searchResults: searchResults, userId:params.id, name:params.name, type:params.type])
	}
	catch(e) {
		flash.message = "Search Error."
		redirect(action:"dashboard", params:params)
	}
    }

    def advancedSearch = {
	[id:params.id, name:params.name, type:params.type]	
    }

    def advancedSearchProcessing = {
    	def accountName = params.accountName
	def fullName = params.fullName
	def date = params.date
	
	try {
		def searchResults1
		def searchResults2
		def searchResults3

		if(accountName) 
			searchResults1 = BankAccount.search(accountName)
		if(fullName) 
			searchResults2 = BankAccount.search(fullName) 
		if(date)
			searchResults3 = BankAccount.search(date) 
		
		for( result in searchResults2
		render(view:'searchResults', model: [searchResults: searchResults, userId:params.id, name:params.name, type:params.type])
	}
	catch(e) {
		flash.message = "Search Error."
		redirect(action:"dashboard", params:params)
	}
    }
}
