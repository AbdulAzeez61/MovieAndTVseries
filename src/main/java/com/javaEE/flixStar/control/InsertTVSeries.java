package com.javaEE.flixStar.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

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
 * Servlet implementation class InsertTVSeries
 */
@WebServlet("/InsertTVSeries")
public class InsertTVSeries extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
     	ArrayList<String> serverLinks = new ArrayList<String>();
	
		String name = request.getParameter("name");
		String language = request.getParameter("language");
		float imdb = Float.parseFloat(request.getParameter("imdb"));
		String genre = request.getParameter("genre");
		String producer = request.getParameter("producer");
		String director = request.getParameter("director");
		int length = Integer.parseInt(request.getParameter("length"));
//		int season =  Integer.parseInt(request.getParameter("season"));
		int season = Integer.parseInt(request.getParameter("season"));
		int year = Integer.parseInt(request.getParameter("year"));
		String cover = request.getParameter("cover");
		String description = request.getParameter("description");
		
 
     	
     	String[] episodes = request.getParameterValues("episode");
     	
     	
     	for(int i = 0; i < episodes.length; i++) {
     		serverLinks.add(episodes[i]);
     	}
     	
     	System.out.println(serverLinks);
     	System.out.println(description);
     	
     	try {
     		
     		TVSeriesDAO seriesDao = new TVSeriesDAO(dbCon.getConnection());
     		TVSeries series = new TVSeries (name, language, imdb, genre, producer, director,
    				year, cover, description, length, season, serverLinks );

     		if(seriesDao.create(series)) {
     			response.sendRedirect("dashboard.jsp#running-series");
     		}
     	
     		
     	} catch (Exception e) {
     		System.out.println(e);
     	}
     
//		serverLinks.add(request.getParameter("episode"));
//		System.out.print(name);
		
		
//		System.out.println(serverLinks);
	}

}
