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
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
				      <!-- Indicators -->
				      <ol class="carousel-indicators">
				        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				        <li data-target="#myCarousel" data-slide-to="1"></li>
				        <li data-target="#myCarousel" data-slide-to="2"></li>
				      </ol>
				      <div class="carousel-inner">
				        <div class="item active">
				          <div class="container">
				            <div class="carousel-caption">
				              <h1>Step ONE</h1>
				              <p>Shorten your url with {{applicationName}} !</p>
				            </div>
				          </div>
				        </div>
				        <div class="item">
				          <div class="container">
				            <div class="carousel-caption">
				              <h1>Step TWO</h1>
				              <p>Share your url !</p>
				            </div>
				          </div>
				        </div>
				        <div class="item">
				          <div class="container">
				            <div class="carousel-caption">
				              <h1>Step THREE</h1>
				              <p>Ear money for every click on your link !</p>
				            </div>
				          </div>
				        </div>
				      </div>
				      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
				      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
				    </div><!-- /.carousel -->
				    <div class="text-center">
			    		<p><a class="btn btn-lg btn-success" href="#" role="button">Register</a></p>
			    	</div>
		    	</div>
				    
		    	<div class="text-center">
					<h2>Already one of us?</h2>
	    			<g:link controller="login" action="auth" class="btn btn-lg btn-success">Login</g:link>
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
