<div class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a href="/" class="navbar-brand">{{applicationName}}</a>
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target="#navbar-main">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" id="navbar-main">
			<ul class="nav navbar-nav">
				<!-- left side - nothing -->
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<sec:ifNotLoggedIn roles="ROLE_USER">
					<li class="${(controllerName == 'login' ) ? 'active' : ''}"><g:link
							controller="login" action="auth">Login</g:link></li>
					<li class="${(controllerName == 'user' ) ? 'active' : ''}"><g:link
							controller="user" action="create"> Register</g:link></li>
				</sec:ifNotLoggedIn>

				<sec:ifLoggedIn roles="ROLE_USER">
					<li class="${(controllerName == 'user' ) ? 'active' : ''}"><g:link
							controller="user" action="show">
							<span class="glyphicon glyphicon-user"></span> My Account</g:link></li>
					<li><g:link url="/j_spring_security_logout">Logout</g:link></li>
				</sec:ifLoggedIn>
			</ul>

		</div>
	</div>
</div>