//Main controller
var shortenerControllers = angular.module("shortenerControllers", []);

shortenerControllers.controller("MainCtrl",
		function($scope, Shortener, $timeout) {
			$scope.applicationName = "Shaddy";
			
			$scope.alerts = [];
			
			$scope.currentShortUrl = "";
			
			$scope.shortenUrl = function(longUrl){
				
				if($scope.longUrlText != null && $scope.longUrlText != undefined && $scope.longUrlText != ""){
					Shortener.getShortenedUrl({target: $scope.longUrlText},
						function(data, headers){
								$scope.currentShortUrl = data.result;
						},
						function(httpResponse){
							$scope.addAlert('danger', 'Un probleme s\'est produit: ' + httpResponse.data, 4000);
						}
					);
				}
				else{
					$scope.addAlert('danger', 'You must provide an url', 3000);
				}
			}
			
			$scope.copyShortUrl = function(text){
				$('#copyModal').modal('toggle');
			}

			/**
			 * Add an alert removed automatically
			 */
			$scope.addAlert = function(type, message, timeout) {
				
				var alert = {type:type, content:message};    
				$scope.alerts.push(alert);
				
				if (!timeout) {
					timeout = 3000;
				}
				$timeout(function(){
					$scope.closeAlert($scope.alerts.indexOf(alert));
				}, timeout);
			};

			$scope.closeAlert = function(index) {
				$scope.alerts.splice(index, 1);
			};
			
		}
);

shortenerControllers.controller("UserCtrl",
		function($scope, User) {
	
			User.getUser({},
					function(data, headers){
						console.log("get user : " + data.user);
						$scope.user = data.user;
					},
					function(httpResponse){
						console.log("problem get user");
						$scope.alerts.push({type: 'danger', content: 'Erreur : ' + httpResponse.data});
					});
			
			$scope.updatePWD = function(current, newPWD, newPWDAgain){
				User.updatePWD({current:current, newPWD:newPWD, newPWDAgain:newPWDAgain},
					function(data, headers){
						$scope.handleHTTPResponse(data);
						// reset fields
						$scope.currentPWD = "";
						$scope.newPWD = "";
						$scope.newPWDAgain = "";
					},
					function(httpResponse){
						$scope.handleHTTPResponse(httpResponse.data, "Erreur : ");
					});	
			}
			
			$scope.handleHTTPResponse = function(data, msg){
				if(!msg) msg = '';
				$scope.alerts.push({type: data.alert, content:msg + data.message});
			}
		}
);


