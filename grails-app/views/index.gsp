<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		
		<title>Shorteney</title>
		
		<r:require module="application"/>
		
	</head>
	<body>

		<div class="site-wrapper">
	
			<div class="site-wrapper-inner">
	
				<div class="cover-container">
	
					<div class="masthead clearfix">
						<div class="inner">
							<h3 class="masthead-brand">{{applicationName}}</h3>
				            <ul class="nav masthead-nav">
								<li><a href="#"><span
											class="glyphicon glyphicon-home"></span> Home</a></li>
								<sec:ifLoggedIn roles="ROLE_USER">
									<li><a href="#/userParams"><span
											class="glyphicon glyphicon-wrench"></span> My Account</a></li>
									<li><g:link controller="logout" action="index">Logout</g:link></li>
								</sec:ifLoggedIn>
							</ul>
						</div>
					</div>
	
					<div class="inner cover">
					<sec:ifNotLoggedIn roles="ROLE_USER">
						<form class="inner"
							action='${request.contextPath}/j_spring_security_check'
							method='POST'>
							<!-- NOT logged -->
								<h2 class="help-block">Please connect to use the service :</h2>
								<div class="form-group">
									<input type="text" placeholder="Email" class="form-control"
										id='username' name='j_username'>
								</div>
								<div class="form-group">
									<input type="password" placeholder="Password"
										class="form-control" id='password' name='j_password'>
								</div>
								<button type="submit" id="submit" class="btn btn-success">
									${message(code: "springSecurity.login.button")}
								</button>
					</form>
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
	
				</div>
			</div>
		</div>


	</body>
	
</html>
