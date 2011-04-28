package banksystem

class SearchController {
	
    def index = { }

    def quickSearch = {
	def query = params.query
	if(!query) {
		redirect(controller: "login", action:"dashboard", params:params)
	}	
	try {
		def searchResults = BankAccount.search(query)
		render(view:'searchResults', model: [searchResults: searchResults, userId:params.id, name:params.name, type:params.type])
	}
	catch(e) {
		flash.message = "Search Error."
		redirect(controller: "login", action:"dashboard", params:params)
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
		redirect(controller: "login", action:"dashboard", params:params)
	}
    }
}
