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
		[bankId:params.id]
    }
	
    def withdraw = {
		[bankId:params.id]
    }

    def deposit = {
		[bankId:params.id]
    }

    def transfer = {
		[bankId:params.id]
    }
	
	def accountBalance = {
		def account = transactionService.findAccountByNameAndPin(params.accountName, params.pin, params.id )
		if(account) {
			[bankId:params.id, accountName:params.accountName, pin:params.pin, balance:account.balance, dateCreated:account.dateCreated]
		}
		else {
			flash.message = "Account does not exist."
			render(view:'getBalance', model:[bankId:params.id])
		}
	}
	
	def withdrawFromAccount = {
		def account = transactionService.findAccountByNameAndPin(params.accountName, params.pin, params.id )
		if(account) {
			def successful = transactionService.withdraw(account, params.amount)
			if(successful) {
				flash.message = "Successfully withdrew ${params.amount} pesos from ${params.accountName}."
				render(view:'accountBalance', model: [bankId:params.id, accountName:params.accountName, pin:params.pin, balance:account.balance, dateCreated:account.dateCreated])
			}
			else {
				flash.message = "Not enough funds."
				render(view:'withdraw', model:[bankId:params.id])				
			}
		}
		else {
			flash.message = "Failed to withdraw from account. Please check input details."
			render(view:'withdraw', model:[bankId:params.id])	
		}			
	}
	
	def depositToAccount = {
		def account = transactionService.findAccountByName(params.accountName, params.id )
		if(account) {
			transactionService.deposit(account, params.amount)
			flash.message = "Successfully deposited ${params.amount} pesos to ${params.accountName}."
			render(view:'accountBalance', model: [bankId:params.id, accountName:params.accountName, pin:"****", balance:account.balance, dateCreated:account.dateCreated])
		}
		else {
			flash.message = "Account does not exist. Please check input details."
			render(view:'deposit', model:[bankId:params.id])		
		}		
	}
	
	def transferToAccount = {
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
				render(view:'accountBalance', model: [bankId:params.id, accountName:params.srcAccountName, pin:params.pin, balance:srcAccount.balance, dateCreated:srcAccount.dateCreated])
			}
			else {
				flash.message = "Not enough funds. Failed to transfer ${params.amount} pesos from ${params.srcAccountName} to ${params.destAccountName}."
				render(view:'transfer', model:[bankId:params.id])
			}
		}
		else {
			flash.message = "Account/s do not exist. Please check input details."
			render(view:'transfer', model:[bankId:params.id])
		}
	}
}
