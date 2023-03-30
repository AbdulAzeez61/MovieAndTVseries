package com.javaEE.flixStar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaEE.flixStar.model.Movie;
import com.javaEE.flixStar.model.Show;
import com.javaEE.flixStar.model.TVSeries;

public class TVSeriesDAO extends ShowDAO implements TVSeriesCtrlInterface {

	private Connection conn;
	private String query;
    private PreparedStatement pst;
    
    public TVSeriesDAO(Connection conn) {
    	this.conn = conn;
    }
    
    //delete
	@Override
	public void delete(int id) {
		
       System.out.println("Series Deleted Called" + id);
    	
    	try {
    		query = "delete from episodes where seriesId=?";
    		pst = this.conn.prepareStatement(query);
    		pst.setInt(1, id);
    		pst.execute();
    		
    		
    		query = "delete from series where TID=?";
    		pst = this.conn.prepareStatement(query);		
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
		boolean result = false;
		TVSeries series = (TVSeries)show;
		System.out.println(series.getName());
		
		System.out.println("edit tv series function called");
		
		try {
		query = "update series set tsname =?, language =?, imdb =?, genre =?, producer =?, director =?, epLength =?, year =?, cover =?, description =?, season =? where TID =?";
		System.out.println(query);
    	pst = this.conn.prepareStatement(query);
	
    	pst.setString(1, series.getName());
    	pst.setString(2, series.getLanguage());
    	pst.setFloat(3, series.getImdb());
    	pst.setString(4, series.getGenre());
    	pst.setString(5, series.getProducer());
    	pst.setString(6, series.getDirector());
    	pst.setInt(7, series.getEpisodeLength());
    	pst.setInt(8, series.getReleasedYear());
    	pst.setString(9, series.getCoverPoster());
    	pst.setString(10,  series.getDescription());
    	pst.setInt(11, series.getSeasonNo());
    	pst.setInt(12, series.getTvSeriesID());

    	System.out.println(series.getName());
    	pst.execute(); //boolean
    	
    	System.out.println(pst);
    	System.out.println(query);
    	
	   
	    
	    for(int i = 0; i < series.episodeServers.size(); i++) {
	    		     
	       ArrayList<String> server = series.getEpisodeServers();
	       int epNo = (i+1);
	       
	       System.out.println(server.get(i));
	      
	       query = "update episodes set epLink =?, epNo =? where seriesId=? AND epNo=?";
	       pst = this.conn.prepareStatement(query);
	       
	       pst.setString(1, server.get(i));
	       pst.setInt(2, epNo);
	       pst.setInt(3, series.getTvSeriesID());
	       pst.setInt(4, epNo);
	       pst.execute();
	      
	       System.out.println(pst);
	       
	     }
	   
	      result = true;
	      conn.close();
	       
		} catch (Exception e) {
			e.printStackTrace();
		}
	    

	    return result;
	}


	//create
	@Override
	public boolean create(Show show) {
		// TODO Auto-generated method stub
		  boolean result = false;

		  TVSeries series = (TVSeries)show;
	        
	        try {
	        	query = "insert into series (tsname, language, imdb, genre, producer, director, epLength, year, cover, description, season) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        	pst = this.conn.prepareStatement(query);
			
	        	pst.setString(1, series.getName());
	        	pst.setString(2, series.getLanguage());
	        	pst.setFloat(3, series.getImdb());
	        	pst.setString(4, series.getGenre());
	        	pst.setString(5, series.getProducer());
	        	pst.setString(6, series.getDirector());
	        	pst.setInt(7, series.getEpisodeLength());
	        	pst.setInt(8, series.getReleasedYear());
	        	pst.setString(9, series.getCoverPoster());
	        	pst.setString(10,  series.getDescription());
	        	pst.setInt(11, series.getSeasonNo());
//	        	pst.setString(11, movie.getMoivieServer());
			
	        	pst.execute(); //boolean
	        	
			   
			    
			    for(int i = 0; i < series.episodeServers.size(); i++) {
			    	
			       ArrayList<String> server = series.getEpisodeServers();
			       int epNo = (i+1);
			      
			       query = "insert into episodes (seriesId, epLink, epNo) values (LAST_INSERT_ID(), ?, ?)";
			       pst = this.conn.prepareStatement(query);
			       
			       pst.setString(1, server.get(i));
			       pst.setInt(2, epNo);
			       pst.execute();
			      
			    }
			    
			    conn.close();
			    result = true;
			
	        } catch (SQLException e) {
	        	System.out.println(e.getMessage());
	        }
	        
	        return result;
	}

    
   
    @Override
    public List<TVSeries> getAllTVSeries() {
    	
    	List <TVSeries> series = new ArrayList<TVSeries>();
    	
    	try {
    		
    		query = "select TID, tsname, language ,genre, season from series order by TID";
    		pst = this.conn.prepareStatement(query);
    	    ResultSet rs = pst.executeQuery();
    	    
    	    while(rs.next()) {
    	    	int id = rs.getInt("TID");
				String name = rs.getString("tsname");
				String language = rs.getString("language");
				String genre = rs.getString("genre");
				int season = rs.getInt("season");
			 
				TVSeries row = new TVSeries(id, name, language, genre, season);
				series.add(row);
				 
				System.out.print(row);	 
    	    }
    		
    		conn.close();
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	
    	return series;
    }
    
    
    @Override
    public TVSeries getTVSeries(int id) {
		
		TVSeries series = null;
		
		try {
			query = "select * from series where TID = ?";
			pst = this.conn.prepareStatement(query);		
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery(); //row data
			
			while(rs.next()) {
				
				int sid = rs.getInt("TID");
				String name = rs.getString("tsname");
				String language = rs.getString("language");
				float imdb = rs.getFloat("imdb");
				String genre = rs.getString("genre");
				String producer = rs.getString("producer");
				String director = rs.getString("director");		
				int length = rs.getInt("epLength");
				int year = rs.getInt("year");
			    String cover = rs.getNString("cover");
			    String description = rs.getString("description");
			    int season = rs.getInt("season");
				
				series = new TVSeries(sid, name, language, imdb, genre, producer, director,
						year , cover, description, length, season);		
						
			}
			
			query = "select epLink from episodes where seriesID = ?";
			pst = this.conn.prepareStatement(query);
			pst.setInt(1, id);
		    rs = pst.executeQuery(); 
		    
		    ArrayList<String> servers = new ArrayList<>();
		    while(rs.next()) {
		    	String episodes = rs.getString("epLink");
		    	servers.add(episodes);
		    }
		    
		    series.setEpisodeServers(servers);
		    
		    conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return series;
	}
    
    
    public int getNoTVSeries() {	
    	int count = 0;
    	TVSeries series = new TVSeries();
    	   	
    	try {
    	
    	 query = "select Count(*) AS COUNT from series";
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
