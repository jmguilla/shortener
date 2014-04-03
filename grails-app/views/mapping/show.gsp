<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="account" />
		
		<title>Shaddy - Account</title>
		
		<r:require module="application" />
		
	</head>
	<body>
		<div ng-controller="MappingCtrl" ng-init="initDetailView('${shortId}')">
			<div class="col-lg-10">
				<div class="panel panel-default"
					 ng-show="currentMapping != null">
					<div class="panel-heading">{{currentMapping.id}}</div>
					
					<div class="panel-body">
				    	<div>
				    		<a href="{{currentMapping.target}}">{{currentMapping.target}}</a>
				    	</div>
						<div class="well">{{currentMapping.description}}</div>
				    	<div>shortUrl edit TODO: {{currentMapping.shortUrl}}</div>
				    	<div>{{currentMapping.numClicks}} clicks TODO</div>
				    	<div>Created {{currentMapping.creationDate}} TODO</div>
				    	
				    	<hr/>
				    	
				    	<div id="statsPanel">
				    		<div id="statsFilters">
				    			filters
				    		</div>
				    		<div id="statsChart" g-chart>
				    		</div>
				    		
				    	</div>
				    	
					</div>
					
				</div>
			</div>
			
			
			<div ng-show="currentMapping == null">
				<div class="panel-heading">Not available</div>
			</div>
			
		</div>
	</body>

</html>