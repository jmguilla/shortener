//Main controller
var shortenerControllers = angular.module("shortenerControllers", []);

shortenerControllers.controller("MainCtrl",
		function($scope, Shortener) {
			$scope.applicationName = "Shortney";
			
			$scope.currentShortUrl = "";
			
			$scope.shortenUrl = function(longUrl){
				Shortener.getShortenedUrl({},
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
				window.prompt("Copy to clipboard: Ctrl+C, Enter", text);
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


