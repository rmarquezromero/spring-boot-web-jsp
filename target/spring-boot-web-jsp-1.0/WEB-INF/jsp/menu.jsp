<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

</head>
<body>
	
	<nav class="navbar navbar-inverse">
		<div class="container" style="padding: 0 !important; background-color: #222 !important; ">
			<div class="navbar-header" style="padding: 0 !important; background-color: #222 !important; ">
				<a class="navbar-brand" href="/">Home</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse" style="padding: 0 !important; background-color: #222 !important; ">
				<ul class="nav navbar-nav">
					<li><a href="/films">Films</a></li>
					<li><a href="/about">About me</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>

</html>
