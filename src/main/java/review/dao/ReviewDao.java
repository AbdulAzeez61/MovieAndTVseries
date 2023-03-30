package review.dao;

import java.sql.*;
import java.util.*;

import review.model.reviews;

public class ReviewDao {

	Connection con;

	public ReviewDao(Connection con) {

		this.con = con;
	}

	// add review to database

	public boolean addReview(reviews review) { // passing object for reviews

		boolean test = false;
		String query = "insert into reviews(name,title,description) values (?,?,?) ";

		try {
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, review.getName());
			pst.setString(2, review.getTitle());
			pst.setString(3, review.getDescription());

			pst.executeUpdate();
			test = true;

		} catch (Exception e) {
			e.printStackTrace();

		}
		return test;

	}

	// retrieve the reviews from database

	public List<reviews> getAllReviews() {

		List<reviews> review = new ArrayList<>();

		try {

			String query = "select* from reviews";
			PreparedStatement pt = this.con.prepareStatement(query);

			ResultSet rs = pt.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("reviewID");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String description = rs.getString("description");

				reviews row = new reviews(id, name, title, description);
				review.add(row);

				// System.out.print(row);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return review;

	}

	// get single review method

	public reviews getSingleReview(int id) {

		reviews rv = null;

		try {

			String query = "select* from reviews where reviewID=? ";
			PreparedStatement pt = this.con.prepareStatement(query);

			pt.setInt(1, id);
			ResultSet rs = pt.executeQuery();

			while (rs.next()) {

				int rid = rs.getInt("reviewID");
				String rname = rs.getString("name");
				String rtitle = rs.getString("title");
				String rdescription = rs.getString("description");

				rv = new reviews(rid, rname, rtitle, rdescription);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return rv;

	}

	// edit review information

	public boolean editReviewInfo(reviews review) {

		boolean test = false;

		try {

			String query = "update reviews set name=? , title=? , description=? where reviewID=?";
			PreparedStatement pt = this.con.prepareStatement(query);

			pt.setString(1, review.getName());
			pt.setString(2, review.getTitle());
			pt.setString(3, review.getDescription());
			pt.setInt(4, review.getId());
			pt.executeUpdate();

			test = true;

		} catch (Exception e) {

			e.printStackTrace();
		}

		return test;

	}

	// delete review

	public void deleteReview(int id) {

		try {

			String query = "delete from reviews where reviewID=?";
			PreparedStatement pt = this.con.prepareStatement(query);
			pt.setInt(1, id);
			pt.execute();

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

}
