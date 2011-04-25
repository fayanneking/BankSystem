package banksystem

class ATM {

	Bank bank
	static hasMany = [transactions:Transaction]
	
	static belongsTo = Bank
	
   	static constraints = {
		transactions	nullable:true
    	}
	
	String toString() {
		"ATM at $bank"
	}
}
