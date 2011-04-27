package banksystem

class Teller extends User{

	Bank bank

	static hasMany = [transactions:Transaction]
	
	static belongsTo = [Bank, Role]

   	static constraints = {
		transactions		nullable:true
    	}
	
	String toString() {
		name
	}
}
