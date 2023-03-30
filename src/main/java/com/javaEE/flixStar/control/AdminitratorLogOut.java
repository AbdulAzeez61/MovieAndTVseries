package com.javaEE.flixStar.control;

import java.io.IOException;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AdminitratorLogOut
 */
@WebServlet("/AdminitratorLogOut")
public class AdminitratorLogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Delete Admin Session
		HttpSession session = request.getSession();
        session.removeAttribute("type");
        session.removeAttribute("user");
        response.sendRedirect("admin-login.jsp");
	}

}
