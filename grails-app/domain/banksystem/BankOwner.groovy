package banksystem

class BankOwner extends User{

	Bank bank
	
	static belongsTo = [Role, Bank]

    	static constraints = {
		bank		nullable:false
    	}
}
