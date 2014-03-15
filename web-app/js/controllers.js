//Main controller
var shortenerControllers = angular.module("shortenerControllers", []);

shortenerControllers.controller("MainCtrl",
		function($scope, Shortener) {
			$scope.applicationName = "Shaddy";
			
			$scope.currentShortUrl = "";
			
			$scope.shortenUrl = function(longUrl){
				if($scope.longUrlText != null && $scope.longUrlText != undefined){
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
				else{
					$scope.alerts.push({type: 'danger', content: 'url is empty'});
				}
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


