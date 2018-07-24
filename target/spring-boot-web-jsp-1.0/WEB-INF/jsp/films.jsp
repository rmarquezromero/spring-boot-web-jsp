<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />


<script type="text/javascript">
	function showAddFilmForm() {
		$('#formAddFilm').show();
		$('#btnShowFormAdd').hide();
		$('#tableFilms').hide();
	}

	function hideAddFilmForm() {
		$('#formAddFilm').hide();
		$('#btnShowFormAdd').show();
		$('#tableFilms').show();
	}
	
	function removeFilm(key) {
		$.ajax({
		     type: "POST",
		     url: "/removeFilm",
		     data: { key: key},
		     success: function (data) {
		    	 if (data.success){
		    		 location.assign("/films")
	    		 }
		     },
		     error: function(request, error) {
		    	 location.assign("/films")
		     }
		})
	}
	
</script>

</head>
<body>

	<c:import url="menu.jsp" />

	<div class="container">

		<!-- Film lists -->
		<c:if test="${films ne null}">

			<h1>Films</h1>

			<table id="tableFilms">
				<!-- here should go some titles... -->
				<tr>
					<th>Title</th>
					<th>Year</th>
					<th>Duration</th>
					<th>Director</th>
					<th>Cast</th>
					<th>Genre</th>
					<th>Synopsis</th>
					<th>Actions</th>
				</tr>
				<c:forEach items="${films}" var="film">
					<tr>
						<td><c:out value="${film.title}" /></td>
						<td><c:out value="${film.year}" /></td>
						<td><c:out value="${film.duration}" /></td>
						<td><c:out value="${film.director}" /></td>
						<td><c:out value="${film.cast}" /></td>
						<td><c:out value="${film.genre}" /></td>
						<td><c:out value="${film.synopsis}" /></td>
						<td width="10%" style="text-align: center">
<!-- 							<input type="image" src="/images/edit.png" width="24" height="24" title="Edit" onclick="" /> -->
							 
							<input type="image" src="/images/delete.png"
							width="24" height="24" title="Remove"
							onclick="removeFilm(${film.key});" />
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<!-- Add films -->
		<div id="btnShowFormAdd" style="text-align: center;">
			<input type="submit" value="Add new film" onclick="showAddFilmForm()" />
		</div>

		<!-- Form anadi peliculas -->
		<div id="formAddFilm" style="display: none">
			<h3>Add a film</h3>

			<form:form action="/addFilm" name="formFilm" method="post"
				modelAttribute="film">
				<label for="title">Title</label>
				<input type="text" id="title" name="title" placeholder="Title..">
				<label for="year">Year</label>
				<input type="number" id="year" name="year" placeholder="Year.."
					maxlength="4">
				<label for="duration">Duration</label>
				<input type="number" id="duration" name="duration"
					placeholder="Duration.." maxlength="3">
				<label for="director">Director</label>
				<input type="text" id="director" name="director"
					placeholder="Director..">
				<label for="cast">Cast</label>
				<input type="text" id="cast" name="cast" placeholder="Cast..">
				<label for="genre">Genre</label>
				<input type="text" id="genre" name="genre" placeholder="Genre..">
				<label for="synopsis">Synopsis</label>
				<input type="text" id="synopsis" name="synopsis"
					placeholder="Synopsis..">

				<div>
					<input type="submit" value="Add"> <input type="button"
						value="Back" style="float: right" onclick="hideAddFilmForm()">
				</div>
			</form:form>


		</div>

	</div>
	<!-- div container -->

</body>

</html>
