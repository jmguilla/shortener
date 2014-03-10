<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		
		<title>Shorteney</title>
		
		<r:require module="application"/>
		
	</head>
	<body>
	
		<div class="inner cover">
			
			
			<sec:ifNotLoggedIn roles="ROLE_USER">
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
			              <h1>Create an account</h1>
			              <p><a class="btn btn-lg btn-success" href="#" role="button">Create</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			        <!-- 
			          <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide" alt="Second slide">
			           -->
			          <div class="container">
			            <div class="carousel-caption">
			              <h1>Shorten your urls !</h1>
			              <p> ... and share them</p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			        <!-- 
			          <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide">
			        -->
			          <div class="container">
			            <div class="carousel-caption">
			              <h1>Make money !</h1>
			              <p>and better carousel...</p>
			            </div>
			          </div>
			        </div>
			      </div>
			      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
			      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			    </div><!-- /.carousel -->
			    
			    <div>
			    	<p>You are already registered ?</p>
			    	<g:link controller="login" action="auth" class="btn btn-success">Login</g:link>
			    </div>
			</sec:ifNotLoggedIn>
			
			
			
			<sec:ifLoggedIn roles="ROLE_USER">
				<div ng-view></div>
			</sec:ifLoggedIn>
		</div>

		<div class="mastfoot">
			<div class="inner">
				<p>
					Cover template for <a href="http://getbootstrap.com">Bootstrap</a>,
					by <a href="https://twitter.com/mdo">@mdo</a>.
				</p>
			</div>
		</div>
	
	</body>
	
</html>
