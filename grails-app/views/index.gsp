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
		</div>

	</body>
	
</html>
