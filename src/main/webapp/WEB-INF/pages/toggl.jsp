<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">


    <title>Toggl2TimeSheet</title>
    
    
    
    <link rel='stylesheet prefetch' href='https://gitcdn.xyz/repo/angular/bower-material/v0.11.0-master-46c7b18/angular-material.css'>

        <style>
      .datepickerdemoBasicUsage {
  /** Demo styles for mdCalendar. */ }
  .datepickerdemoBasicUsage md-content {
    padding-bottom: 200px; }

    </style>

    <script>
  window.console = window.console || function(t) {};
</script>

    
    
  </head>

  <body translate="no" ng-app="MyApp" ng-controller="AppCtrl">
  	<div style="left: 40px;" class="datepickerdemoBasicUsage">
  	<h1>Toggl2TimeSheet</h1>
  	</div>

    <div  style="padding: 40px;" class="datepickerdemoBasicUsage">
	  <md-content>
	
	    <h4>Data Inicial</h4>
	    <md-datepicker ng-model="startDate" md-placeholder="Início"></md-datepicker>
	
	    <h4>Data Final</h4>
	    <md-datepicker ng-model="endDate" md-placeholder="Fim"></md-datepicker>
	    
	  </md-content>
	</div>
    <script src="//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
	<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/angular-moment/0.9.0/angular-moment.min.js"></script>
	<script src='https://gitcdn.xyz/repo/angular/bower-material/v0.11.0-master-46c7b18/angular-material.js'></script>
	<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/assets-cache.js"></script>
    <script type="text/javascript">
					angular.module('MyApp').controller('AppCtrl',
							function($scope) {
							}).config(
							function($mdDateLocaleProvider) {
								$mdDateLocaleProvider.formatDate = function(
										date) {
									return !date ? '' : moment(date).format(
											'DD/MM/YYYY');
								};
							});
					
				</script>
    
  </body>
</html>
 
