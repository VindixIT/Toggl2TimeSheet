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
    	var deferred = $q.defer();
	   	var discoveryUrl =
	        'https://sheets.googleapis.com/$discovery/rest?version=v4';
	    
	   	gapi.client.load(discoveryUrl).then(getAbas);
		
	   	alert(togglForm.url);
		
	    function getAbas(){
        	var request = gapi.client.sheets.spreadsheets.get({
                spreadsheetId: '1YyfBSAAVRznTFGMzEs6sY0NkmN7D26hyNySpwpfD9MA',
                includeGridData: true
            });
        	request.execute(function(resp) {
        		deferred.resolve(resp);
        	});
       	}
	    return deferred.promise; 
    }

}]);