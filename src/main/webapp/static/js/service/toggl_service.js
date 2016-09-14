'use strict';
 
angular.module('myApp').factory('TogglService', ['$http', '$q', function($http, $q){
 
    var REST_SERVICE_URI = 'http://localhost:8080/Toggl2TimeSheet/toggl/';
 
    var factory = {
    	fetchTimeEntries: fetchTimeEntries,
    	fetchAbas: fetchAbas
    };
 
    return factory;
 
    function fetchTimeEntries(togglForm) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, togglForm)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Time Entries');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    
    function fetchAbas(togglForm) {
	   	var discoveryUrl =
	        'https://sheets.googleapis.com/$discovery/rest?version=v4';
	    gapi.client.load(discoveryUrl).then(getAbas);
	    function getAbas(){
        	var request = gapi.client.sheets.spreadsheets.get({
                spreadsheetId: '1JiknYifrwqkvuSQY1iebe0-ivEkURtM03DByjvIVLEk',
                includeGridData: true
            });
        	
        	request.execute(function(resp) {
              var sheets = resp.sheets;
              var i = 0;
              while(sheets[i] != undefined){
            	  alert(sheets[i].properties.title);
            	  i++;
              }
        	});
       	}
    }

}]);