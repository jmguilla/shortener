// Main controller
var shortener = angular.module("shortener", [
    "ngRoute", "shortenerControllers","shortenerServices", "shortenerFilters"
]);

shortener.config(["$routeProvider",
    function($routeProvider){
	
		$routeProvider.
	  	when('/', {templateUrl: 'partials/main.html', controller: 'MainCtrl'}).
	    when('/userParams', {templateUrl: 'partials/userParams.html', controller: 'UserCtrl'}).
	    otherwise({redirectTo: '/'});
	
    }
    
]);

