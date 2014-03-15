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
				        <!-- 
				          <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
				          -->
				          <div class="container">
				            <div class="carousel-caption">
				              <h1>Step ONE</h1>
				              <p>Shorten your url with {{applicationName}} !</p>
				            </div>
				          </div>
				        </div>
				        <div class="item">
				        <!-- 
				          <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide" alt="Second slide">
				           -->
				          <div class="container">
				            <div class="carousel-caption">
				              <h1>Step TWO</h1>
				              <p>Share your url !</p>
				            </div>
				          </div>
				        </div>
				        <div class="item">
				        <!-- 
				          <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide">
				        -->
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
				<div class="text-center">
					<h1>Shorten your url</h1>
				
					<div id="resultDiv" class="row" ng-show="currentShortUrl != ''">
						<div id="resultUrl" class="alert alert-success col-lg-12"
								ng-bind="currentShortUrl"></div>
					</div>
				
					<div id="valuesDiv" class="row">
						<form class="form" role="form" ng-submit="shortenUrl(longUrlText)">
							<div class="form-group">
								<label class="sr-only" for="">Long url</label> <input type="text"
									class="form-control" id="longUrlText" ng-model="longUrlText"
									placeholder="Your url here...">
							</div>
							<button type="submit" class="btn btn-lg btn-success lead">Shorten
								me !</button>
				
						</form>
					</div>
				</div>
			</sec:ifLoggedIn>
			
		</div>

	</body>
	
</html>
