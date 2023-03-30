<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
/* String id = request.getParameter("idmovies");
 */
 String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "flixstar";
String userid = "root";
String password = "ITSMETERRA@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="shortcut icon" href="./CSS/images/icon.png" type="image/png">
  <title>Movies</title>

  <!--
    - custom css link
  -->
  <link rel="stylesheet" href="./CSS/Homepage.css">
  
  <!--
    - google font link
  -->
  <link href="https://fonts.googleapis.com/css?family=Inter:100,200,300,regular,500,600,700,800,900" rel="stylesheet" />
</head>

<body>




  <!--
    - main container
  -->
  <div class="container">

    <!--
      - #HEADER SECTION
    -->

    <header class="">
      <div class="navbar">

        <!--
          - menu button for small screen
        -->
        <button class="navbar-menu-btn">
          <span class="one"></span>
          <span class="two"></span>
          <span class="three"></span>
        </button>


        <a href="#" class="navbar-brand">
          <img src="./CSS/images/logo.png" alt="">
        </a>

        <!--
          - navbar navigation
        -->

        <nav class="">
          <ul class="navbar-nav">

            <li> <a href="Homepage.jsp" class="navbar-link" >Home</a> </li>
            <li> <a href="MoviesPage.jsp" class="navbar-link" >Movies</a> </li>
            <li> <a href="Tvseries.jsp" class="navbar-link" >TV Series</a> </li>

          </ul>
        </nav>

        <!--
          - search and sign-in
        -->

        <div class="navbar-actions">

          <form action="#" class="navbar-form">
            <input type="text" name="search" placeholder="I'm looking for..." class="navbar-form-search">

            <button class="navbar-form-btn">
              <ion-icon name="search-outline"></ion-icon>
            </button>

            <button class="navbar-form-close">
              <ion-icon name="close-circle-outline"></ion-icon>
            </button>
          </form>


          <!--
            - search button for small screen
          -->

          <button class="navbar-search-btn">
            <ion-icon name="search-outline"></ion-icon>
          </button>

          <a href="#" class="navbar-signin">
           <a href="Userservlet"><span id="sign">Sign-out </span></a>
            <ion-icon name="log-in-outline"></ion-icon>
          </a>

        </div>

      </div>
    </header>
    <!--
      - MAIN SECTION
    -->
    <main>
      <section class="movies">
        <!--
          - movies grid
        -->

        <div class="movies-grid">
			<%
			try{
			connection = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=connection.createStatement();
			String sql ="select * from movie";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				System.out.println(resultSet.getString("MID"));
			%>
			
			<!-- jakarta.servlet.http.HttpSession session = request.getSession();
	                 session.setAttribute("username",username);
	     	        jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("/Homepage.jsp"); -->
	     	        
	        	<!-- 	dispatcher.forward(request,response); -->
			<a href="moviedisplay.jsp?id=<%=resultSet.getString("MID")%>"">
			<div class="movie-card">
            <div class="card-head">
              <img src="<%=resultSet.getString("cover") %>" alt="" class="card-img">

              <div class="card-overlay">
                <div class="play">
                  <ion-icon name="play-circle-outline"></ion-icon>
                </div>

              </div>
            </div>

            <div class="card-body">
             <h3 class="card-title" name="movieName" ><%=resultSet.getString("mName") %></h3>
            </div>

          </div>
          </a>
		<%
		}
		connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>        
		</div>

        </div>
      </section>
    </main>





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





  <!--
    - custom js link
  -->
  <script src="./CSS/js/main.js"></script>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
  
</html>