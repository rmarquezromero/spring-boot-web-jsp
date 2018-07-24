<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css" href="/css/about.css" />

<script type="text/javascript">
// 	$('document').ready(function() {
// 		$('#divAbout > div').css("background-color", "white");
// 	});
</script>


</head>
<body>

	<c:import url="menu.jsp" />

	<div class="container" id="divAbout">
		
		<h1 style="text-align: center">About me</h1>
		
		<div class="row">
			<!-- Team member -->
			<div class="col-xs-12 col-sm-6 col-md-4"></div>
			<!-- ./Team member -->
			<!-- Team member -->
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="image-flip"
					ontouchstart="this.classList.toggle('hover');">
					<div class="mainflip">
						<div class="frontside">
							<div class="card">
								<div class="card-body text-center">
									<p>
										<img class=" img-fluid" src="/images/me.jpg" alt="card image">
									</p>
									<h4 class="card-title">Ramón Márquez Romero</h4>
									<p class="card-text">Full stack developer. (hover para
										saber más)</p>
								</div>
							</div>
						</div>
						<div class="backside">
							<div class="card">
								<div class="card-body text-center mt-4">
									<h4 class="card-title">Algo más...</h4>
									<p class="card-text">Soy un desarrollador madrileño
										afincado en Málaga hace muchos años. Durante mis 8 años de
										experiencia laboral siempre he desarollado apps web con
										diferentes frameworks y tecnologías. Me considero una persona
										dinámica y resolutiva con capacidad de solventar cualquier
										reto o problema.</p>
									<ul class="list-inline">
										<li class="list-inline-item" title="Llámame"><a
											class="social-icon text-xs-center" target="_blank"
											href="skype:+34622792404?call"> <i class="fa fa-phone"></i>
										</a></li>
										<li class="list-inline-item" title="Añádeme a skype"><a
											class="social-icon text-xs-center" target="_blank"
											href="skype:ramon_mr84?add"> <i class="fa fa-skype"></i>
										</a></li>
										<li class="list-inline-item" title="Mi perfil de Linkedin"><a
											class="social-icon text-xs-center" target="_blank"
											href="https://es.linkedin.com/in/ramonmarquezromero"> <i
												class="fa fa-linkedin"></i>
										</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ./Team member -->
			<!-- Team member -->
			<div class="col-xs-12 col-sm-6 col-md-4"></div>
			<!-- ./Team member -->

		</div>
	</div>

</body>

</html>
