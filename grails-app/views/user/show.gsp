<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="userParams" />
		
		<title>Shaddy - Informations</title>
		
		<r:require module="application" />
	
	</head>
	<body>
		<form class="form-horizontal">
			
			<!-- PASSWORD -->
			<div class="well">
				<div class="form-group">
					<label for="password" class="col-lg-2 control-label">Password</label>
					<div class="col-lg-10">
						<button type="submit" class="btn btn-primary" 
								data-toggle="modal" data-target="#PWDModal">Change</button>
					</div>
					
					<!-- PWD Modal Window -->
					<!-- TODO : add alert in the modal, close it only on success => use angular ui dialog -->
					<div class="modal fade" id="PWDModal" tabindex="-1" role="dialog" 
							aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title" id="myModalLabel">Change Password</h4>
					      </div>
					      <div class="modal-body">
					        	<div class="form-group">
									<label for="currentPWDText" class="col-lg-2 control-label">Current</label>
									<div class="col-lg-10">
										<input type="password"
											class="form-control" id="currentPWDText" ng-model="currentPWD" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="newPWDText" class="col-lg-2 control-label">New</label>
									<div class="col-lg-10">
										<input type="password"
											class="form-control" id="newPWDText" ng-model="newPWD">
									</div>
								</div>
								<div class="form-group">
									<label for="newPWDAgainText" class="col-lg-2 control-label">Confirm</label>
									<div class="col-lg-10">
										<input type="password"
											class="form-control" id="newPWDAgainText" ng-model="newPWDAgain">
									</div>
								</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary" data-dismiss="modal"
					        		ng-click="updatePWD(currentPWD, newPWD, newPWDAgain)">Validate</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- END PWD Modal Window -->
					
				</div>
			</div>
			
			<!-- INFORMATIONS -->
			<div class="well">
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
					<button type="submit" class="btn btn-lg btn-success">Save changes</button>
				</div>
			</div>
			
		</form>
	</body>

</html>