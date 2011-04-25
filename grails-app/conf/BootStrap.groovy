import banksystem.*

class BootStrap {

    def init = { servletContext ->
	
	new Bank(name:"Banco De Oro",
		 	   location:"Manila",
		 	   website:"www.bdo.com.ph",
	    	 	   bankOwner: new BankOwner(name:"Beryl King", 
		   			  email:"beryl.king@orangeandbronze.com", 
		                          contactNo:"7361952", 
		                          username:"beryl.king", 
		                          password:"helloworld") ).save()
	def bdo = Bank.findByName("Banco De Oro")
	new Teller(name:"Fayanne King", 
							    email:"fayanne.king@orangeandbronze.com", 
							    contactNo:"09226759844", 
								bank: bdo,
							    username:"fayanne.king", 
							    password:"helloworld").save()
	def person1 = Person.findByName("Fayanne King")
	bdo.addToTellers(person1)
	bdo.addToAtms(new ATM())	
	bdo.addToBankAccounts(new BankAccount(name: "Fayanne King",
										  pin: "1234",
										  balance: 5000.00,
										  bank: bdo,
										  owner: person1))
										  
    }

    def destroy = {
    }
}
