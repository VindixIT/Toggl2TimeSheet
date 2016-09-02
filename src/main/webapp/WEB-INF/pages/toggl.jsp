<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Toggl 2 TimeSheet</title>
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

<style>
.username.ng-valid {
	background-color: lightgreen;
}

.username.ng-dirty.ng-invalid-required {
	background-color: red;
}

.username.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.email.ng-valid {
	background-color: lightgreen;
}

.email.ng-dirty.ng-invalid-required {
	background-color: red;
}

.email.ng-dirty.ng-invalid-email {
	background-color: yellow;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body ng-app="myApp" class="ng-cloak"  ng-controller="UserController as ctrl">
	<div class="generic-container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Toggl 2 TimeSheet</span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm"
					class="form-horizontal">
					<input type="hidden" ng-model="ctrl.user.id" />
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="uname">URL da
								Planilha de Controle de Horas</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.username" id="uname"
									class="username form-control input-sm"
									placeholder="Informe a URL" required ng-minlength="3" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.uname.$error.required">This is a
										required field</span> <span ng-show="myForm.uname.$error.minlength">Minimum
										length required is 3</span> <span ng-show="myForm.uname.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="address">Login</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.address" id="address"
									class="form-control input-sm"
									placeholder="Informe o seu Login do Toggl" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="email">Senha</label>
							<div class="col-md-7">
								<input type="email" ng-model="ctrl.user.email" id="email"
									class="email form-control input-sm"
									placeholder="Informe a sua senha do Toggl" required />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.email.$error.required">This is a
										required field</span> <span ng-show="myForm.email.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="email">Data Inicial</label>
							<div class="col-md-7">
								<md-content>
									<md-datepicker ng-model="ctrl.user.email" md-placeholder="Início"></md-datepicker>
								</md-content>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="Gerar" class="btn btn-primary btn-sm">
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
							<th>Dia</th>
							<th>In</th>
							<th>Out</th>
							<th>Duração</th>
							<th width="20%"></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="u in ctrl.users">
							<td><span ng-bind="u.username"></span></td>
							<td><span ng-bind="u.address"></span></td>
							<td><span ng-bind="u.email"></span></td>
							<td><span ng-bind="u.email"></span></td>
							<td>
								<button type="button" ng-click="ctrl.edit(u.id)"
									class="btn btn-success custom-width">Edit</button>
								<button type="button" ng-click="ctrl.remove(u.id)"
									class="btn btn-danger custom-width">Remove</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/user_service.js' />"></script>
	<script	src="<c:url value='/static/js/controller/user_controller.js' />"></script>
	<script	src="//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
	<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/angular-moment/0.9.0/angular-moment.min.js"></script>
	<script	src='https://gitcdn.xyz/repo/angular/bower-material/v0.11.0-master-46c7b18/angular-material.js'></script>
	<script	src="<c:url value='/static/js/cache/assets-cache.js' />"></script>
    <script type="text/javascript">
					angular.module('myApp').controller('UserController',
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