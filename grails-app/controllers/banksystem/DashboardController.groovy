package banksystem

class DashboardController {

	def springSecurityService
	
    	def index = { }

	def getUser = {
		def user = User.get(springSecurityService.principal.id)
		redirect(action:'determineType', params:[id: user.id, name: user.name])
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
		
		render(view:'searchResults', model: [searchResults: searchResults, userId:params.id, name:params.name, type:params.type])
	}
	catch(e) {
		flash.message = "Search Error."
		redirect(action:"dashboard", params:params)
	}
    }
}
