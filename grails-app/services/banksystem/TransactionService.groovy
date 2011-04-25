package banksystem

class TransactionService {

    static transactional = true
	
	def findAccountByNameAndPin(String accountName, String pin, String bankId) {
		def bank = Bank.get(bankId)
		def bankAccount = BankAccount.findByNameAndBank(accountName, bank)
		if(bankAccount?.pin == pin) {
			return bankAccount
		}
		return
	}
	
	def findAccountByName(String accountName, String bankId) {
		def bank = Bank.get(bankId)
		if(bank)
			return BankAccount.findByNameAndBank(accountName, bank)
		return
	}

    boolean withdraw(BankAccount account, String transactionAmount) {
		def bal = account.balance
		def amount = transactionAmount as BigDecimal
		BigDecimal newBalance = bal-amount
		if( newBalance>=0 ) {
			account.setBalance(newBalance)
			return true
		}
		return false			
    }
    
	boolean deposit(BankAccount destAccount, String transactionAmount) {
		def bal = destAccount.balance
		def amount = transactionAmount as BigDecimal
		BigDecimal newBalance = bal + amount
		destAccount.setBalance(newBalance)
	}
	
    boolean transfer( BankAccount srcAccount, BankAccount destAccount, String transactionAmount ) {
		if( withdraw(srcAccount, transactionAmount) ) {
			deposit(destAccount, transactionAmount)
			return true
		}
		return false
    }
	
}
