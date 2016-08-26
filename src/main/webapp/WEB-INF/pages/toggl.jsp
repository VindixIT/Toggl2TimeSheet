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
    <div  style="padding: 40px;" class="datepickerdemoBasicUsage">
  	<h2>Toggl2TimeSheet</h2>
		<form action="toggl" method="post">
			<h4>URL da Planilha de Controle de Horas:</h4> 
			<input
				type="text" size="80" name="id" id="id"
				value="https://docs.google.com/spreadsheets/d/1JiknYifrwqkvuSQY1iebe0-ivEkURtM03DByjvIVLEk/edit#gid=23"
				class="url" />
			<button type=submit>Gerar</button>
			<br>
			<h4>Toggl Credentials:</h4> 
			<input
				type="text" size="30" name="login" id="login"
				value="masaru@logusinfo.com.br"
				class="url" />
			<br>
			<input
				type="password" size="30" name="senha" id="senha"
				value=""
				class="url" />
			<br>
		</form>
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
 
