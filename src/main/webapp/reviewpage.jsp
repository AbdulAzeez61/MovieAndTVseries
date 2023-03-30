<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="review.dao.ConnectionDao"%>
<%@page import="review.dao.ReviewDao"%>
<%@page import="java.util.List"%>
<%@page import="review.dao.ReviewDao"%>
<%@page import="review.model.reviews"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%ReviewDao reviewData = new ReviewDao(ConnectionDao.getCon()); 
	
List<reviews> review= reviewData.getAllReviews();
request.setAttribute("REVIEWS_LIST", review);

%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	

<link rel="stylesheet" href="./CSS/stylefall.css">
<link rel="stylesheet" href="./CSS/Homepage.css">
</head>

<body>
	<header class="">
		<div class="navbar">

			<!--
          - menu button for small screen
        -->
			<button class="navbar-menu-btn">
				<span class="one"></span> <span class="two"></span> <span
					class="three"></span>
			</button>


			<a href="#" class="navbar-brand"> <img
				src="./CSS/images/logo.png" alt="">
			</a>

			<!--
          - navbar navigation
        -->

			<nav class="">
				<ul class="navbar-nav">

					<li><a href="Homepage.jsp" class="navbar-link">Home</a></li>
					<li><a href="MoviesPage.jsp" class="navbar-link">Movies</a></li>
					<li><a href="Tvseries.jsp" class="navbar-link">TV Series</a></li>


				</ul>
			</nav>

			

			<div class="navbar-actions">

				<form action="#" class="navbar-form">
					<input type="text" name="search" placeholder="I'm looking for..."
						class="navbar-form-search">

					<button class="navbar-form-btn">
						<ion-icon name="search-outline"></ion-icon>
					</button>

					<button class="navbar-form-close">
						<ion-icon name="close-circle-outline"></ion-icon>
					</button>
				</form>


			

				<button class="navbar-search-btn">
					<ion-icon name="search-outline"></ion-icon>
				</button>

				<a href="#" class="navbar-signin"> <span>Sign in</span> <ion-icon
						name="log-in-outline"></ion-icon>
				</a>

			</div>

		</div>
	</header>

	<section>

		<div class="container-fluid">
			<div class="navbar navbar-light">
				<a class="navbar-brand">Reviews from users</a>

			</div>
		</div>

		<div class="container">
			<div class="inner">
				<div class="row">
					<div class="col-md-3">
						<h3>Enter your review for the movies!!</h3>
						<form action="AddReview" method="post">
							<div class="form-group">
								<label>User name:</label> <input class="form-control"
									name="rname" value="${sessionScope.username}" readonly>
								<br>
							</div>
							<div class="form-group">
								<label>Title of the movie/ tv series you would like to
									rate</label> <input class="form-control" name="rtitle"
									placeholder="Title" required> <br>
							</div>
							<div class="form-group">
								<label>Your review!!</label>
								<textarea class="form-control" name="rdes"
									placeholder="It was fantastic..." required> </textarea>
								<br>
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
							<button type="reset" class="btn btn-primary">Reset</button>
						</form>
					</div>
					<div class="col-md-9">
						<h3>Reviews from users</h3>
						<table class="table">
							<thead class="bg-light">
								<tr>
									<td scope="col">User Name</td>
									<td scope="col">Title</td>
									<td scope="col">Description</td>

									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="rev" items="${REVIEWS_LIST}">
									<tr>
										<td>${rev.name}</td>
										<td>${rev.title}</td>
										<td>${rev.description}</td>

										<td><a href="edit.jsp?id=${rev.id }">Edit</a> <a
											href="DeleteReviewServlet?id=${rev.id}">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>




	<!--
      - FOOTER SECTION
    -->
	<footer>

		<div class="footer-content">
			<div class="footer-links">
				<ul>

					<h4 class="link-heading">CineFlix</h4>

					<li class="link-item"><a href="#">About us</a></li>
					<li class="link-item"><a href="#">My profile</a></li>
					<li class="link-item"><a href="#">Pricing plans</a></li>
					<li class="link-item"><a href="#">Contacts</a></li>

				</ul>

				<ul>

					<h4 class="link-heading">Browse</h4>

					<li class="link-item"><a href="#">Live Tv</a></li>
					<li class="link-item"><a href="#">Live News</a></li>
					<li class="link-item"><a href="#">Live Sports</a></li>
					<li class="link-item"><a href="#">Streaming Library</a></li>

				</ul>

				<ul>

					<li class="link-item"><a href="#">TV Shows</a></li>
					<li class="link-item"><a href="#">Movies</a></li>
					<li class="link-item"><a href="#">Kids</a></li>
					<li class="link-item"><a href="#">Collections</a></li>

				</ul>

				<ul>

					<h4 class="link-heading">Help</h4>

					<li class="link-item"><a href="#">Account & Billing</a></li>
					<li class="link-item"><a href="#">Plans & Pricing</a></li>
					<li class="link-item"><a href="#">Supported devices</a></li>
					<li class="link-item"><a href="#">Accessibility</a></li>

				</ul>
			</div>

		</div>
	</footer>

	</div>

</body>

</html>


