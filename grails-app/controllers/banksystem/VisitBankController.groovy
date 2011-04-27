package banksystem

class VisitBankController {

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

	def transactWithTeller = {
		def tellerInstance = Teller.get(params.id)
		def name = tellerInstance?.name
		def bank = tellerInstance?.bank
		def cName = 'visitBank'
		def aName = 'transactWithTeller'
		[tellerId:params.id, bank:bank, bankId:bank.id, type:params.type, name:name, cName:cName, aName:aName]
   	}

	def transactWithATM = {
		def ATMInstance = ATM.get(params.id)
		def name = ATMInstance?.name
		def bank = ATMInstance?.bank
		def cName = 'visitBank'
		def aName = 'transactWithTeller'
		[bankId:bankId, bank:bank, bankId:bank.id, type:params.type, name:name, cName:cName, aName:aName]
   	}
}
