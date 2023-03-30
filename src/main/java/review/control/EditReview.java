package review.control;


import review.dao.ConnectionDao;
import review.dao.ReviewDao;
import review.model.reviews;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class EditReview
 */
/**
 * @author TERRA
 *
 */
public class EditReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReview() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		//fetch data from edit form
		
		int id= Integer.parseInt(request.getParameter("rid"));
		String rnam= request.getParameter("rname");
		String rtit= request.getParameter("rtitle");
		String rde= request.getParameter("rdes");
		
		
		//create a review object and set those values to review object
		
		reviews review= new reviews(id,rnam,rtit,rde);
		
		review.setName(rnam);
		review.setTitle(rtit);
		review.setDescription(rde);
		review.setId(id);
		
		
		//review dao  object
		
		ReviewDao rvdao= new ReviewDao(ConnectionDao.getCon());
		boolean success= rvdao.editReviewInfo(review);
		
		if(success) {
			
			response.sendRedirect("reviewpage.jsp");
			System.out.println("Edit successfully");
		}
		
		else {
			System.out.println("Not success");
		}
		
		
		
		doGet(request, response);
	}

}
