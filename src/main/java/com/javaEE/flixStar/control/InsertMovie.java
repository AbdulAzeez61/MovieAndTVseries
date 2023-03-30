package com.javaEE.flixStar.control;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class InsertMovie
 */
@WebServlet("/InsertMovie")
public class InsertMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		doGet(request, response);
		
		
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String language = request.getParameter("language");
		float imdb = Float.parseFloat(request.getParameter("imdb"));
		String genre = request.getParameter("genre");
		String producer = request.getParameter("producer");
		String director = request.getParameter("director");
		int length = Integer.parseInt(request.getParameter("length"));
		int year = Integer.parseInt(request.getParameter("year"));
		String cover = request.getParameter("cover");
		String description = request.getParameter("description");
		String serverLink = request.getParameter("server");
		
		
		
		try {
			MovieDAO movieDao = new MovieDAO(dbCon.getConnection());
			Movie movie = new Movie(name, language, imdb, genre, producer, director, year, 
		      cover, description, length, serverLink);
			
			if(movieDao.create(movie)) {
				response.sendRedirect("dashboard.jsp#running-movies");
				System.out.println("Success");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
