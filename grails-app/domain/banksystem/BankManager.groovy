package banksystem

class BankManager extends User {

	Bank bank

	static belongsTo = [Bank, Role]

    	static constraints = {
		bank		nullable:false
    	}
}
