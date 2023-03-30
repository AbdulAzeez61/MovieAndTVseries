package com.javaEE.flixStar.control;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.javaEE.flixStar.connection.dbCon;
import com.javaEE.flixStar.dao.MovieDAO;
import com.javaEE.flixStar.model.Movie;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/EditMovieServlet")
public class EditMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		int length = Integer.parseInt(request.getParameter("length"));
		int year = Integer.parseInt(request.getParameter("year"));
		float imdb = Float.parseFloat(request.getParameter("imdb"));
		String name = request.getParameter("name");
		String language = request.getParameter("language");
		String genre = request.getParameter("genre");
		String producer = request.getParameter("producer");
		String director = request.getParameter("director");		
		String cover = request.getParameter("cover");
		String description = request.getParameter("description");
		String serverLink = request.getParameter("server");
		
		Movie movie = new Movie();
		
		movie.setMovieID(id);
		movie.setName(name);
		movie.setLanguage(language);
		movie.setImdb(imdb);
		movie.setGenre(genre);
		movie.setProducer(producer);
		movie.setDirector(director);
		movie.setMovieLength(length);
		movie.setReleasedYear(year);
		movie.setCoverPoster(cover);
		movie.setDescription(description);
		movie.setMoivieServer(serverLink);
	
		
		
		try {
			
			MovieDAO  moviedao = new MovieDAO(dbCon.getConnection());
			boolean updated = moviedao.edit(movie);
			
			if(updated) {
				System.out.print("Successfully Updated");
				response.sendRedirect("dashboard.jsp#running-movies");
			} else {
				response.sendRedirect("editmovie.jsp");
			}
			
		} catch(Exception e) {
			
		}
		
	}

}
