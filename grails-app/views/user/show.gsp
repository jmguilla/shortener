<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		
		<title>Shaddy</title>
		
		<r:require module="application" />
	
	</head>
	<body>
		<div class="container"
				ng-controller="UserCtrl">
			<div class="row">
				<div class="col-lg-6 col-lg-offset-3">					
					<div class="well bs-component">
						<form class="form-horizontal">
						
							<div class="form-group">
								<label for="email" class="col-lg-2 control-label">Email</label>
								<div class="col-lg-10">
									<input type="email"
										class="form-control" id="email" placeholder=""
										value="{{user.email}}">
								</div>
							</div>
							<div class="form-group">
								<label for="username" class="col-lg-2 control-label">UserName</label>
								<div class="col-lg-10">
									<input type="text"
										class="form-control" id="username" value="{{user.username}}">
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-success">Save changes</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>