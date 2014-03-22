<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="account" />
		
		<title>Shaddy - Account</title>
		
		<r:require module="application" />
	
	</head>
	<body>
		<div ng-controller="ShaddytemCtrl" ng-init="initDetailView(${shaddytemId})">
			<div ng-show="currentShaddytem != null">
				Detail of : {{currentShaddytem.id}}
			</div>
			<div ng-show="currentShaddytem == null">
				Details not available
			</div>
		</div>
	</body>

</html>