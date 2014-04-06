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
	    	// verify alert coherence
	    	if(!alert.type){
	    		alert.type="danger"
	    	}
	    	if(!alert.content){
	    		alert.content="An error occured."
	    	}
	    	
	    	if(!timeout){
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
		},
	     
	    clear: function() {
	    	$rootScope.alerts = [];
	    }
	  };
})

shortenerServices.factory('Mapping', function($resource){
	return $resource('/mapping/:actionId', {actionId:'', userID:'@id'}, {
		create: {
			method: 'PUT',
			params: {
				actionId: 'create'
			},
			headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
			}
		},
		
		retrieve: {
			method: 'GET',
			params: {
				actionId: 'retrieve',
				format: 'json'
			},
			headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
			}
		},
		
		retrieveAll: {
			method: 'GET',
			params: {
				actionId: 'retrieveAll'
			},
			headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
			}
		},
		
		getAllStats: {
			method: 'GET',
			params: {
				actionId: 'stats'
			},
			headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
			}
		},
		
		getAllRetribution: {
			method: 'GET',
			params: {
				actionId: 'remuneration'
			},
			headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
			}
		}
	});
})