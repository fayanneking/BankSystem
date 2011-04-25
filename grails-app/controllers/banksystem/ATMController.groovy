package banksystem

class ATMController {
    
    def transactionService    
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ATMInstanceList: ATM.list(params), ATMInstanceTotal: ATM.count()]
    }

    def create = {
        def ATMInstance = new ATM()
        ATMInstance.properties = params
        return [ATMInstance: ATMInstance]
    }

    def save = {
        def ATMInstance = new ATM(params)
        if (ATMInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ATM.label', default: 'ATM'), ATMInstance.id])}"
            redirect(action: "show", id: ATMInstance.id)
        }
        else {
            render(view: "create", model: [ATMInstance: ATMInstance])
        }
    }

    def show = {
        def ATMInstance = ATM.get(params.id)
        if (!ATMInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ATM.label', default: 'ATM'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ATMInstance: ATMInstance]
        }
    }

    def edit = {
        def ATMInstance = ATM.get(params.id)
        if (!ATMInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ATM.label', default: 'ATM'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ATMInstance: ATMInstance]
        }
    }

    def update = {
        def ATMInstance = ATM.get(params.id)
        if (ATMInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ATMInstance.version > version) {
                    
                    ATMInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ATM.label', default: 'ATM')] as Object[], "Another user has updated this ATM while you were editing")
                    render(view: "edit", model: [ATMInstance: ATMInstance])
                    return
                }
            }
            ATMInstance.properties = params
            if (!ATMInstance.hasErrors() && ATMInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ATM.label', default: 'ATM'), ATMInstance.id])}"
                redirect(action: "show", id: ATMInstance.id)
            }
            else {
                render(view: "edit", model: [ATMInstance: ATMInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ATM.label', default: 'ATM'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ATMInstance = ATM.get(params.id)
        if (ATMInstance) {
            try {
                ATMInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ATM.label', default: 'ATM'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ATM.label', default: 'ATM'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ATM.label', default: 'ATM'), params.id])}"
            redirect(action: "list")
        }
    }

    def transact = {
		def ATMInstance = ATM.get(params.id)
		def bankId = ATMInstance?.bank?.id	
		[atmId:params.id, bankId:bankId]
    }
}
