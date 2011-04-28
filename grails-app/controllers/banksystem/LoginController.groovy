package banksystem

import org.codehaus.groovy.grails.plugins.springsecurity.RedirectUtils
import org.grails.plugins.springsecurity.service.AuthenticateService

import org.springframework.security.AuthenticationTrustResolverImpl
import org.springframework.security.DisabledException
import org.springframework.security.context.SecurityContextHolder as SCH
import org.springframework.security.ui.AbstractProcessingFilter
import org.springframework.security.ui.webapp.AuthenticationProcessingFilter


/**
 * Login Controller (Example).
 */
class LoginController {

	/**
	 * Dependency injection for the authentication service.
	 */
	def authenticateService

	/**
	 * Dependency injection for OpenIDConsumer.
	 */
	def openIDConsumer

	/**
	 * Dependency injection for OpenIDAuthenticationProcessingFilter.
	 */
	def openIDAuthenticationProcessingFilter

	private final authenticationTrustResolver = new AuthenticationTrustResolverImpl()

	def getUser = {
		def user = authenticateService.principal()
		def username = user?.username
		def theUser = User.findByUsername(username)
		session.user = theUser
		redirect(action:'determineType', params:[id: theUser.id, name: theUser.name])
	}

	def determineType = {
		def type
		def sysAd = SystemAdministrator.get(params.id)		
		if(!sysAd) {
			def bankOwner = BankOwner.findByName(params.name)
			if(!bankOwner) {
				def bankManager = BankManager.findByName(params.name) 
				if(!bankManager) {
					def teller = Teller.findByName(params.name)
					if(!teller)
						type='user'
					else 
						type='teller'
				}
				else
					type='bankManager'
			}
			else
				type='bankOwner'
		}
		else
			type='systemAdministrator'
		redirect(action: "dashboard", params:[id:params.id, name:params.name, type:type] )
	}

	def dashboard = {
		[id: params.id, name: params.name, type: params.type]
    	}

	def index = {
		if (isLoggedIn()) {
			def user = session.user
			redirect(action:"determineType", params:[id : user.id, name: user.name])
		}
		else {
			redirect action: auth, params: params
		}
	}

	def logout = { 
		session.user = null 
		redirect(controller:"logout", action:"index")
	}
	
        def validate = {
		def user = User.findByUsername(params.j_username)
		if(user && user.password == params.j_password) {
			session.user = user
			[j_username: params.j_username, j_password: authenticateService.encodePassword(params.j_password), postUrl: params.postUrl, 'spring-security-redirect': "/dashboard/$user"]
		}
		else {
		        flash.message = "Invalid username and password."
		        redirect(action:'auth')
		}
        }
	
	def signUp = {
		if (params.cName)
		    return [cName:params.cName, aName:params.aName]      
	}

	def validateAccount = {
    		def account = BankAccount.findByOwner(params.accountName)
		if( account && account.pin == params.pin ) {
			def user = account.owner
			if( user.username != null ) {
				flash.message = "User has already registered for online transactions."
				render(view:'signUp')
			}
			else if( User.findByUsername(params.username) ) {
				flash.message = "Sorry. Username already taken."
				render(view:'signUp')
			}
			else {
				user.setUsername(params.username)	
				user.setPassword(params.password)
				session.user = user
				flash.message = "Successfully created online account."
				redirect(url:resource(dir:''))
			}
		}
		else {
			flash.message = "Invalid account name and/or pin."
			render(view:'signUp')
		}
   	 }

	/**
	 * Show the login page.
	 */
	def auth = {

		nocache response

		if (isLoggedIn()) {
			def user = session.user
			redirect(action:"determineType", params:[id : user.id, name: user.name])
			return
		}

		String view
		String postUrl
		def config = authenticateService.securityConfig.security

		if (config.useOpenId) {
			view = 'openIdAuth'
			postUrl = "${request.contextPath}/login/openIdAuthenticate"
		}
		else if (config.useFacebook) {
			view = 'facebookAuth'
			postUrl = "${request.contextPath}${config.facebook.filterProcessesUrl}"
		}
		else {
			view = 'auth'
			postUrl = "${request.contextPath}${config.filterProcessesUrl}"
		}
		render view: view, model: [postUrl: postUrl]
	}

	/**
	 * Form submit action to start an OpenID authentication.
	 */
	def openIdAuthenticate = {
		String openID = params['j_username']
		try {
			String returnToURL = RedirectUtils.buildRedirectUrl(
					request, response, openIDAuthenticationProcessingFilter.filterProcessesUrl)
			String redirectUrl = openIDConsumer.beginConsumption(request, openID, returnToURL)
			redirect url: redirectUrl
		}
		catch (org.springframework.security.ui.openid.OpenIDConsumerException e) {
			log.error "Consumer error: $e.message", e
			redirect url: openIDAuthenticationProcessingFilter.authenticationFailureUrl
		}
	}

	// Login page (function|json) for Ajax access.
	def authAjax = {
		nocache(response)
		//this is example:
		render """
		<script type='text/javascript'>
		(function() {
			loginForm();
		})();
		</script>
		"""
	}

	/**
	 * The Ajax success redirect url.
	 */
	def ajaxSuccess = {
		nocache(response)
		render '{success: true}'
	}

	/**
	 * Show denied page.
	 */
	def denied = {
		if (isLoggedIn() && authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
			// have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
			redirect action: full, params: params
		}
	}

	/**
	 * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
	 */
	def full = {
		render view: 'auth', params: params,
			model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication)]
	}

	// Denial page (data|view|json) for Ajax access.
	def deniedAjax = {
		//this is example:
		render "{error: 'access denied'}"
	}

	/**
	 * login failed
	 */
	def authfail = {

		def username = session[AuthenticationProcessingFilter.SPRING_SECURITY_LAST_USERNAME_KEY]
		def msg = ''
		def exception = session[AbstractProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY]
		if (exception) {
			if (exception instanceof DisabledException) {
				msg = "[$username] is disabled."
			}
			else {
				msg = "[$username] wrong username/password."
			}
		}

		if (isAjax()) {
			render "{error: '${msg}'}"
		}
		else {
			flash.message = msg
			redirect action: auth, params: params
		}
	}

	/**
	 * Check if logged in.
	 */
	private boolean isLoggedIn() {
		return authenticateService.isLoggedIn()
	}

	private boolean isAjax() {
		return authenticateService.isAjax(request)
	}

	/** cache controls */
	private void nocache(response) {
		response.setHeader('Cache-Control', 'no-cache') // HTTP 1.1
		response.addDateHeader('Expires', 0)
		response.setDateHeader('max-age', 0)
		response.setIntHeader ('Expires', -1) //prevents caching at the proxy server
		response.addHeader('cache-Control', 'private') //IE5.x only
	}
}
