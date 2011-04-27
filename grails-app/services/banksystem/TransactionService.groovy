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

    def createAccount( String accountName, String pin, String initBal, String applicantName, String contactNo, String email, String username, String password, Teller teller) {
	def balance = initBal as BigDecimal
	def bank = teller.bank
	
	if(username != null && username != "" && username != " ")
		new User(name:applicantName,contactNo:contactNo,email:email,username:username,password:password).save()
	else
		new User(name:applicantName,contactNo:contactNo,email:email).save()

	def isSuccessful = bank.addToBankAccounts( new BankAccount( name:accountName,
												pin:pin,
												balance:initBal,
												bank:bank,
												owner:Person.findByName(applicantName) ) ) 
	return isSuccessful
		
    }

    	def removeAccount( String accountName, String pin, Teller teller ) {
		def bank = teller.bank
		def account = BankAccount.findByNameAndBank(accountName, bank)
		if(account && account.pin==pin) {
			account.delete()
			return true
		}
		return false
	}

	
}
