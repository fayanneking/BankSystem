package banksystem

class TellerService {

    static transactional = true

    def createAccount( String accountName, String pin, String initBal, String applicantName, String contactNo, String email, String username, String password, Teller teller) {
	def balance = initBal as BigDecimal
	def bank = teller.bank
	
	if(username!=null)
		new User(name:applicantName,contactNo:contactNo,email:email,username:username,password:password).save()
	else
		new Person(name:applicantName,contactNo:contactNo,email:email).save()

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
