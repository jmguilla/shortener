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
		
		<g:layoutBody/>
		
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
