/* Directives */


var shortenerDirectives = angular.module('shortenerDirectives', []);

/**
 * Directive affectant les donn�es "chart" pr�sentes dans le scope
 */
shortenerDirectives.directive('gChart', 
	function () {
		return {
			restrict: 'A',
			link: function($scope, elm, attrs) {
				$scope.$watch('chart', function() {
					var chart = new google.visualization.LineChart(elm[0]);
					chart.draw($scope.chart.data, $scope.chart.options);
				},true);
			}
		};
	}
);