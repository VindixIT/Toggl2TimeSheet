<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Toggl 2 TimeSheet</title>
<link rel='stylesheet prefetch'
	href='https://gitcdn.xyz/repo/angular/bower-material/v0.11.0-master-46c7b18/angular-material.css'>
<style>
.datepickerdemoBasicUsage {
	/** Demo styles for mdCalendar. */
	
}

.datepickerdemoBasicUsage md-content {
	padding-bottom: 200px;
}
</style>
<script>
	window.console = window.console || function(t) {
	};
</script>

<style>
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body translate="no" ng-app="myApp" class="ng-cloak"
	ng-controller="TogglController as ctrl">
	<div class="generic-container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Toggl 2 TimeSheet</span>
			</div>
			<div class="formcontainer">
				<form name="myForm" method="get" action="toggl.do"
					class="form-horizontal">
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="username">Username</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.togglForm.username"
									id="username" class="form-control input-sm"
									placeholder="Informe o seu username do Toggl" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="password">Password</label>
							<div class="col-md-7">
								<input type="password" ng-model="ctrl.togglForm.password"
									id="password" class="password form-control input-sm"
									placeholder="Informe a sua senha do Toggl" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="start">Data
								Inicial</label>
							<div class="col-md-7">
								<md-content> <md-datepicker
									ng-model="ctrl.togglForm.start" md-placeholder="Início"
									id="start"></md-datepicker> </md-content>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="end">Data
								Final</label>
							<div class="col-md-7">
								<md-content> <md-datepicker
									ng-model="ctrl.togglForm.end" md-placeholder="Término" id="end"></md-datepicker>
								</md-content>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="url">URL da
								Planilha de Controle de Horas</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl2.togglForm.url" id="url"
									class="url form-control input-sm" placeholder="Informe a URL"
									required ng-minlength="3" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-actions floatRight">
							<button type="button" ng-click="ctrl.submit()"
								class="btn btn-primary btn-sm">Pesquisar</button>
							<input type="submit" value="Exportar"
								class="btn btn-primary btn-sm">
							<button type="button" ng-click="ctrl.reset()"
								class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Time Entries</span>
			</div>
			<div class="tablecontainer">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Descrição</th>
							<th>Início</th>
							<th>Término</th>
							<th>Duração</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="t in ctrl.timeEntries">
							<td><span ng-bind="t.description"></span></td>
							<td><span ng-bind="t.start"></span></td>
							<td><span ng-bind="t.stop"></span></td>
							<td><span ng-bind="t.duration"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script
		src="//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
	<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/angular-moment/0.9.0/angular-moment.min.js"></script>
	<script
		src='https://gitcdn.xyz/repo/angular/bower-material/v0.11.0-master-46c7b18/angular-material.js'></script>
	<script src="<c:url value='/static/js/cache/assets-cache.js' />"></script>
	<script src="<c:url value='/static/js/service/toggl_service.js' />"></script>
	<script
		src="<c:url value='/static/js/controller/toggl_controller.js' />"></script>
</body>
</html>

