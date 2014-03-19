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
		
		<g:render template="/shared/headConfig" />
				
		<g:render template="/shared/analytics" />
		
		<title>
			<g:layoutTitle default="Shaddy"/>
		</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	
	<body ng-app="shortener"
			ng-controller="MainCtrl">
			
			
		<g:render template="/shared/nav" />
		
		<div class="container"
				ng-controller="UserCtrl">
			
			<div class="row">
				<div id="paramsNav"
						class="col-lg-2">
					<ul class="nav nav-pills nav-stacked">
					  <li class="${(controllerName == 'user' && actionName == 'show' ) ? 'active' : ''}"><g:link
							controller="user" action="show">Resume</g:link>
					  </li>
					  <li class="${(controllerName == 'shaddytem' && actionName == 'list' ) ? 'active' : ''}"><g:link
							controller="shaddytem" action="list">
							<span class="badge pull-right">{{shaddytems.length}}</span>My urls</g:link>
					  </li>
					  <li class="${(controllerName == 'user' && actionName == 'edit' ) ? 'active' : ''}"><g:link
							controller="user" action="edit">Settings</g:link></li>
					</ul>
				</div>
				<div class="col-lg-10" >

					<g:render template="/shared/alerts"/>
					
					<!-- some space in mobile vertical mode -->
					<div class="hidden-lg">
						<br/>
					</div>
					
					<g:layoutBody/>
					
				</div>
			</div>
		</div>
		
		<g:javascript library="application"/>
		
		<r:layoutResources />
	</body>
</html>
