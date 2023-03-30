<%@page import="java.util.List"%>
<%@page import="com.javaEE.flixStar.model.Movie"%>
<%@page import="com.javaEE.flixStar.model.Show"%>
<%@page import="com.javaEE.flixStar.dao.MovieDAO"%>
<%@page import="com.javaEE.flixStar.dao.TVSeriesDAO"%>
<%@page import="com.javaEE.flixStar.model.TVSeries"%>
<%@page import="com.javaEE.flixStar.connection.dbCon"%>
<%@page import="com.javaEE.flixStar.model.Admin"%>
<%@page import="com.javaEE.flixStar.model.Users"%>
<%@page import="com.javaEE.flixStar.dao.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
  
  String userName = (String) session.getAttribute("user");
  
  if (userName == null){
	  response.sendRedirect("admin-login.jsp");
  }
  
  System.out.println("\n username " + userName);
%>

<%
    MovieDAO movieData = new MovieDAO(dbCon.getConnection());

    List<Movie> movies = movieData.getAllMovies();
    request.setAttribute("MOVIES_LIST", movies);
    
%>

<%
    TVSeriesDAO seriesData = new TVSeriesDAO(dbCon.getConnection());

    List<TVSeries> series = seriesData.getAllTVSeries(); 
    request.setAttribute("TVSERIES_LIST", series);
%>

<%
    TVSeriesDAO seriesCounts = new TVSeriesDAO(dbCon.getConnection());
    int seriesCount = seriesCounts.getNoTVSeries();
    request.setAttribute("TVSERIES_COUNT", seriesCount);
   
%>

<%
    MovieDAO moviesCounts = new MovieDAO(dbCon.getConnection());
    int moviesCount =  moviesCounts.getNoMovies();
    request.setAttribute("MOVIES_COUNT", moviesCount);
   
%>
<%
    UserDAO userData = new UserDAO(dbCon.getConnection());
     List<Users> users = userData.getAllusers(); 
     request.setAttribute("Users_LIST", users); 
%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="./CSS/images/icon.png" type="image/png">
  <title>CineFlix- Admin panel</title>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">

    <link rel="stylesheet" href="CSS/style.css">
    
    <style>
    
   
     .nav-list {
        
     }
    
     .btn {
      margin-right: 10px;
      font-size: 1.2rem;
      color: white;
      padding: 8px 18px;
     }
     
     .nav-list li:active {
       background-color: red;
       border-radius: 0 300px 300px 0;
       color: white;
       font-weight: 400;
     }
     
     .sq-container {
        background-color: #3b3c3c;
        padding: 2rem;
        margin-bottom: 6rem;
        border-radius: 5px;
     }
     
     .last{
        margin-top: auto;
     }
     
     th {
       font-size: 1.2rem;
     }
     
     td {
      font-size: 1.1rem;
     }
     
     .db-data{
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 2rem;
     }
     
     .data-container{
       background-color: #3b3c3c;
       padding: 1rem 1.4rem;
       border-radius: 5px;
     }
     
      .data-container .txt{
         font-size: 1.5rem;
         font-weight: 600;
      }
      
      .data-container .count{
         display: block;
         font-size: 1.8rem;
         padding: 1rem;
         background-color: red;
         width: fit-content;
         border-radius: 5px;
      }
    </style>
    
    
</head>
<body>


        <nav class="sidebar-nav">
            <header>
                <h2>CineFlix</h2>
            </header>

            <ul class="nav-list list-unstyled">
                <li>
                    <a href="#" class="d-flex gap-2">
                        <box-icon name='home-alt' color="white" size="2rem"></box-icon>
                        <p class="nav-link">Dashboard</p>
                    </a>
                </li>
                <li>

                    <a class="d-flex gap-2" data-bs-toggle="collapse" href="#collapseExample1" role="button"
                        aria-expanded="false" aria-controls="collapseExample">
                        <box-icon name='movie-play' color="white" size="2rem"></box-icon>
                        <p class="nav-link">Shows</p>
                    </a>

                    <ul class="collapse list-unstyled" id="collapseExample1">
                        <li>
                            <a href="#running-movies">Movies</a>
                        </li>
                        <li>
                            <a href="#running-series">Tv Series</a>
                        </li>
                    </ul>


                </li>
                <li>
                    <a class="d-flex gap-2" data-bs-toggle="collapse" href="#collapseExample2" role="button"
                        aria-expanded="false" aria-controls="collapseExample">
                        <box-icon name='upload' color="white" size="2rem"></box-icon>
                        <p class="nav-link">Uploads</p>
                    </a>
                    <ul class="collapse list-unstyled" id="collapseExample2">
                        <li>
                            <a href="#movie-submit">Movies</a>
                        </li>
                        <li>
                            <a href="#series-submit">Tv Series</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="d-flex  gap-2" href="#">
                        <box-icon name='user-pin' color="white" size="2rem"></box-icon>
                        <p class="nav-link">Accounts</p>
                    </a>
                </li>
                <li>
                    <a class="d-flex  gap-2" href="#">
                        <box-icon name='message-dots' color="white" size="2rem"></box-icon>
                        <p class="nav-link">Messages</p>
                    </a>
                </li>
                
                   <li>
                    <a class="d-flex  gap-2" href="#running-Users">
                        <box-icon name='message-dots' color="white" size="2rem"></box-icon>
                        <p class="nav-link">User Accounts</p>
                    </a>
                </li>
                
                 <li class="last">
                    <a class="d-flex gap-2" href="AdminitratorLogOut">
                        <box-icon name='log-out' color="white" size="2rem"></box-icon>
                        <p class="nav-link">Log Out</p>
                    </a>
                </li>
            </ul>
            </div>
        </nav>

        <main>
                
            <section id="dashboard">
                 <div class="db-data">
                 
                   <div class="data-container">
                       <span class="txt">No Of Running Movie</span>
                       <span class="count">${MOVIES_COUNT}</span>
                   </div>
                   
                   <div class="data-container">
                       <span class="txt">No Of Running TV Series</span>
                       <span class="count">${TVSERIES_COUNT}</span>
                   </div>
                   
                   <div class="data-container">
                       <span class="txt">No Of Active Users</span>
                       <span class="count">2</span>
                   </div>
                   
                  </div>
            </section>
            
         
            
            <section id="running-movies">
            <div class="sq-container">
                <div class="form-header">
                    <h4>Running Movies</h4>
                </div>
                <table>
                    <thead>
                        <tr>
                          <th>#</th>
                          <th>Movie Name</th>
                          <th>Language</th>
                          <th>Genre</th>
                          <th>Edit</th>
                          <th>Delete</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="tempMovie" items="${MOVIES_LIST}">
                        	<tr>
                          	  <td>${tempMovie.getMovieID()}</td>
                          	  <td>${tempMovie.getName()}</td>
                          	  <td>${tempMovie.getLanguage()}</td>
                          	  <td>${tempMovie.getGenre()}</td>
                          	  <td>
                            	<a type="button" href="editmovie.jsp?id=${tempMovie.getMovieID()}" class="btn btn-info">Edit</a>
                          	  </td>
                          	  <td>
                            	<a type="button" href="DeleteMovie?id=${tempMovie.getMovieID()}" class="btn btn-danger">Delete</a>
                          	  </td>
                        	</tr>
                        
                        </c:forEach>
                        
                      </tbody>
                </table>
            </div>
            </section>
  
            <section id="running-series">
            <div class="sq-container">
                <div class="form-header">
                    <h4>Running Tv Series</h4>
                </div>
                <table>
                    <thead>
                        <tr>
                          <th>#</th>
                          <th>Series Name</th>
                          <th>Language</th>
                          <th>Genre</th>
                          <th>Season</th>
                          <th>Edit</th>
                          <th>Delete</th>
                        </tr>
                      </thead>
                      <tbody>
                      
                       <c:forEach var="tempSeries" items="${TVSERIES_LIST}" >
                        
                         <tr>
                          <td>${tempSeries.getTvSeriesID()}</td>
                          <td>${tempSeries.getName()}</td>
                          <td>${tempSeries.getLanguage()}</td>
                          <td>${tempSeries.getGenre()}</</td>
                          <td>${tempSeries.getSeasonNo()}</td>
                          <td>
                            <a href="edittvseries.jsp?id=${tempSeries.getTvSeriesID()}" type="button" class="btn btn-info">Edit</a>
                          </td>
                          <td>
                            <a href="DeleteTVSeries?id=${tempSeries.getTvSeriesID()}" type="button" class="btn btn-danger">Delete</a>
                          </td>
                         </tr>
                        </c:forEach>
                   
                      </tbody>
                </table>
            </div>
            </section>
            
            <section id="movie-submit">
            <form class="sq-container needs-validation" action="InsertMovie" method="post" novalidate>

            	<div class="form-header">
                	<h4>Movie Submit</h4>
            	</div>

                <div class="row g-5">
                    <div class="col-12">
                        <label for="name">Movie Name</label>
                        <input id="name" name="name" class="form-control form-control-lg" type="text" placeholder="Harry Potter" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div class="dropdown col-4">
                        <label for="language">Language</label>
                        <select name="language" id="language" class="form-select form-select-lg mb-3"
                            aria-label=".form-select-lg example">
                            <option selected>Language</option>
                            <option value="English">English</option>
                            <option value="Hindi">Hindi</option>
                            <option value="Korean">Korean</option>
                            <option value="Japanese">Japanese</option>
                            <option value="Russian">Russian</option>
                            <option value="Spanish">Spanish</option>
                            <option value="Italian">Italian</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="col-2">
                        <label for="imdb">IMDB (0-10)</label>
                        <input id="imdb" name="imdb" class="form-control form-control-lg" type="text" placeholder="8.2" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div class="dropdown col-5">
                        <label for="language">Genre</label>
                        <select id="language" name="genre" class="form-select form-select-lg mb-3"
                            aria-label=".form-select-lg example">
                            <option selected>Genre</option>
                            <option value="English">Action</option>
                            <option value="Adventure">Adeventure</option>
                            <option value="Animation">Animation</option>
                            <option value="Biography">BioGraphy</option>
                            <option value="Comedy">Comedy</option>
                            <option value="Family">Family</option>
                            <option value="Fantasy">Fantasy</option>
                            <option value="Horror">Horror</option>
                            <option value="Romance">Romance</option>
                            <option value="War">War</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="col-6">
                        <label for="producer">Producer</label>
                        <input id="producer" name="producer" class="form-control form-control-lg" type="text" placeholder="Warner Bros" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div class="col-6">
                        <label for="director">Director</label>
                        <input id="director" name="director" class="form-control form-control-lg" type="text"
                            placeholder="James Cameron" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>


                    <div class="col-3">
                        <label for="length">Length (min)</label>
                        <input id="length" name="length" class="form-control form-control-lg" type="number" placeholder="120" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div class="col-4">
                        <label for="year">Year</label>
                        <input id="year" name="year" class="form-control form-control-lg" type="number" placeholder="2022" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div>
                        <label for="cover">Cover Poster</label>
                        <input id="cover" name="cover" class="form-control form-control-lg" type="text" placeholder="image address" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div>
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="form-control form-control-lg" required></textarea>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div>
                        <label for="serverLink">Movie link</label>
                        <textarea id="serverLink" name="server" class="form-control form-control-lg" required></textarea>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div>
                      <button type="submit" class="btn btn-lg btn-danger col-3">Upload</button>
                      <a class="btn btn-lg btn-info col-2">Cancel</a>
                    </div>

                </div>
             </form>
            </section>
            
            
            <section id="series-submit">

            <form class="sq-container needs-validation"  action="InsertTVSeries"  method="post" novalidate>

                <div class="form-header">
                    <h4>TV Series Submit</h4>
                </div>
    
                    <div class="row g-5">
                        <div class="col-12">
                            <label for="name">TV Series Name</label>
                            <input name="name" id="name" class="form-control form-control-lg" type="text" placeholder="Harry Potter" required>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>
    
                        <div class="dropdown col-4">
                            <label for="language">Language</label>
                            <select name="language" id="language" class="form-select form-select-lg mb-3"
                                aria-label=".form-select-lg example">
                                <option selected>Language</option>
                                <option value="English">English</option>
                                <option value="Hindi">Hindi</option>
                                <option value="Korean">Korean</option>
                                <option value="Japanese">Japanese</option>
                                <option value="Russian">Russian</option>
                                <option value="Spanish">Spanish</option>
                                <option value="Italian">Italian</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
    
                        <div class="col-2">
                            <label for="imdb">IMDB (0-10)</label>
                            <input id="imdb" name="imdb" class="form-control form-control-lg" type="text" placeholder="8.2" required>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>
    
                        <div class="dropdown col-5">
                            <label for="genre">Genre</label>
                            <select name="genre" id="genre" class="form-select form-select-lg mb-3"
                                aria-label=".form-select-lg example">
                                <option selected>Genre</option>
                                <option value="English">Action</option>
                                <option value="Adventure">Adeventure</option>
                                <option value="Animation">Animation</option>
                                <option value="Biography">BioGraphy</option>
                                <option value="Comedy">Comedy</option>
                                <option value="Family">Family</option>
                                <option value="Fantasy">Fantasy</option>
                                <option value="Horror">Horror</option>
                                <option value="Romance">Romance</option>
                                <option value="War">War</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
    
                        <div class="col-6">
                            <label for="producer">Producer</label>
                            <input id="producer" name="producer" class="form-control form-control-lg" type="text" placeholder="Warner Bros" required>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>
    
                        <div class="col-6">
                            <label for="director">Director</label>
                            <input id="director" name="director" class="form-control form-control-lg" type="text" 
                                placeholder="James Cameron" required>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>
    
    
                        <div class="col-3">
                            <label for="length">Episode Length (min)</label>
                            <input id="length" name="length" class="form-control form-control-lg" type="number" placeholder="120" required>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>
    
                        <div class="col-4">
                            <label for="year">Year</label>
                            <input id="year" name="year" class="form-control form-control-lg" type="number" placeholder="2022" required>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>
    
                        <div>
                            <label for="cover">Cover Poster</label>
                            <input name="cover" id="cover" class="form-control form-control-lg" type="text" placeholder="image address" required>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>
    
                        <div>
                            <label  for="description">Description</label>
                            <textarea name="description" id="description" class="form-control form-control-lg" required></textarea>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>

                        <div class="col-2">
                            <label for="season">Season No</label>
                            <input name="season" id="season" class="form-control form-control-lg" type="number" placeholder="0" required>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>

                        <div class="col-3">
                            <label for="episodes">No Of episodes</label>
                            <input id="episodes" class="form-control form-control-lg" type="number" placeholder="4" required>
                            <div class="valid-feedback">Looks good!</div>
                            <div class="invalid-feedback">Please fill the field</div>
                        </div>

                        <div class="col-5 d-flex align-items-end justify-content-left">
                            <button id="gBtn" type="submit" class="btn btn-lg btn-danger">Generate</button>
                        </div>

                        <div id = "links" class="episode-Links">

                        </div>

                        <div>
                           <button type="submit" class="btn btn-lg btn-danger col-3">Upload</button>
                           <a class="btn btn-lg btn-info col-2">Cancel</a>
                        </div>
                    </div>
                   
            </form>
            </section>
            
            <section id="running-Users">
            <div class="sq-container">
                <div class="form-header">
                    <h4>User Accounts</h4>
                </div>
                <table>
                    <thead>
                        <tr>
                        
                          <th>User Name</th>
                          <th>Email</th>
                          <th>Password</th>
                   
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="tempUser" items="${Users_LIST}">
                        	<tr>
                          	  <td>${tempUser.getUsername()}</td>
                          	  <td>${tempUser.getEmail()}</td>
                          	  <td>${tempUser.getPassword()}</td>
                          	  <td>
                            	<a type="button" href="editUser.jsp?username=${tempUser.getUsername()}" class="btn btn-info">Edit</a>
                          	  </td>
                          	  <td>
                            	<a type="button" href="DeleteUser?username=${tempUser.getUsername()}" class="btn btn-danger">Delete</a>
                          	  </td>
                        	</tr>
                        
                        </c:forEach>
                        
                      </tbody>
                </table>
            </div>
            </section>
            
            
        </main>
        
        <script>
            console.log("Hi")
          
        
            let forms = document.querySelectorAll (".needs-validation");

            Array.prototype.slice.call (forms).forEach (function(form)
            {
            	form.addEventListener ("submit", function(event)
            	{
            	if (!form.checkValidity())
            		{
            		event.preventDefault();
            		event.stopPropagation();
            		}
            		form.classList.add("was-validated");
            	});
            });
            
         
            let generateBtn = document.getElementById("gBtn");
            generateBtn.addEventListener("click", (event) => {

                  event.preventDefault();
        
                   let noOfEps = document.getElementById("episodes").value;
                  
                   let htmlTxt = '<p>Add server links to the each episode box</p>';

                   for(let i = 1; i <= noOfEps; i++){
                        htmlTxt += `<div class="col-10 ep-box">
                                     <label for="serverLink">Episode ${i}</label>
                                     <textarea id="serverLink" name="episode" class="form-control form-control-lg" required></textarea>
                                    </div>`
                    }

                    document.getElementById("links").innerHTML += htmlTxt;


                console.log(htmlTxt);
               }
              )

        </script>
</body>
</html>