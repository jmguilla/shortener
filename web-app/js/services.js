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
		}
	});
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