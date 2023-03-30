package com.javaEE.flixStar.control;

import java.io.IOException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.javaEE.flixStar.connection.dbCon;
import com.javaEE.flixStar.dao.AdminDAO;
import com.javaEE.flixStar.model.Admin;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname = request.getParameter("username");
		String password = request.getParameter("password");
		
		System.out.println(uname);
		System.out.println(password);
		
		
		try {
		  AdminDAO admindao = new AdminDAO(dbCon.getConnection());
		  Admin logger = new Admin(uname, password);
		  
		  if(admindao.login(logger) != null) {
			  HttpSession session = request.getSession();
              session.setAttribute("user", uname);
              response.sendRedirect("dashboard.jsp");
		  }
	
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
