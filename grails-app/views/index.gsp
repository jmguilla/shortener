<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		
		<title>Shorteney</title>
		
		<style type="text/css" media="screen">
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
		</style>
		
		<r:require module="application"/>
		
	</head>
	<body>
		<div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">{{applicationName}}</a>
                </div>
                <div class="navbar-collapse collapse">
                    
                    <sec:ifLoggedIn roles="ROLE_USER">
	                    <ul class="nav navbar-nav navbar-right">
				            <li><a href="#/userParams"><span class="glyphicon glyphicon-wrench"></span> My Account</a></li>
				            <li><g:link controller="logout" action="index">Logout</g:link></li>
				        </ul>
                    </sec:ifLoggedIn>
                    <form class="navbar-form navbar-right" action='${request.contextPath}/j_spring_security_check' method='POST'>
                    	<!-- NOT logged -->
                        <sec:ifNotLoggedIn roles="ROLE_USER">
	                        <div class="form-group">
	                            <input type="text" placeholder="Email" class="form-control" id='username' name='j_username'>
	                        </div>
	                        <div class="form-group">
	                            <input type="password" placeholder="Password" class="form-control" id='password' name='j_password'>
	                        </div>
	                        <button type="submit" id="submit" class="btn btn-success">${message(code: "springSecurity.login.button")}</button>
                        </sec:ifNotLoggedIn>
                    </form>
                </div><!--/.navbar-collapse -->
            </div>
        </div>
		<div>
			<div ng-view></div>
		</div>

		<footer>
	        <p>&copy; {{applicationName}} 2013</p>
	    </footer>
	</body>
	
</html>
