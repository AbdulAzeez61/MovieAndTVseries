package com.javaEE.flixStar.control;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.javaEE.flixStar.connection.dbCon;
import com.javaEE.flixStar.dao.TVSeriesDAO;
import com.javaEE.flixStar.model.TVSeries;

/**
 * Servlet implementation class EditTVSeries
 */
@WebServlet("/EditTVSeries")
public class EditTVSeries extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<String> serverLinks = new ArrayList<String>();
		
	
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String language = request.getParameter("language");
		float imdb = Float.parseFloat(request.getParameter("imdb"));
		String genre = request.getParameter("genre");
		String producer = request.getParameter("producer");
		String director = request.getParameter("director");
		int length = Integer.parseInt(request.getParameter("length"));
		int season = Integer.parseInt(request.getParameter("season"));
		int year = Integer.parseInt(request.getParameter("year"));
		String cover = request.getParameter("cover");
		String description = request.getParameter("description");
	
     	
     	String[] episodes = request.getParameterValues("episode");
     	
     	
     	for(int i = 0; i < episodes.length; i++) {
     		serverLinks.add(episodes[i]);
     	}
     	
     	
    	
     	
     	try {
     		
     		TVSeriesDAO seriesDao = new TVSeriesDAO(dbCon.getConnection());
     		TVSeries series = new TVSeries (name, language, imdb, genre, producer, director,
    				year, cover, description, length, season, serverLinks );

     		series.setTvSeriesID(id);
   

     		if(seriesDao.edit(series)) {
     			response.sendRedirect("dashboard.jsp#running-series");
     		} else {
     			response.sendRedirect("edittvseries.jsp");
     		}
     		
     	
     	
     		
     	} catch (Exception e) {
     		System.out.println(e);
     	}
	}

}
