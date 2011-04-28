package banksystem

class BankAccountController {

    def transactionService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def person = Person.findByName(params.name)
		def accounts = BankAccount.findAllByOwner(person)
		def count = BankAccount.countByOwner(person)
		[id:params.id, name:params.name, type:params.type, bankAccountInstanceList:accounts, bankAccountInstanceTotal:count]
    }

    def create = {
        def bankAccountInstance = new BankAccount()
        bankAccountInstance.properties = params
        return [bankAccountInstance: bankAccountInstance]
    }

    def save = {
        def bankAccountInstance = new BankAccount(params)
        if (bankAccountInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), bankAccountInstance.id])}"
            redirect(action: "show", params: [userId: params.userId, name: params.name, type:params.type, id: bankAccountInstance.id])
        }
        else {
            render(view: "create", model: [userId: params.userId, name: params.name, type:params.type, bankAccountInstance: bankAccountInstance])
        }
    }

    def show = {
        def bankAccountInstance = BankAccount.get(params.id)
        if (!bankAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userId: params.userId, name: params.name, type: params.type, bankAccountInstance: bankAccountInstance]
        }
    }

    def edit = {
        def bankAccountInstance = BankAccount.get(params.id)
        if (!bankAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userId: params.userId, name: params.name, type:params.type, bankAccountInstance: bankAccountInstance]
        }
    }

    def update = {
        def bankAccountInstance = BankAccount.get(params.id)
        if (bankAccountInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bankAccountInstance.version > version) {
                    
                    bankAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bankAccount.label', default: 'BankAccount')] as Object[], "Another user has updated this BankAccount while you were editing")
                    render(view: "edit", model: [type:params.type, name:params.name, userId: params.userId, bankAccountInstance: bankAccountInstance])
                    return
                }
            }
			bankAccountInstance.properties = params
            if (!bankAccountInstance.hasErrors() && bankAccountInstance.save(flush: true)) {
                flash.message = "${bankAccountInstance} has been updated."
                redirect(action: "show", params: [type: params.type, name: params.name, userId: params.userId, id: bankAccountInstance.id])
            }
            else {
                render(view: "edit", model: [type: params.type, name: params.name, userId: params.userId, bankAccountInstance: bankAccountInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), params.id])}"
            redirect(action: "list", params: [type: params.type, name: params.name, id: params.userId] )
        }
    }

    def delete = {
        def bankAccountInstance = BankAccount.get(params.id)
	def name = bankAccountInstance?.name
        if (bankAccountInstance) {
            try {
                bankAccountInstance.delete(flush: true)
                flash.message = "$name successfully deleted."
                redirect(action: "list", params:[name: params.name, type:params.type, id: params.userId])
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), params.id])}"
                redirect(action: "show", params:[userId: params.userId, name: params.name, type:params.type, id: params.id])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), params.id])}"
            redirect(action: "list", params:[name: params.name, type:params.type, id: params.userId])
        }
    }

}
