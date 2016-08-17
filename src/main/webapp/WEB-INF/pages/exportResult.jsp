<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<html>
<head>
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

textarea {
	float: left;
}

input, button {
	float: center;
	font-size: 1em;
	padding: 3px 6px;
	margin: 0;
	border: 1px solid #333;
	outline: 0;
	box-shadow: none;
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
	content: "copiado";
	font-size: 0.75em;
	padding: 2px 3px;
	color: #fff;
	background-color: #22a;
	border-radius: 3px;
	opacity: 0;
	will-change: opacity, transform;
	animation: showcopied 1.5s ease;
}

@keyframes showcopied {
  0% {
    opacity: 0;
    transform: translateX(100%);
  }
  70% {
    opacity: 1;
    transform: translateX(0);
  }
  100% {
    opacity: 0;
  }
}
</style>

<SCRIPT type="text/javascript">
	function ClipBoard() {
		alert(content.selectionStart + ' ' + content.selectionEnd);
		alert(content.innerText);
	}
</SCRIPT>
<title>Toggl2TimeSheet</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<h1>Toggl2TimeSheet</h1>
	<h2>Período:</h2>
	<form action="toggl.do">
		<button type=button data-copytarget="#content">Exportar</button>
		<button type=button onClick="window.location='toggl.do'">Novo</button>
	</form>
	<h3>Entries</h3>
<table border="1">
 <tr>
  <th width="100">Start</th>
  <th width="150">Stop</th>
  <th width="150">Description</th>
 </tr>
 <c:forEach items="${timeEntries}" var="entry">
  <tr>
   <td><c:out value="${entry.start}" /></td>
   <td><c:out value="${entry.stop}" /></td>
   <td><c:out value="${entry.description}" /></td>
  </tr>
  </c:forEach>
  </table>
</body>

</html>