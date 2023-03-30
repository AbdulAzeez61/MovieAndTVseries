package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.LoginDao;
import model.login;


/**
 * Servlet implementation class Loginservlet
 */
@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       private LoginDao logindao;
       
       public void init() {
           logindao = new LoginDao();
       }
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		jakarta.servlet.http.HttpSession session = request.getSession();
		session.removeAttribute("username");
		jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("UserPage.jsp");
		dispatcher.forward(request, response);
   	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Login Validation
		
		 String username = request.getParameter("username");
	     String password = request.getParameter("password");
	        
	        login login = new login();
	        login.setUsername(username);
	        login.setPassword(password);
	        try {
	            if (logindao.validate(login)) {
	                jakarta.servlet.http.HttpSession session = request.getSession();
	                 session.setAttribute("username",username);
	     	        jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("/Homepage.jsp");
	        		dispatcher.forward(request,response);
	            } else {
	                request.setAttribute("message", "Invalid Account");
	                jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
	        		dispatcher.forward(request,response);
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }

	}

}
