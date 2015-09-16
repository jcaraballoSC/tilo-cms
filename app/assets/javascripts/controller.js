var app = angular.module("dashboard", ['ngResource']);
app.controller("status-server", ["$scope", "$http", "$interval", function($scope,$http,$interval){

var llamada = function(){
	    $http({method : 'GET',url : 'https://api.newrelic.com/v2/servers.json', headers: { 'X-Api-Key':'a2b31b482b1dee0393b885e8e3703864d487a424965b772'}})
	        .success(function(data, status) {
	            $scope.items = data;
	            console.log(data);
	        })
}

llamada();
$interval(llamada, 5000);

}]);


