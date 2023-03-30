
<%@page import="com.javaEE.flixStar.model.Movie"%>
<%@page import="com.javaEE.flixStar.model.Show"%>
<%@page import="com.javaEE.flixStar.dao.MovieDAO"%>
<%@page import="com.javaEE.flixStar.connection.dbCon"%>
<%@page import="com.javaEE.flixStar.model.Admin"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    MovieDAO movie = new MovieDAO(dbCon.getConnection());
    Movie selected = movie.getMovie(id);
    request.setAttribute("EDIT_MOVIE", selected);
    
    System.out.println(selected.getReleasedYear());
    System.out.println(selected.getMovieLength());
%>



	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Edit Movie</title>
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
        
    <style>
    
    
      .editbox{
          display: flex;
          justify-content: center;
          margin: 6rem 0;
       }
    
       .editform {
           max-width: 60%;
       }
       
       
       .btn {
           margin-right: 10px;
           font-size: 1.2rem;
           color: white;
           padding: 8px 18px;
        }
    </style>
    

    <link rel="stylesheet" href="CSS/style.css">
    </head>
   <body>
    <div class="editbox" >
    <form class="editform needs-validation" action="EditMovieServlet" method="post" novalidate>
     
            <div class="form-header">
                <h4>Edit Movie</h4>
            </div>

                <div class="row g-4">
                    <div>
                        <input id="name" name="id" class="form-control form-control-lg" type="hidden"  value="${EDIT_MOVIE.movieID}" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>
                    <div class="col-12">
                        <label for="name">Movie Name</label>
                        <input id="name" name="name" class="form-control form-control-lg" type="text"  value="${EDIT_MOVIE.name}" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div class="dropdown col-4">
                        <label for="language" >Language</label>
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
                        <input id="imdb" name="imdb" class="form-control form-control-lg" type="text" value="${EDIT_MOVIE.imdb}" required>
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
                        <input id="producer" name="producer" class="form-control form-control-lg" type="text" value="${EDIT_MOVIE.producer}" placeholder="Warner Bros" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div class="col-6">
                        <label for="director">Director</label>
                        <input id="director" name="director" class="form-control form-control-lg" type="text"
                            value="${EDIT_MOVIE.director}" placeholder="James Cameron" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>


                    <div class="col-3">
                        <label for="length">Length (min)</label>
                        <input id="time" name="length" class="form-control form-control-lg" type="te" value="${EDIT_MOVIE.movieLength}" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                        
                    </div>

                    <div class="col-4">
                        <label for="year">Year</label>
                        <input id="year" name="year" class="form-control form-control-lg" type="text" value="${EDIT_MOVIE.releasedYear}" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div>
                        <label for="cover">Cover Poster</label>
                        <input id="cover" name="cover" class="form-control form-control-lg" type="text" value="${EDIT_MOVIE.coverPoster}" required>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div>
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="form-control form-control-lg" required>${EDIT_MOVIE.description}</textarea>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div>
                        <label for="serverLink">Movie Server</label>
                        <textarea id="description" name="server" class="form-control form-control-lg" required>${EDIT_MOVIE.moivieServer}</textarea>
                        <div class="valid-feedback">Looks good!</div>
                        <div class="invalid-feedback">Please fill the field</div>
                    </div>

                    <div>
                        <button type="submit" class="btn btn-primary col-2">Save</button>
                        <a type="button" href="dashboard.jsp" class="btn btn-danger col-2">Cancel</a>
                    </div>

                </div>
            </form>
            </div>
 
 
                  
        <script>
           
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
            
         
        </script>
</body>
</html>