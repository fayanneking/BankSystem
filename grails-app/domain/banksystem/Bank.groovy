package banksystem

class Bank {

	String name
	String location
	String website
	BankOwner bankOwner	
	static hasMany = [bankAccounts: BankAccount, tellers:Teller, atms:ATM, bankManagers:BankManager]
	
    	static constraints = {
		name			blank:false
		location		blank:false
		website			nullable:true,	blank:true
		bankAccounts		nullable:true
		tellers			nullable:true
		atms			nullable:true
		bankManagers	nullable:true
       }
	
	String toString() {
		name
	}
}
