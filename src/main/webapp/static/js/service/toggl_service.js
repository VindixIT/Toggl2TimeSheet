'use strict';
 
angular.module('myApp').factory('TogglService', ['$http', '$q', function($http, $q){
 
    var REST_SERVICE_URI = 'http://localhost:8080/Toggl2TimeSheet/toggl/';
 
    var factory = {
    	fetchTimeEntries: fetchTimeEntries,
    	exportTimeEntries: exportTimeEntries,
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
    
    function exportTimeEntries(togglForm, timeEntries) {
       	var discoveryUrl =
            'https://sheets.googleapis.com/$discovery/rest?version=v4';
        gapi.client.load(discoveryUrl).then(atualizar);
        function atualizar(){
        	gapi.client.sheets.spreadsheets.values.update({
                spreadsheetId: togglForm.sheetId,
                range: togglForm.abaSelecionada+'!B3',
                valueInputOption: 'USER_ENTERED',
                values: [ [ 'MASARU' ] ]
            }).then(function(response) {
                console.log(response);
            });
       	}
       	window.open(togglForm.url);
    }
    
    
    function fetchAbas(togglForm) {
    	var deferred = $q.defer();
	   	var discoveryUrl = 'https://sheets.googleapis.com/$discovery/rest?version=v4';
	    
	   	gapi.client.load(discoveryUrl).then(getAbas);
		
	    function getAbas(){
        	var request = gapi.client.sheets.spreadsheets.get({
                spreadsheetId: togglForm.sheetId,
                includeGridData: true
            });
        	request.execute(function(resp) {
        		deferred.resolve(resp);
        	});
       	}
	    return deferred.promise; 
    }

}]);