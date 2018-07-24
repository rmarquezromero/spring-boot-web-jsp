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

	<c:import url="menu.jsp" />

	<div class="container">

		<div class="starter-template">

			<h1>${title}</h1>
			<h3>Esto es un ejemplo de una peque�a webapp con Spring boot starter web.</h3><br>
			
			<h4>Tecnolog�as y herramientas usadas:</h4>
			<ul title="Tecnolog�as y herramientas usadas">
				<li>Java 8</li>
				<li>Spring</li>
				<li>Maven</li>
				<li>JSP</li>
				<li>Jquery</li>
				<li>Bootstrap</li>
				<li>JSON</li>
				<li>Tomcat 8</li>
			</ul>
			<br>
			
			<h4>Funcionalidades:</h4>
			<ul title="Tecnolog�as usadas">
				<li>Desde el punto de men� "Films" podemos ver un listado de pel�culas. Podremos a�adir o eliminarlas.
					Las pel�culas se guardan en el fichero films.json
				</li>
			</ul>
			<br>
			
			<h4>Problemas encontrados y observaciones: </h4>
			<ul>
				<li> Por falta de tiempo para solucionarlo no he podido acceder al archivo films.json que hay en el war desde producci�n (al ejecutar la aplicaci�n war) desde consola.
					 Por lo tanto ha sido necesario ubicar el fichero en la ra�z del war.<br>
					 Para facilitarme el trabajo "desarrollo vs producci�n" he a�adido el atributo "app.environment" para distinguir de entorno en el controlador.
				</li>
				<li> Me gustar�a haber implementado un mejor control de las excepciones y logs, as� como unas pruebas unitarias.</li>
				<li> Hac�a tiempo que no trabajaba con Spring y es la primera vez que uso Spring boot starter. Me ha resultado bastante intuitivo y f�cil para montar y desplegar.<br>
				</li>
			</ul>
			<br>
			
		</div>

	</div>

</body>

</html>
