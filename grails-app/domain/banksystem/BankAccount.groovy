package banksystem

class BankAccount {

	String name
	String pin
	BigDecimal balance
	Bank bank
	Person owner
	Date dateCreated
	static hasMany = [transactionList: Transaction]
	static mappedBy = [transactionList: "srcAccount", transactionList: "destAccount"]

	static belongsTo = Bank
	
	static searchable = true
	
   	static constraints = {
		name		blank:false
		pin		blank:false
		balance 	blank:false
		dateCreated	nullable:false
		owner		nullable:false
    	}
	
	String toString() {
		name
	}
}
