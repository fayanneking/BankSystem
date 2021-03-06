package banksystem

class TellerController {

    def bankManagerService
    def transactionService
    def tellerService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tellerInstanceList: Teller.list(params), tellerInstanceTotal: Teller.count()]
    }

    def create = {
        def tellerInstance = new Teller()
        tellerInstance.properties = params
        return [tellerInstance: tellerInstance]
    }

    def save = {
        def tellerInstance = new Teller(params)
        if (tellerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'teller.label', default: 'Teller'), tellerInstance.id])}"
            redirect(action: "show", id: tellerInstance.id)
        }
        else {
            render(view: "create", model: [tellerInstance: tellerInstance])
        }
    }

    def show = {
        def tellerInstance = Teller.get(params.id)
        if (!tellerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'teller.label', default: 'Teller'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tellerInstance: tellerInstance]
        }
    }

    def edit = {
        def tellerInstance = Teller.get(params.id)
        if (!tellerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'teller.label', default: 'Teller'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tellerInstance: tellerInstance]
        }
    }

    def update = {
        def tellerInstance = Teller.get(params.id)
        if (tellerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tellerInstance.version > version) {
                    
                    tellerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'teller.label', default: 'Teller')] as Object[], "Another user has updated this Teller while you were editing")
                    render(view: "edit", model: [tellerInstance: tellerInstance])
                    return
                }
            }
            tellerInstance.properties = params
            if (!tellerInstance.hasErrors() && tellerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'teller.label', default: 'Teller'), tellerInstance.id])}"
                redirect(action: "show", id: tellerInstance.id)
            }
            else {
                render(view: "edit", model: [tellerInstance: tellerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'teller.label', default: 'Teller'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def tellerInstance = Teller.get(params.id)
        if (tellerInstance) {
            try {
                tellerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'teller.label', default: 'Teller'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'teller.label', default: 'Teller'), params.id])}"
                redirect(action: "show")
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'teller.label', default: 'Teller'), params.id])}"
            redirect(action: "list")
        }
    }
	
    def transact = {
		def tellerInstance = Teller.get(params.id)
		def name = tellerInstance.name
	    	def bankId = tellerInstance?.bank?.id
		def cName = 'teller'
		def aName = 'transact'
		[tellerId:params.id, bankId:bankId, type:'teller', name:name, cName:cName, aName:aName]
   	}

	
}
