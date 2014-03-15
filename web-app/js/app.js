// Main controller
var shortener = angular.module("shortener", [
    "ngRoute", "shortenerControllers","shortenerServices", "shortenerFilters"
]);

/* no use for the moment
shortener.config(["$routeProvider",
    function($routeProvider){
	
		$routeProvider.
	  	when('/', {templateUrl: 'partials/main.html', controller: 'MainCtrl'}).
	    otherwise({redirectTo: '/'});
	
    }
    
]);
*/
