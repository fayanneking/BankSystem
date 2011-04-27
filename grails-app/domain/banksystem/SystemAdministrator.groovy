package banksystem

class SystemAdministrator extends User {

    String website

    static belongsTo = Role

    static constraints = {
	website		nullable:true
    }
}
