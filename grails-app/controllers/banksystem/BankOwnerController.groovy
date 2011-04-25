package banksystem

class BankOwnerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bankOwnerInstanceList: BankOwner.list(params), bankOwnerInstanceTotal: BankOwner.count()]
    }

    def create = {
        def bankOwnerInstance = new BankOwner()
        bankOwnerInstance.properties = params
        return [bankOwnerInstance: bankOwnerInstance]
    }

    def save = {
        def bankOwnerInstance = new BankOwner(params)
        if (bankOwnerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bankOwner.label', default: 'BankOwner'), bankOwnerInstance.id])}"
            redirect(action: "show", id: bankOwnerInstance.id)
        }
        else {
            render(view: "create", model: [bankOwnerInstance: bankOwnerInstance])
        }
    }

    def show = {
        def bankOwnerInstance = BankOwner.get(params.id)
        if (!bankOwnerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankOwner.label', default: 'BankOwner'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bankOwnerInstance: bankOwnerInstance]
        }
    }

    def edit = {
        def bankOwnerInstance = BankOwner.get(params.id)
        if (!bankOwnerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankOwner.label', default: 'BankOwner'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bankOwnerInstance: bankOwnerInstance]
        }
    }

    def update = {
        def bankOwnerInstance = BankOwner.get(params.id)
        if (bankOwnerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bankOwnerInstance.version > version) {
                    
                    bankOwnerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bankOwner.label', default: 'BankOwner')] as Object[], "Another user has updated this BankOwner while you were editing")
                    render(view: "edit", model: [bankOwnerInstance: bankOwnerInstance])
                    return
                }
            }
            bankOwnerInstance.properties = params
            if (!bankOwnerInstance.hasErrors() && bankOwnerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bankOwner.label', default: 'BankOwner'), bankOwnerInstance.id])}"
                redirect(action: "show", id: bankOwnerInstance.id)
            }
            else {
                render(view: "edit", model: [bankOwnerInstance: bankOwnerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankOwner.label', default: 'BankOwner'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bankOwnerInstance = BankOwner.get(params.id)
        if (bankOwnerInstance) {
            try {
                bankOwnerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bankOwner.label', default: 'BankOwner'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bankOwner.label', default: 'BankOwner'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bankOwner.label', default: 'BankOwner'), params.id])}"
            redirect(action: "list")
        }
    }
}
