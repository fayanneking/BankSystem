package banksystem

class User extends Person {
	
	String username
	String password
	boolean enabled

	static hasMany = [ authorities: Role ]
	static belongsTo = Role
	
    	static constraints = {
		username	nullable:true
		password	nullable:true
    	}

}
