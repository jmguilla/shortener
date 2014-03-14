<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		

		<!-- ressources Bootstrap ajoutée "à la main", par module les animations ne fonctionnent pas (pourquoi... ???) -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>
        <script src="/js/libs/bootstrap.min.js"></script>
        <link rel="stylesheet" href="/css/libs/bootstrap.min.css">
        <link rel="stylesheet" href="/css/main.css">
       
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.13/angular.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.13/angular-resource.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.13/angular-sanitize.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.13/angular-animate.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.13/angular-route.js"></script>
		
		<title>
			<g:layoutTitle default="Shortener"/>
		</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	
	<body	ng-app="shortener" 
			ng-controller="MainCtrl">
			
			<div class="site-wrapper">
	
				<div class="site-wrapper-inner">
		
					<div class="cover-container">
		
						<div class="masthead clearfix">
							<div class="inner">
								<h3 class="masthead-brand">{{applicationName}}</h3>
					            <ul class="nav masthead-nav">
									<li><a href="/#"><span
												class="glyphicon glyphicon-home"></span> Home</a></li>
									<sec:ifNotLoggedIn roles="ROLE_USER">
										<li><g:link controller="login" action="auth">
													<span class="glyphicon glyphicon-user"></span> Login</g:link></li>
										<li><g:link controller="user" action="create"> Register</g:link></li>
									</sec:ifNotLoggedIn>
									<sec:ifLoggedIn roles="ROLE_USER">
										<li><a href="#/userParams"><span
												class="glyphicon glyphicon-cog"></span> My Account</a></li>
										<li><g:link url="/j_spring_security_logout" controller="logout" action="index">Logout</g:link></li>
									</sec:ifLoggedIn>
								</ul>
							</div>
						</div>
			
					<g:layoutBody/>
		
		
				</div>
			</div>
		</div>
		
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
