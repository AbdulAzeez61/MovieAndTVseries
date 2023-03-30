<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@page import="review.dao.ConnectionDao"%>
<%@page import="review.dao.ReviewDao"%>
<%@page import="java.util.List"%>
<%@page import="review.dao.ReviewDao"%>
<%@page import="review.model.reviews"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% 

 int id= Integer.parseInt(request.getParameter("id"));
ReviewDao rvd= new ReviewDao(ConnectionDao.getCon());
 reviews review= rvd.getSingleReview(id);
 request.setAttribute("editReview", review);

%>





<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<title>Edit your review!!</title>
<style>
.inner {
	position: relative;
	margin: 0 auto;
	width: 650px;
	display: block;
	padding: 50px 0;
}

h3 {
	text-align: center;
	border-bottom: 2px solid midnightblue;
	margin-bottom: 20px;
}

nav li a {
	font-size: 25px;
	font-weight: 500;
}

a {
	color: #fff;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-light">
			<a class="navbar-brand">Reviews</a>
			<ul class="navbar-nav ml-auto mt-3 mx-5">
				<li class="nav-item"><a class="nav-link active"
					href="reviewpage.jsp">Home</a></li>
			</ul>
		</nav>
	</div>
	<div class="inner">
		<div class=" container">
			<div class="row">
				<div class="col-12">
					<h3>Edit Review</h3>
					<form action="EditReview" method="post">
						<div class="form-group">
							<label>Review ID</label> <input class="form-control" name="rid"
								value="${editReview.id }">
						</div>
						<div class="form-group">
							<label>User Name</label> <input class="form-control" name="rname"
								value="${editReview.name }" required>
						</div>
						<div class="form-group">
							<label>Title</label> <input class="form-control" name="rtitle"
								value="${editReview.title}" required>
						</div>
						<div class="form-group">
							<label>Description</label> <input class="form-control"
								name="rdes" value="${editReview.description}" required>
						</div>


						<button type="submit" class="btn btn-primary">Submit</button>
						<button class="btn btn-primary">
							<a href="reviewpage.jsp">Cancel</a>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>
</html>
