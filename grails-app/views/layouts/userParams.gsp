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
			<g:layoutTitle default="Shaddy"/>
		</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	
	<body	ng-app="shortener" 
			ng-controller="MainCtrl">
			
			
		<g:render template="/shared/nav" />
		
		<div class="container"
				ng-controller="UserCtrl">
			
			<div class="row">
				<div id="paramsNav"
						class="col-lg-2">
					<ul class="nav nav-pills nav-stacked">
					  <li class="${(controllerName == 'user' && actionName == 'show' ) ? 'active' : ''}"><g:link
							controller="user" action="show">Informations</g:link></li>
					  <li class="${(controllerName == 'user' && actionName == 'listUrls' ) ? 'active' : ''}"><g:link
							controller="user" action="listUrls">
							<span class="badge pull-right">xx</span>My urls</g:link>
					  </li>
					</ul>
				</div>
				<div class="col-lg-10">
					
					<g:render template="/shared/alerts" />	
							  
					<g:layoutBody/>
				</div>
			</div>
		</div>
		
		<g:javascript library="application"/>
		
		<r:layoutResources />
	</body>
</html>
