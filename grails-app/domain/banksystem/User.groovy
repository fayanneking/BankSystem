package banksystem

class User extends Person {
	
	String username
	String password
	
    	static constraints = {
		username	nullable:false
		password	nullable:false
    	}

}
