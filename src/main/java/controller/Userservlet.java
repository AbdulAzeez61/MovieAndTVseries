package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.Dao;
import model.User;

/**
 * Servlet implementation class Userservlet
 */
@WebServlet("/Userservlet")
public class Userservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Dao UserDao = new Dao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Userservlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
		dispatcher.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		
		User user = new User(username,email, password);
		
		try {
		      UserDao.registerUser(user);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		request.setAttribute("message2", "  Successfully Created");
        jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
		dispatcher.forward(request,response);
	}
}
