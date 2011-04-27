import banksystem.*

class BootStrap {

	def authenticateService

    def init = { servletContext ->

	def userRole = new Role(authority: 'ROLE_USER', description: 'user').save(failOnError: true)
	def tellerRole = new Role(authority: 'ROLE_TELLER', description: 'teller').save(failOnError: true)
	def bankManagerRole = new Role(authority: 'ROLE_BANKMANAGER', description: 'bank manager').save(failOnError: true)
	def bankOwnerRole = new Role(authority: 'ROLE_BANKOWNER', description: 'bank owner').save(failOnError: true)
	def sysAdRole = new Role(authority: 'ROLE_SYSAD', description: 'system administrator').save(failOnError: true)	
	
	def bdoOwner = new BankOwner(name:"Beryl King", 
		   			  email:"beryl.king@orangeandbronze.com", 
		                          contactNo:"7361952", 
		                          username:"beryl.king", 
		                          password: authenticateService.encodePassword("helloworld"),
					  enabled:true)
	userRole.addToPeople(bdoOwner)
	bankOwnerRole.addToPeople(bdoOwner)

	bdoOwner.save(flush:true)
	
	new Bank(name:"Banco De Oro",
		 	   location:"Manila",
		 	   website:"www.bdo.com.ph",
	    	 	   bankOwner: bdoOwner ).save(failOnError: true)
	def bdo = Bank.findByName("Banco De Oro")
	
	if(!bdoOwner.authorities.contains(bankOwnerRole) || !bdoOwner.authorities.contains(userRole)) {
		bdoOwner.addToAuthorities(bankOwnerRole)
		bdoOwner.addToAuthorities(userRole)
	}

	def bdoTeller = new Teller(name:"Fayanne King", 
							    email:"fayanne.king@orangeandbronze.com", 
							    contactNo:"09226759844", 
							    bank: bdo,
							    username:"fayanne.king", 
							    password: authenticateService.encodePassword("helloworld"),
							    enabled:true)
	
	tellerRole.addToPeople(bdoTeller)
	userRole.addToPeople(bdoTeller)
	bdo.addToTellers(bdoTeller)
	if(!bdoTeller.authorities.contains(tellerRole)) {
		bdoTeller.addToAuthorities(tellerRole)
		bdoTeller.addToAuthorities(userRole)
	}
	bdoTeller.save(flush:true)
	bdo.addToTellers(bdoTeller)
	bdo.addToAtms(new ATM())	
	bdo.addToBankAccounts(new BankAccount(name: "Fayanne King",
										  pin: "1234",
										  balance: 5000.00,
										  bank: bdo,
										  owner: bdoTeller))
										  
    }

    def destroy = {
    }
}
