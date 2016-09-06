'use strict';
 
angular.module('myApp').factory('TogglService', ['$http', '$q', function($http, $q){
 
    var REST_SERVICE_URI = 'http://localhost:8080/Toggl2TimeSheet/toggl/';
 
    var factory = {
    	fetchTimeEntries: fetchTimeEntries
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

}]);