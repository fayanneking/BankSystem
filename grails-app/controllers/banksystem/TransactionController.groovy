package banksystem

class TransactionController {

    def transactionService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [transactionInstanceList: Transaction.list(params), transactionInstanceTotal: Transaction.count()]
    }

    def create = {
        def transactionInstance = new Transaction()
        transactionInstance.properties = params
        return [transactionInstance: transactionInstance]
    }

    def save = {
        def transactionInstance = new Transaction(params)
        if (transactionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'transaction.label', default: 'Transaction'), transactionInstance.id])}"
            redirect(action: "show", id: transactionInstance.id)
        }
        else {
            render(view: "create", model: [transactionInstance: transactionInstance])
        }
    }

    def show = {
        def transactionInstance = Transaction.get(params.id)
        if (!transactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            [transactionInstance: transactionInstance]
        }
    }

    def edit = {
        def transactionInstance = Transaction.get(params.id)
        if (!transactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [transactionInstance: transactionInstance]
        }
    }

    def update = {
        def transactionInstance = Transaction.get(params.id)
        if (transactionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (transactionInstance.version > version) {
                    
                    transactionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'transaction.label', default: 'Transaction')] as Object[], "Another user has updated this Transaction while you were editing")
                    render(view: "edit", model: [transactionInstance: transactionInstance])
                    return
                }
            }
            transactionInstance.properties = params
            if (!transactionInstance.hasErrors() && transactionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'transaction.label', default: 'Transaction'), transactionInstance.id])}"
                redirect(action: "show", id: transactionInstance.id)
            }
            else {
                render(view: "edit", model: [transactionInstance: transactionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def transactionInstance = Transaction.get(params.id)
        if (transactionInstance) {
            try {
                transactionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
            redirect(action: "list")
        }
    }

    def getBalance = {
	def bank = Bank.get(params.id)
	[bank:bank, bankId:bank?.id, type:params.type]
    }
	
    def withdraw = {
	def bank = Bank.get(params.id)
	[bank:bank, bankId:bank?.id, type:params.type]
    }

    def deposit = {
	def bank = Bank.get(params.id)
	[bank:bank, bankId:bank?.id, type:params.type]
    }

    def transfer = {
	def bank = Bank.get(params.id)
	[bank:bank, bankId:bank?.id, type:params.type]
    }
	
	def accountBalance = {
		def account = transactionService.findAccountByNameAndPin(params.accountName, params.pin, params.id )
		def bank = Bank.get(params.id)
		if(account) {
			[bank:bank.name, bankId:params.id, accountName:params.accountName, pin:params.pin, balance:account.balance, dateCreated:account.dateCreated, type:params.type]
		}
		else {
			flash.message = "Account does not exist."
			render(view:'getBalance', model:[bank:bank.name, bankId:params.id, type:params.type])
		}
	}
	
	def withdrawFromAccount = {
		def bank = Bank.get(params.id)
		def account = transactionService.findAccountByNameAndPin(params.accountName, params.pin, params.id )
		if(account) {
			def successful = transactionService.withdraw(account, params.amount)
			if(successful) {
				flash.message = "Successfully withdrew ${params.amount} pesos from ${params.accountName}."
				render(view:'accountBalance', model: [bankId:params.id, accountName:params.accountName, pin:params.pin, balance:account.balance, dateCreated:account.dateCreated, type:params.type])
			}
			else {
				flash.message = "Not enough funds."
				render(view:'withdraw', model:[bank:bank.name, bankId:params.id, type:params.type])				
			}
		}
		else {
			flash.message = "Failed to withdraw from account. Please check input details."
			render(view:'withdraw', model:[bank:bank.name, bankId:params.id, type:params.type])	
		}			
	}
	
	def depositToAccount = {
		def bank = Bank.get(params.id)
		def account = transactionService.findAccountByName(params.accountName, params.id)
		if(account) {
			transactionService.deposit(account, params.amount)
			flash.message = "Successfully deposited ${params.amount} pesos to ${params.accountName}."
			render(view:'accountBalance', model: [bank:bank.name, bankId:params.id, accountName:params.accountName, pin:"****", balance:account.balance, dateCreated:account.dateCreated, type:params.type])
		}
		else {
			flash.message = "Account does not exist. Please check input details."
			render(view:'deposit', model:[bank:bank.name, bankId:params.id, type:params.type])		
		}		
	}
	
	def transferToAccount = {
		def bank = Bank.get(params.id)
		def destBankName = params.destBank
		def srcAccount = transactionService.findAccountByNameAndPin(params.srcAccountName, params.pin, params.id)
		def destAccount
		if( !destBankName || destBankName == "" ) {
			destAccount = transactionService.findAccountByName(params.destAccountName, params.id)		
		}
		else {
			def destBankId = Bank.findByName(destBankName)?.id
			destAccount = transactionService.findAccountByName(params.destAccountName, destBankId)
		}
		if(srcAccount && destAccount) {
			def successful = transactionService.transfer(srcAccount, destAccount, params.amount)
			if(successful) {
				flash.message = "Successfully transferred ${params.amount} pesos from ${params.srcAccountName} to ${params.destAccountName}."
				render(view:'accountBalance', model: [bank:bank.name, bankId:params.id, accountName:params.srcAccountName, pin:params.pin, balance:srcAccount.balance, dateCreated:srcAccount.dateCreated, type:params.type])
			}
			else {
				flash.message = "Not enough funds. Failed to transfer ${params.amount} pesos from ${params.srcAccountName} to ${params.destAccountName}."
				render(view:'transfer', model:[bank:bank.name, bankId:params.id, type:params.type])
			}
		}
		else {
			flash.message = "Account/s do not exist. Please check input details."
			render(view:'transfer', model:[bank:bank.name, bankId:params.id, type:params.type])
		}
	}
	
	def createAccount = {
		def tellerInstance = Teller.get(params.id)
		def bank = tellerInstance?.bank
		[bank:bank.name, id:tellerInstance?.id, name:tellerInstance?.name, type:params.type, cName:params.cName, aName:params.aName]
	}

	def removeAccount = {
		def tellerInstance = Teller.get(params.id)
		def bank = tellerInstance?.bank
		[bank:bank.name, id:tellerInstance?.id, name:tellerInstance?.name, type:params.type, cName:params.cName, aName:params.aName]
	}
	
	def saveAccount = {
		def tellerInstance = Teller.get(params.id)
		def isSuccessful = transactionService.createAccount(params.accountName,params.pin,params.initBal,params.applicantName,params.contactNo,params.email,params.username, params.password,tellerInstance)
		if(isSuccessful) {
			flash.message="Account created successfully!"
			redirect(controller: params.cName, action: params.cName, params: params)
		}
		else {
			flash.message = "Failed to create account"
			redirect(action: "createAccount", params: params)
		}
		
	}
	
	def deleteAccount = {
		def tellerInstance = Teller.get(params.id)
		if( transactionService.removeAccount(params.accountName,params.pin,tellerInstance) ) {
			flash.message = "${params.accountName} successfully deleted."
			redirect(controller: params.cName, action: params.cName, params: params)
		}
		else {
			flash.message = "Failed to delete account. Please check input details."
			redirect(action: "removeAccount", params:params)
		}
	}
}
