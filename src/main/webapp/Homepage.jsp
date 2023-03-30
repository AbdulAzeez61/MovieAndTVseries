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

String user = (String) session.getAttribute("username");

if (user == null){
	  response.sendRedirect("UserPage.jsp");
}

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
  <title>CineFlix</title>
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

<section class="popup-graybox" id="popup">
<div class="coupon-popup-sec" >
  <div class="coupon" style="background: rgb(43,19,149);
background: linear-gradient(90deg, rgba(43,19,149,0.9307073171065301) 5%, rgba(7,7,8,1) 80%);padding:25px; margin:30px ;border-radius: 20px; border:1px solid white;width:100%">
    <h1 style="font-family: Cursive;font-size:50px;">Welcome</h1> <br> <h2>${sessionScope.username}</h2>
<br>
<br>
      <div class="main_content">
         <div class="coupon-brdr-sec2">
         
           <h2>Newly Added Movies </h2><br><br>
            <div class="movies-grid">
			<%
			try{
			connection = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=connection.createStatement();
			String sql ="SELECT * FROM flixstar.movie where MID in (3,4,5)";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				
			%>
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
              <h3 class="card-title" name="movieName" href="moviedisplay.jsp?id=<%=resultSet.getString("MID") %>"><%=resultSet.getString("mName") %></h3>
            </div>

          </div>
		<%
		}
		connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
		
        </div>
           
         </div>
      </div>
     <button onclick="closepopup()" class="but" style="background:red;color:white;border: 0.5px solid white; padding:5px; margin:10px;font-size:20px; width:60%; border-radius:8px; ">Let's Go </button>
  </div>
</div>
</section>

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
            <li> <a href="reviewpage.jsp" class="navbar-link" >Reviews</a> </li>


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
</div>

          <!--
            - search button for small screen
          -->

          <button class="navbar-search-btn">
            <ion-icon name="search-outline"></ion-icon>
          </button>

          <a class="navbar-signin">
            <a href="Userservlet"><span id="sign">Sign-out </span></a> 
            &nbsp;&nbsp;
            <button id="Username">${sessionScope.username}</button>
            <ion-icon name="log-in-outline"></ion-icon>
          </a>

       
         
        

<script>
function closepopup() {
  document.getElementById("popup").style.display = "none";
}


</script>

      </div>
    </header>
    <div>    <!--
      - MAIN SECTION
    -->
    <main>

      <!--
        - #BANNER SECTION
      -->
      <section class="banner">
        <div class="slider-frame">
          <div class="slider-images">
          
          <div class="banner-card">
           <img src="./CSS/images/funny.jpeg" class="banner-img">
              
              <div class="card-content">
                <div class="card-info">
                  <div class="genre">
                    <ion-icon name="film"></ion-icon>
                    <span>Action/Thriller</span>
                  </div>

                  <div class="year">
                    <ion-icon name="calendar"></ion-icon>
                    <span>2019</span>
                  </div>

                  <div class="duration">
                    <ion-icon name="time"></ion-icon>
                    <span>2h 11m</span>
                  </div>

                  <div class="quality">4K</div>

                </div>

                <h2 class="card-title">Free Guy - AI</h2>
            
              </div>
            </div>
          		<div class="banner-card">
              
              <img src="./CSS/images/action.jpg" class="banner-img">
              
              <div class="card-content">
                <div class="card-info">
                  <div class="genre">
                    <ion-icon name="film"></ion-icon>
                    <span>Action/Thriller</span>
                  </div>

                  <div class="year">
                    <ion-icon name="calendar"></ion-icon>
                    <span>2019</span>
                  </div>

                  <div class="duration">
                    <ion-icon name="time"></ion-icon>
                    <span>2h 11m</span>
                  </div>

                  <div class="quality">4K</div>
[]
                </div>

                <h2 class="card-title">John Wick: Chapter 3 - Parabellum</h2>
            
              </div>
            </div>
               <div class="banner-card">
              
              <img src="./CSS/images/spider-man-no-way-home.jpg" class="banner-img">
              
              <div class="card-content">
                <div class="card-info">

                  <div class="genre">
                    <ion-icon name="film"></ion-icon>
                    <span>Action/Thriller</span>
                  </div>

                  <div class="year">
                    <ion-icon name="calendar"></ion-icon>
                    <span>2019</span>
                  </div>

                  <div class="duration">
                    <ion-icon name="time"></ion-icon>
                    <span>2h 11m</span>
                  </div>

                  <div class="quality">4K</div>

                </div>

                <h2 class="card-title">Spiderman No Way Home</h2>        
              </div>
             </div>
            <div class="banner-card">
              <img src="./CSS/images/John-Wick-3.jpg" class="banner-img" alt="">

              <div class="card-content">
                <div class="card-info">

                  <div class="genre">
                    <ion-icon name="film"></ion-icon>
                    <span>Action/Thriller</span>
                  </div>

                  <div class="year">
                    <ion-icon name="calendar"></ion-icon>
                    <span>2019</span>
                  </div>

                  <div class="duration">
                    <ion-icon name="time"></ion-icon>
                    <span>2h 11m</span>
                  </div>

                  <div class="quality">4K</div>

                </div>

                <h2 class="card-title">John Wick: Chapter 3 - Parabellum</h2>
              </div>
            </div>
            
            <div class="banner-card">
              
              <img src="./CSS/images/action.jpg" class="banner-img">
              
              <div class="card-content">
                <div class="card-info">
                  <div class="genre">
                    <ion-icon name="film"></ion-icon>
                    <span>Action/Thriller</span>
                  </div>

                  <div class="year">
                    <ion-icon name="calendar"></ion-icon>
                    <span>2019</span>
                  </div>

                  <div class="duration">
                    <ion-icon name="time"></ion-icon>
                    <span>2h 11m</span>
                  </div>

                  <div class="quality">4K</div>

                </div>

                <h2 class="card-title">John Wick: Chapter 3 - Parabellum</h2>
            
              </div>
            </div>
            
             <div class="banner-card">
              
             
            
            <div class="banner-card">
              
              <img src="./CSS/images/action.jpg" class="banner-img">
              
              <div class="card-content">
                <div class="card-info">
                  <div class="genre">
                    <ion-icon name="film"></ion-icon>
                    <span>Action/Thriller</span>
                  </div>

                  <div class="year">
                    <ion-icon name="calendar"></ion-icon>
                    <span>2019</span>
                  </div>

                  <div class="duration">
                    <ion-icon name="time"></ion-icon>
                    <span>2h 11m</span>
                  </div>

                  <div class="quality">4K</div>

                </div>

                <h2 class="card-title">John Wick: Chapter 3 - Parabellum</h2>
            
              </div>
            </div>           
       
      </div>
      </div>
      </section>
      <!--
        - #MOVIES SECTION
      -->
      <section class="movies">
        <!--
          - movies grid
        -->
        <h2 class="section-heading">MOVIES</h2>

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
      
      <section class="movies">
        <!--
          - movies grid
        -->
        <h2 class="section-heading">TV SERIES</h2>

        <div class="movies-grid">
			<%
			try{
			connection = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=connection.createStatement();
			String sql ="select * from series";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
			<a href="tvseriesview.jsp?id=<%=resultSet.getString("TID")%>"">
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
              <h3 class="card-title" name="movieName" href="tvseries.jsp?id=<%=resultSet.getString("TID") %>"><%=resultSet.getString("tsname") %></h3>
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