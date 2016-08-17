<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Toggl2TimeSheet</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
body {
	font-family: sans-serif;
	font-size: 1em;
	color: #333;
	background-color: #fff;
}

label {
	clear: both;
	display: block;
	font-size: 0.85em;
	font-weight: bold;
	padding: 0.8em 0 0.2em 0;
	user-select: none;
}

button {
	float: left;
	font-size: 1em;
	padding: 3px 6px;
	margin: 0;
	border: 1px solid #333;
	outline: 0;
	box-shadow: none;
}

input {
	width: 2em;
}

::-moz-focus-inner {
	padding: 0;
	border: 0;
}

.url {
	width: 40em;
	background-color: #fff;
	border-right: 0 none;
	border-radius: 3px 0 0 3px;
}

button {
	width: 5em;
	position: relative;
	background-color: #aaa;
	border-radius: 0 3px 3px 3px;
	cursor: pointer;
}

.copied::after {
	position: absolute;
	top: 12%;
	right: 110%;
	display: block;
	content: "copied";
	font-size: 0.75em;
	padding: 2px 3px;
	color: #fff;
	background-color: #000;
	border-radius: 3px;
	opacity: 0;
	will-change: opacity, transform;
	animation: showcopied 1.5s ease;
}

.datepickerdemoBasicUsage {
	/** Demo styles for mdCalendar. */
	
}

.datepickerdemoBasicUsage md-content {
	padding-bottom: 200px;
}

.datepickerdemoBasicUsage .validation-messages {
	font-size: 12px;
	color: #dd2c00;
	margin: 10px 0 0 25px;
}

@
keyframes showcopied { 0% {
	opacity: 0;
	transform: translateX(100%);
}
70%
{
opacity






:



 



1;
transform






:



 



translateX






(0);
}
100%
{
opacity






:



 



0;
}
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Angular Material style sheet -->
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.0-rc2/angular-material.min.css">
</head>
<body onLoad="document.getElementById('id').focus()" ng-app="BlankApp"
	ng-cloak>
	<h1>Toggl 2 TimeSheet</h1>
		<h4>Start Date:</h4>
		<md-content> <md-datepicker ng-model="startDate"
			md-placeholder="Start Date"></md-datepicker> 
		<h4>End Date:</h4>
			<md-datepicker ng-model="endDate" md-placeholder="End Date"></md-datepicker> </md-content>
	<form action="toggl" method="post">
		<label>URL da Planilha de Controle de Horas:</label> 
			<input type="text" size="120" name="id" id="id" value="https://docs.google.com/spreadsheets/d/1JiknYifrwqkvuSQY1iebe0-ivEkURtM03DByjvIVLEk/edit#gid=23" class="url" />
			<br>			<br>
			<button type=submit>Gerar</button>
			<br>
	</form>
	<!-- Angular Material requires Angular.js Libraries -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-aria.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-messages.min.js"></script>

	<!-- Angular Material Library -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.0-rc2/angular-material.min.js"></script>

	<!-- Your application bootstrap  -->
	<script type="text/javascript">
		/**
		 * You must include the dependency on 'ngMaterial' 
		 */
		angular.module('BlankApp', [ 'ngMaterial' ]);

		angular.module('MyApp',
				[ 'ngMaterial', 'ngMessages', 'material.svgAssetsCache' ])
				.controller('AppCtrl', function($scope) {
					$scope.startDate = new Date();
					$scope.endDate = new Date();
				});
	</script>
</body>
</html>