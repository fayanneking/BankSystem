package banksystem

class BankOwner extends User{

	Bank bank
	
	static belongsTo = Bank

    	static constraints = {
		bank		nullable:false
    	}
}
