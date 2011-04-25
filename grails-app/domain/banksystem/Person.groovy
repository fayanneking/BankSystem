package banksystem

class Person {

	String name
	String email
	String contactNo
	static hasMany = [bankAccounts: BankAccount]
	
    	static constraints = {
		name			blank:false
		email			blank:true
		contactNo		blank:false
		bankAccounts	nullable:true
    	}
	
	String toString() {
		name
	}
}
