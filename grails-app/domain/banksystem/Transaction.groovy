package banksystem

class Transaction {

	Teller teller
	ATM atm
	Bank srcBank
	BankAccount srcAccount
	Date transactionDate
	BankAccount destAccount
	Bank destBank
	BigDecimal transactionAmount

    	static constraints = {
		teller				nullable:true
		atm				nullable:true
		srcAccount			nullable:false
		srcBank				nullable:false
		transactionType 		inList:["Get Balance", "Deposit", "Withdraw", "Transfer"]
		transactionDate			nullable:false
		destAccount			nullable:true
		destBank			nullable:true
		transactionAmount		nullable:true
    	}
	
	String toString() {
		String action
		if( transactionType.equals("Get Balance") )
			action = "checked the balance of"
		else if( transactionType.equals("Deposit") )
			action = "deposited $transactionAmount"
		else if( transactionType.equals("Withdraw") )
			action = "withdrew $transactionAmount"
		else if( transactionType.equals("Transfer") ) {
			action = "transferred $transactionAmount to $destAccount"
			if( destBank != null ) {
				action += "at $destBank"
			}
		}
		"$user ${action} on $transactionDate."
	}
}
