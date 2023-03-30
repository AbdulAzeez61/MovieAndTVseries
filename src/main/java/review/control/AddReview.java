package review.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import review.dao.ConnectionDao;
import review.dao.ReviewDao;
import review.model.reviews;

import java.io.IOException;

/**
 * Servlet implementation class AddReview
 */
public class AddReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReview() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//fetch data from form
		
				String rname = request.getParameter("rname");
				String rtitle = request.getParameter("rtitle");
				String rdes = request.getParameter("rdes");
				
				reviews rw= new reviews(rname,rtitle,rdes);
			
				
				try {
					ReviewDao rdao= new ReviewDao(ConnectionDao.getCon());
					
					if(rdao.addReview(rw)) {
						
						response.sendRedirect("reviewpage.jsp"); //changed
						
					}
					
					else {
						
						System.out.print("Something wrong");
					}
					
				}catch(Exception e) {
					
					e.printStackTrace();
				}		
		
		
		doGet(request, response);
	}

}
