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
			<h3>Esto es un ejemplo de una pequeña webapp con Spring boot starter web.</h3><br>
			
			<h4>Tecnologías y herramientas usadas:</h4>
			<ul title="Tecnologías y herramientas usadas">
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
			<ul title="Tecnologías usadas">
				<li>Desde el punto de menú "Films" podemos ver un listado de películas. Podremos añadir o eliminarlas.
					Las películas se guardan en el fichero films.json
				</li>
			</ul>
			<br>
			
			<h4>Problemas encontrados y observaciones: </h4>
			<ul>
				<li> Por falta de tiempo para solucionarlo no he podido acceder al archivo films.json que hay en el war desde producción (al ejecutar la aplicación war) desde consola.
					 Por lo tanto ha sido necesario ubicar el fichero en la raíz del war.<br>
					 Para facilitarme el trabajo "desarrollo vs producción" he añadido el atributo "app.environment" para distinguir de entorno en el controlador.
				</li>
				<li> Me gustaría haber implementado un mejor control de las excepciones y logs, así como unas pruebas unitarias.</li>
				<li> Hacía tiempo que no trabajaba con Spring y es la primera vez que uso Spring boot starter. Me ha resultado bastante intuitivo y fácil para montar y desplegar.<br>
				</li>
			</ul>
			<br>
			
		</div>

	</div>

</body>

</html>
