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
	href='https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.1/angular-material.css'>
<style>
.datepickerdemoBasicUsage {
	/** Demo styles for mdCalendar. */
	
}

.datepickerdemoBasicUsage md-content {
	padding-bottom: 200px;
}
</style>
<script type="text/javascript">
	window.console = window.console || function(t) {
	};
	var url = 'https://docs.google.com/spreadsheets/d/1facRQohuorKLp4zd4FybIeZkEUz_EdtZMcMY6WJbp8I/edit#gid=0';
	var clientId = '521236566498-56aiij0qacfflsf9fd7ct1fqoju2apnp.apps.googleusercontent.com';
	var apiKey = 'AIzaSyAXuaq2t-LqOiH_Qsk6P5Nse5Eubv9Ofs0';
	var scopes = ["https://spreadsheets.google.com/feeds","https://www.googleapis.com/auth/plus.me"];
	
	function handleClientLoad() {
        gapi.client.setApiKey(apiKey);
        window.setTimeout(checkAuth,1);
    }
	
	function checkAuth() {
        gapi.auth.authorize({client_id: clientId, scope: scopes, immediate: false}, handleAuthResult);
    }
	
	function handleAuthResult(authResult) {
		var nome;
       	gapi.client.load('plus', 'v1', function() {
               var request = gapi.client.plus.people.get({
                 'userId': 'me'
               });
               request.execute(function(resp) {
                 var heading = document.createElement('h10');
                 var image = document.createElement('img');
                 image.src = resp.image.url;
                 heading.appendChild(image);
                 nome = resp.displayName;
                 heading.appendChild(document.createTextNode(nome));
                 document.getElementById('content').appendChild(heading);
               });
             });

    }
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
				<span style="alignment: right" id="content"></span>
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
								<input type="text" ng-model="ctrl.togglForm.url" id="url"
									class="url form-control input-sm" placeholder="Informe a URL"
									required ng-minlength="3" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="url">Selecione a aba que deseja exportar</label>
							<div class="col-md-7">
							<md-card>
							<md-card-content>
								<md-input-container> 
									<label>Abas</label> 
									<md-select ng-model="ctrl.abas"> 
										<md-option> <em>Nenhuma</em></md-option>
										<md-option ng-repeat="aba in ctrl.abas" ng-value="aba.properties.title"> {{aba.properties.title}} </md-option> 
									</md-select> 
								</md-input-container>
							</md-card-content>
							</md-card>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-actions floatRight">
							<button type="button" ng-click="ctrl.submit()"
								class="btn btn-primary btn-sm">Pesquisar</button>
							<button type="button" ng-click="ctrl.exportar()" 
								class="btn btn-primary btn-sm">Exportar</button>
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
		src="https://cdnjs.cloudflare.com/ajax/libs/angular-moment/0.9.0/angular-moment.min.js"></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.1/angular-material.js'></script>
	<script src="<c:url value='/static/js/cache/assets-cache.js' />"></script>
	<script src="<c:url value='/static/js/service/toggl_service.js' />"></script>
	<script src="<c:url value='/static/js/controller/toggl_controller.js' />"></script>
    <script src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>
</body>
</html>

