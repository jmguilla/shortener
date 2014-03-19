<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="userParams" />
		
		<title>Shaddy - urls</title>
		
		<r:require module="application" />
	
	</head>
	<body>
		<div class="row">
		  <div class="col-lg-3 col-lg-offset-6 col-xs-6">
		      <input type="text" class="form-control" placeholder="Filter..." ng-model="searchText">
		  </div>
		  <div class="col-lg-3 col-xs-6">
		      <select ng-model="orderProp" class="form-control">
	                <option value="id">id</option>
	                <option value="numClick">Clicks</option>
	            </select>
		  </div>
		</div>
		
		<div class="row">
			<div class="table-responsive">
				<table class="table table-hover table-striped">
					<thead>
					  <tr>
					    <th>id</th>
					    <th>url</th>
					    <th>target</th>
					    <th>clicks</th>
					  </tr>
					</thead>
					<tr ng-repeat="shaddytem in shaddytems | filter:searchText | orderBy:orderProp">
	                    <td>{{shaddytem.id}}</td>
	                    <td>{{shaddytem.shortUrl}}</td>
	                    <td>{{shaddytem.longUrl}}</td>
	                    <td>{{shaddytem.numClicks}}</td>
	                </tr>
				</table>
			</div>
		</div>
	</body>

</html>