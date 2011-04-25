package banksystem

class SystemAdministrator extends User {

    String website

    static constraints = {
	website		nullable:true
    }
}
