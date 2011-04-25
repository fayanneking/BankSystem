class BankSystemTagLib {

	def logoutToggle = {	
		out << "<div>"
		if (session.user) {
		  out << "<span style='float:left;margin:3px 0px 0px 10px;font-size:13px'>"
	      	  out << "Welcome ${session.user}."
	          out << "</span><span style='float:right;margin:3px 10px 0px 0px;font-size:13px'>"
	          out << "<a href='${createLink(controller:'dashboard', action:'logout')}'>"
	          out << "Logout </a></span>"
		}
		else{
		  out << "<span style='float:right;margin:3px 10px 0px 0px;font-size:13px'>"
		  out << "<a href='${createLink(controller:'dashboard', action:'login')}'>"
		  out << "Login </a></span>"
		}
		out << "</div><br/>"
    
	}

}
