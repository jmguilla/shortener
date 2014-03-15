<!-- ALERT AREA -->
<g:if test='${flash.message}'>
	<div class="alert alert-danger fade in">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		<div class="textNoShadow">
			<span>
				${flash.message}
			</span>
		</div>
	</div>
</g:if>
