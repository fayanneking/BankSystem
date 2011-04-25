package banksystem

class BankManager extends User {

	Bank bank

	static belongsTo = [bank:Bank]

    	static constraints = {
		bank		nullable:false
    	}
}
