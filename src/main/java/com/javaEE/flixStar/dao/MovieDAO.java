package com.javaEE.flixStar.dao;

import java.sql.SQLException;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.javaEE.flixStar.model.Movie;
import com.javaEE.flixStar.model.Show;
import com.javaEE.flixStar.model.TVSeries;


public class MovieDAO extends ShowDAO implements MovieCtrlInterface{
	
	private Connection conn;
	private String query;
    private PreparedStatement pst;
    
    public MovieDAO(Connection conn) {
		super();
		this.conn = conn;
	}
    

    //delete
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
        System.out.println("Movie Deleted Called" + id);
    	
    	try {
    		String query = "delete from movie where MID=?";
    		PreparedStatement pst = this.conn.prepareStatement(query);
    		
    		pst.setInt(1, id);
    		pst.execute();
    		
    		System.out.println("Execute");
    		
    		conn.close();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
	}


	//edit
	@Override
	public boolean edit(Show show) {
		// TODO Auto-generated method stub
        boolean test = false;
        
        Movie movie = (Movie)show;
    	
    	System.out.println("edit movie execute");
    	System.out.println(movie.getMoivieServer());
    	
    	try {
    		String query = "update movie set mname=?, language=?, imdb=?, genre=?, producer=?, director=?, length=?, year=?, cover=?, description=?, plink=? where MID = ?";
    		PreparedStatement pst = this.conn.prepareStatement(query);
    		
    		pst.setString(1, movie.getName());
        	pst.setString(2, movie.getLanguage());
        	pst.setFloat(3, movie.getImdb());
        	pst.setString(4, movie.getGenre());
        	pst.setString(5, movie.getProducer());
        	pst.setString(6, movie.getDirector());
        	pst.setInt(7, movie.getMovieLength());
        	pst.setInt(8, movie.getReleasedYear());
        	pst.setString(9, movie.getCoverPoster());
        	pst.setString(10, movie.getDescription());
        	pst.setString(11, movie.getMoivieServer());
        	pst.setInt(12, movie. getMovieID());
        	
        	
        	
        	pst.executeUpdate();
        	
        	
           test = true;
           conn.close();
    		
    	} catch(Exception e) {
    		
    		e.printStackTrace();
    	}
    	
  
    	
		return test;
	}


	//create
	@Override
	public boolean create(Show show) {
		// TODO Auto-generated method stub
		   boolean result = false;
		   Movie movie = (Movie)show;
 	        
	        try {
	        	query = "insert into movie (mname, language, imdb, genre, producer, director, length, year, cover, description, plink) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        	pst = this.conn.prepareStatement(query);
			
	        	pst.setString(1, movie.getName());
	        	pst.setString(2, movie.getLanguage());
	        	pst.setFloat(3, movie.getImdb());
	        	pst.setString(4, movie.getGenre());
	        	pst.setString(5, movie.getProducer());
	        	pst.setString(6, movie.getDirector());
	        	pst.setInt(7, movie.getMovieLength());
	        	pst.setInt(8, movie.getReleasedYear());
	        	pst.setString(9, movie.getCoverPoster());
	        	pst.setString(10, movie.getDescription());
	        	pst.setString(11, movie.getMoivieServer());
			
	        	pst.execute(); //boolean
			
			    result = true;
			    conn.close();
			
	        } catch (SQLException e) {
	        	System.out.println(e.getMessage());
	        }
	        
	        return result;
			
	}
	

	@Override
	public List<Movie> getAllMovies() {
		
		 List<Movie> movies = new ArrayList<>();
		 
		 System.out.print("get AllMovies Called");
		 
		 try {
			 String query = "select MID, mName, language, genre from movie order by MID";
			 PreparedStatement pt = this.conn.prepareStatement(query);
			 ResultSet rs = pt.executeQuery();
		 
			 while(rs.next()) {
				 int id = rs.getInt("MID");
				 String name = rs.getString("mName");
				 String language = rs.getString("language");
				 String genre = rs.getString("genre");
			 
				 Movie row = new Movie(id, name, language, genre);
				 movies.add(row);
				 
				 System.out.print(row);	 
				 
			 }
			 
			 conn.close();
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 
		 
		 
		 return movies;
	 }
	
	
	@Override
	public Movie getMovie(int id) {
		
		Movie movie = null;
		
		try {
			String query = "select * from movie where MID = ?";
			PreparedStatement pst = this.conn.prepareStatement(query);		
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery(); //row data
			
			while(rs.next()) {
				int mid = rs.getInt("MID");
				String name = rs.getString("mName");
				String language = rs.getString("language");
				float imdb = rs.getFloat("imdb");
				String genre = rs.getString("genre");
				String producer = rs.getString("producer");
				String director = rs.getString("director");		
				int length = rs.getInt("length");
				int year = rs.getInt("year");
			    String cover = rs.getNString("cover");
			    String description = rs.getNString("description");
			    String link = rs.getNString("plink");
				
				movie = new Movie(mid, name, language, imdb, genre, producer, director,
						year , cover, description, length, link) ;
				
				System.out.println(year +" "+ length +" "+ link + " "+description);
			    
				conn.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return movie;
	}
		 

	 public int getNoMovies() {	
	    	int count = 0;
	    	TVSeries series = new TVSeries();
	    	   	
	    	try {
	    	
	    	 query = "select Count(*) AS COUNT from movie";
	    	 pst = this.conn.prepareStatement(query);
	    	 ResultSet rs = pst.executeQuery();
	    	 
	    	 while(rs.next()) {
	    		 count = rs.getInt("COUNT");
	    	 }
	    	 
	    	 conn.close();
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	
	    	return count;
	    }

		 
}
