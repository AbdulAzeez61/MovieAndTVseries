package com.javaEE.flixStar.control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.javaEE.flixStar.connection.dbCon;
import com.javaEE.flixStar.dao.UserDAO;
import com.javaEE.flixStar.model.Users;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUser() {
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
		String name = request.getParameter("username");
		String Email = request.getParameter("Email");
		String Password = request.getParameter("Password");
		String serverLink = request.getParameter("server");
		System.out.print(serverLink);
		
		Users user = new Users();
		
		user.setUsername(name);
		user.setEmail(Email);
		user.setPassword(Password);
		
		try {		
		   UserDAO userdao = new UserDAO(dbCon.getConnection());
			boolean updated = userdao.editUser(user);
			if(updated){
				System.out.print("Successfully Updated");
				response.sendRedirect("dashboard.jsp");
			} else {
				System.out.print("Something Wrong");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
