package banksystem

class BankManagerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bankManagerInstanceList: BankManager.list(params), bankManagerInstanceTotal: BankManager.count()]
    }

    def create = {
        def bankManagerInstance = new BankManager()
        bankManagerInstance.properties = params
        return [bankManagerInstance: bankManagerInstance]
    }

    def save = {
        def bankManagerInstance = new BankManager(params)
        if (bankManagerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bankManager.label', default: 'BankManager'), bankManagerInstance.id])}"
            redirect(action: "show", id: bankManagerInstance.id)
        }
        else {
            render(view: "create", model: [bankManagerInstance: bankManagerInstance])
        }
    }

    def show = {
        def bankManagerInstance = BankManager.get(params.id)
        if (!bankManagerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankManager.label', default: 'BankManager'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bankManagerInstance: bankManagerInstance]
        }
    }

    def edit = {
        def bankManagerInstance = BankManager.get(params.id)
        if (!bankManagerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankManager.label', default: 'BankManager'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bankManagerInstance: bankManagerInstance]
        }
    }

    def update = {
        def bankManagerInstance = BankManager.get(params.id)
        if (bankManagerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bankManagerInstance.version > version) {
                    
                    bankManagerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bankManager.label', default: 'BankManager')] as Object[], "Another user has updated this BankManager while you were editing")
                    render(view: "edit", model: [bankManagerInstance: bankManagerInstance])
                    return
                }
            }
            bankManagerInstance.properties = params
            if (!bankManagerInstance.hasErrors() && bankManagerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bankManager.label', default: 'BankManager'), bankManagerInstance.id])}"
                redirect(action: "show", id: bankManagerInstance.id)
            }
            else {
                render(view: "edit", model: [bankManagerInstance: bankManagerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankManager.label', default: 'BankManager'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bankManagerInstance = BankManager.get(params.id)
        if (bankManagerInstance) {
            try {
                bankManagerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bankManager.label', default: 'BankManager'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bankManager.label', default: 'BankManager'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankManager.label', default: 'BankManager'), params.id])}"
            redirect(action: "list")
        }
    }

}
