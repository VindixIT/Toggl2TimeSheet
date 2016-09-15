'use strict';
 
angular.module('myApp').controller('TogglController', ['$scope', 'TogglService', function($scope, TogglService) {
    var self = this;
    self.togglForm={url:'',username:'',password:'',start:'',end:''};
    self.timeEntries=[];
    self.abas=[];
 
    self.submit = submit;
    self.exportar = exportar;
    self.reset = reset;
 
    function fetchTimeEntries(togglForm){
        TogglService.fetchTimeEntries(togglForm)
            .then(
            function(d) {
                self.timeEntries = d.timeEntries;
            },
            function(errResponse){
                console.error('Error while fetching Time Entries');
            }
        );
    }

    function submit() {
        console.log('Fetching Time Entries', self.togglForm);
        fetchTimeEntries(self.togglForm);
    }
 
    function exportar() {
    	TogglService.fetchAbas(self.togglForm)
    		.then(
            function(d) {
            	self.abas = d.sheets;
            });
    }
    
    function reset(){
        self.togglForm={url:'',username:'',password:'',start:'',end:''};
        $scope.myForm.$setPristine(); //reset Form
    }
 
}]).config(function($mdDateLocaleProvider) {
	$mdDateLocaleProvider.formatDate = function(date) {
		return !date ? '' : moment(date).format('DD/MM/YYYY');
	};
});