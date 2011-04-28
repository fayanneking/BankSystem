
<html>
    <head>
        <title>Welcome to The Worldwide Bank System</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">
        #pageBody {
            margin-left:280px;
            margin-right:280px;
	    text-align:center;
        }
	h1 {
	   font-size:2.5em;	
	}
	p {
            font-size: 18px;
	}
	div {
            margin-top:30px;
	    margin-bottom:30px;
	}
	.buttons {
	    margin-right:30px;
	    font-size:15px;
   	    padding: 5px;
	}
        </style>
    </head>
    <body>
        <div id="pageBody">
	<g:if test='${flash.message}'>
		<div class='login_message'>${flash.message}</div>
	</g:if>
            <h1>Welcome to The Worldwide Bank System!</h1>
            <p>Feel free to login to your account or sign up for one.</p>
            <div>
		<span class="buttons">
			<g:link controller="login" action="auth" params="['spring-security-redirect': '/login/verified']">Login </g:link>
		</span>
		<span class="buttons">
			<g:link controller="login" action="signUp">Sign Up </g:link>
		</span>
	    </div>
	    <div><g:link controller="visitBank" action="visitBank"><u style="font-size:14px">Click here to visit bank without logging in.</u></g:link></div>
        </div>
    </body>
</html>
