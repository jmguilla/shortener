var shortenerServices = angular.module("shortenerServices", ["ngResource"]);

shortenerServices.factory('User', function($resource){
	return $resource('/user/:actionId/:userId', {actionId: '', userId: '@id'}, {
		getUser: {
			method: 'GET',
			params: {
				actionId: 'getUser'
			},
			headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
			}
		},
		
		updatePWD: {
			method: 'POST',
			params: {
				actionId: 'updatePWD'
			},
			headers: {
	  			'Content-Type': 'application/json',
	  			'Accept': 'application/json'
			}
		},
		
		getAllUrls: {
			method: 'GET',
			params: {
				actionId: 'getAllUrls'
			},
			headers: {
	  			'Content-Type': 'application/json',
	  			'Accept': 'application/json'
			},
			isArray:true
		},
		
		register: {
			method: 'POST',
			params: {
				actionId: 'create'
			},
			headers: {
	  			'Content-Type': 'application/json',
	  			'Accept': 'application/json'
			}
		}
	});
})

shortenerServices.factory('Alert', function($rootScope, $timeout){
	return {
	    addAlert: function(alert, timeout) {
	    	if(timeout == undefined || timeout == null){
	    		timeout = 3000;
	    	}
	    	$rootScope.alerts.push(alert);

	    	if(timeout > 0){
				$timeout(function(){
					$rootScope.alerts.splice($rootScope.alerts.indexOf(alert), 1);
				}, timeout);
	    	}
	     },
	
		overrideDisplay: function(value) {
			$rootScope.alertTopDisplay = value;
		}
	  };
})

shortenerServices.factory('Shortener', function($resource){
	return $resource('/mapping/:actionId', {actionId:'', userID:'@id'}, {
		getShortenedUrl: {
			method: 'PUT',
			params: {
				actionId: 'create'
			},
			headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
			}
		},
	});
})