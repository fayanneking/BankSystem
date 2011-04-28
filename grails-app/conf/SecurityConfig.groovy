import bankSystem.*

security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true
	cacheUsers = false

	loginUserDomainClass = "User"
	authorityDomainClass = "Role"	
	userName = "username"
	password = "password"
	useRequestMapDomainClass = false

	requestMapString = """\
	CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
	PATTERN_TYPE_APACHE_ANT
	/=IS_AUTHENTICATED_ANONYMOUSLY
	/js/**=IS_AUTHENTICATED_ANONYMOUSLY
	/css/**=IS_AUTHENTICATED_ANONYMOUSLY
	/images/**=IS_AUTHENTICATED_ANONYMOUSLY
	/plugins/**=IS_AUTHENTICATED_ANONYMOUSLY
	/dashboard/login=IS_AUTHENTICATED_ANONYMOUSLY
	/login/auth=IS_AUTHENTICATED_ANONYMOUSLY
	/login/signup=IS_AUTHENTICATED_ANONYMOUSLY
	/visitbank/**=IS_AUTHENTICATED_ANONYMOUSLY
	/transaction/**=IS_AUTHENTICATED_ANONYMOUSLY
	/**=IS_AUTHENTICATED_ANONYMOUSLY
	/dashboard/**=IS_AUTHENTICATED_REMEMBERED
	"""
}
