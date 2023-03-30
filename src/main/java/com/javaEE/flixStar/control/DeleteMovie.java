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

/**
 * Servlet implementation class DeleteMovie
 */
@WebServlet("/DeleteMovie")
public class DeleteMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		   int mid = Integer.parseInt(request.getParameter("id"));
			
			try {
			  MovieDAO moviedao  = new MovieDAO(dbCon.getConnection());
			  moviedao.delete(mid);
			  response.sendRedirect("dashboard.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
	}



}
