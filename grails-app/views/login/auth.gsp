<!DOCTYPE html>
<html>
	<head>
		<meta name='layout' content='main'/>
		
		<title><g:message code="springSecurity.login.title"/></title>
		
		<r:require module="application"/>
		
	</head>
	
	<body>
	
		<!-- ALERT AREA -->
		<g:if test='${flash.message}'>
			<div class="alert alert-danger fade in">
		      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		      <div class="textNoShadow">
		      	<span>${flash.message}</span>
		      </div>
		    </div>
	    </g:if>
		
		<sec:ifNotLoggedIn roles="ROLE_USER">
			<h2 class="cover-heading">Please connect</h2>
			<form class="inner"
				id="loginForm"
				action='${request.contextPath}/j_spring_security_check'
				method='POST'>
				<!-- NOT logged -->
				<div class="form-group">
					<input id='username' name='j_username'
							type="text" placeholder="Email" class="form-control">
				</div>
				<div class="form-group">
					<input id='password' name='j_password'
							type="password" placeholder="Password" class="form-control">
				</div>
				<div class="form-group">
					<button type="submit" id="submit" class="btn btn-success">
						${message(code: "springSecurity.login.button")}
					</button>
				</div>
				<div class="form-group">
					<div style="height: 2px; background-color: lightgrey; text-align: center">
					  <span style="background-color: #424; position: relative; top: -0.7em;"><b>OR</b></span>
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-success">Facebook</button>
				</div>
			</form>
		</sec:ifNotLoggedIn>
		<sec:ifLoggedIn>
			You are logged
		</sec:ifLoggedIn>
		<script type='text/javascript'>
			<!--
			(function() {
				document.forms['loginForm'].elements['email'].focus();
			})();
			// -->
		</script>
	</body>
</html>
