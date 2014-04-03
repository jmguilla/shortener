<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		
		<title>Shaddy</title>
		
		<r:require module="application"/>
		
	</head>
	<body>
	
		<div class="container">
			
			<g:render template="/shared/alerts" />
		
			<sec:ifNotLoggedIn roles="ROLE_USER">
				<div class="jumbotron">
					<h1>Make money by sharing!</h1>
					<p>Share your links on social Networks like Facebook or Twitter using Shaddy and get money from it !</p>
					<g:link controller="documentation" action="description" class="btn btn-lg btn-success">Check how it works !</g:link>
		    	</div>
				
				<hr/>
				    
		    	<div class="row">
					<h2 class="col-lg-offset-4 col-lg-3 text-center">Already one of us?</h2>
					<div class="col-lg-1 text-center">
	    				<g:link controller="login" action="auth" class="btn btn-lg btn-success">Login</g:link>
	    			</div>
	    		</div>
			</sec:ifNotLoggedIn>
			<sec:ifLoggedIn roles="ROLE_USER">
				<div class="text-center col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
					<h1>Shorten your url</h1>
				
					<div id="result" collapse="currentShortUrl == ''">
						<div class="row">
							<div id="resultUrl" class="alert alert-success slide" ng-cloak>
								<button ng-click="clearResult()" type="button"
									class="close" aria-hidden="true">&times;</button>
								<span ng-bind="currentShortUrl"></span>
							</div>
						</div>
						<div class="row">
							<div id="share" class="col-md-3 col-md-offset-3 col-lg-3 col-lg-offset-3">
								facebook / twitter
							</div>
							<div id="edit" class="col-md-3 col-lg-3">
								edit / delete
							</div>
						</div>
					</div>
				
					<div id="valuesDiv" class="row">
						<form class="form" role="form" ng-submit="shortenUrl(longUrlText)">
							<div class="form-group">
								<label class="sr-only" for="">Long url</label> 
								<input type="text"
									class="form-control text-center" id="longUrlText" ng-model="longUrlText"
									placeholder="Your url here...">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-lg btn-success lead">Shorten
									me !</button>
							</div>
						</form>
					</div>
				</div>
			</sec:ifLoggedIn>
			
		</div>

	</body>
	
</html>
