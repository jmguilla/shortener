//Main controller
var shortenerControllers = angular.module("shortenerControllers", []);

shortenerControllers.controller("NavCtrl",
		function($scope, $location) {
			$scope.isActive = function (viewLocation) { 
				var pathe = $location.path();
//				console.log('path var ::::: ' + pathe);
//				console.log('param ::::: ' + viewLocation);
		        return viewLocation === $location.path();
		    };
		    // Watch for the $location
		    scope.$watch(function() {
		    	return $location.path();
		    }, function(newValue, oldValue) {
		    	console.log("old value : " + oldValue)
		    }
		    )
		}
);

shortenerControllers.controller("MainCtrl",
		function($scope, Shortener) {
			$scope.applicationName = "Shaddy";
			
			$scope.currentShortUrl = "";
			
			$scope.shortenUrl = function(longUrl){
				Shortener.getShortenedUrl({target: $scope.longUrlText},
						function(data, headers){
								console.log("shorten url : " + longUrl);
								$scope.currentShortUrl = data.result;
						},
						function(httpResponse){
							console.log("problem shortening url : " + longUrl);
							$scope.alerts.push({type: 'danger', content: 'Un probleme s\'est produit: ' + httpResponse.data});
						}
					);
			}
			
			$scope.copyShortUrl = function(text){
				$('#copyModal').modal('toggle');
			}
			
		}
);

shortenerControllers.controller("UserCtrl",
		function($scope, User) {
			console.log("userCtrl create");
			User.getUser({},
					function(data, headers){
						console.log("get user : " + data.user);
						$scope.user = data.user;
					},
					function(httpResponse){
						console.log("problem get user");
						$scope.alerts.push({type: 'danger', content: 'Un probleme s\'est produit: ' + httpResponse.data});
					});
		}
);


