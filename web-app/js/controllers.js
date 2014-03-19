//Main controller
var shortenerControllers = angular.module("shortenerControllers", []);

shortenerControllers.controller("MainCtrl",
		function($scope, $rootScope, Shortener, Alert) {
			
			$rootScope.applicationName = "Shaddy";
			// store alerts in a single place, the $rootScope, accessed by service Alert
			$rootScope.alerts = [];
			$rootScope.alertTopDisplay = true;
			
			$scope.isCollapsed = true;
			$scope.currentShortUrl = "";
			
			$scope.shortenUrl = function(longUrl){
				if($scope.longUrlText != null && $scope.longUrlText != undefined && $scope.longUrlText != ""){
					Shortener.getShortenedUrl({target: $scope.longUrlText},
						function(data, headers){
							$scope.currentShortUrl = data.result;
							$scope.isCollapsed = false;
						},
						function(httpResponse){
							Alert.addAlert({type: httpResponse.data.alert, content:msg + httpResponse.data.message});
						}
					);
				}
				else{
					Alert.addAlert({type: 'danger', content:'You must provide an url !'});
				}
			}
			
			$scope.clearResult = function(){
				$scope.currentShortUrl = '';
				$scope.longUrlText = '';
			}
			
		}
);

shortenerControllers.controller("UserCtrl",
		function($scope, $modal, User, Shaddytem, Alert, $rootScope) {
			
			
			User.getUser({},
				function(data, headers){
					$scope.user = data.user;
					if($scope.user != null){
						$scope.shaddytems = Shaddytem.getListForUser({userId:$scope.user.email},
							function(data, headers){
								// RAS
							},
							function(httpResponse){
								Alert.addAlert({type: httpResponse.data.alert, content:httpResponse.data.message});
							}
						);
					}
					else{
						Alert.addAlert({type: 'danger', content:'An error occurred while retrieving your url'});
					}
				},
				function(httpResponse){
					Alert.addAlert({type: httpResponse.data.alert, content:httpResponse.data.message});
				});
			
			
			$scope.register = function(email, password){
				if(email == undefined)
					email = null;
				if(password == undefined)
					password = null;
				User.register({email:email, pwd:password},
					function(data, headers){
						// redirect to main page
						Alert.addAlert({type: data.alert, content:data.message}, -1);
					},
					function(httpResponse){
						Alert.addAlert({type: httpResponse.data.alert, content:httpResponse.data.message});
					}
				);
			}
			
			$scope.updatePWD = function(current, newPWD, newPWDAgain){
				console.log("upd");
				User.updatePWD({current:current, newPWD:newPWD, newPWDAgain:newPWDAgain},
					function(data, headers){
						// reset fields
						$scope.currentPWD = "";
						$scope.newPWD = "";
						$scope.newPWDAgain = "";
						
						if($scope.modalPWD != null){
							$scope.modalPWD.close("ok");
						}

						Alert.addAlert({type: data.alert, content:data.message});
					},
					function(httpResponse){
						Alert.addAlert({type: httpResponse.data.alert, content:httpResponse.data.message});
					});	
			}
			
			$scope.openPWDModal = function () {
				
				Alert.overrideDisplay(false);
				
				var ModalInstanceCtrl = function ($scope, $modalInstance) {
					
					$scope.ok = function (currentPWD, newPWD, newPWDAgain) {
						$scope.updatePWD(currentPWD, newPWD, newPWDAgain)
					};
					
					$scope.cancel = function () {
						$modalInstance.dismiss(false);
					};
				};

				$scope.modalPWD = $modal.open({
					templateUrl: '/partials/user/modal_PWDChange.html',
					controller: ModalInstanceCtrl,
					scope: $scope
				});
				
				$scope.modalPWD.result.then(
						function () {
							Alert.overrideDisplay(true);
						}, 
						function () {
							Alert.overrideDisplay(true);
						});
			};
		}
);

