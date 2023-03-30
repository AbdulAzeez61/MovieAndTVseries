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
import com.javaEE.flixStar.dao.TVSeriesDAO;

/**
 * Servlet implementation class DeleteTVSeries
 */
@WebServlet("/DeleteTVSeries")
public class DeleteTVSeries extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int tid = Integer.parseInt(request.getParameter("id"));
		
		try {
			
			TVSeriesDAO seriesDao =  new TVSeriesDAO(dbCon.getConnection());
			seriesDao.delete(tid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		response.sendRedirect("dashboard.jsp#running-series");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
