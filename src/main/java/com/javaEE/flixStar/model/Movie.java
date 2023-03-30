package com.javaEE.flixStar.model;

public class Movie extends Show {

	 private int movieID;
	 private int movieLength = 0;
	 private String moivieServer;
	 
	 public Movie() {
		 super();
	 }
	 
	
	 public Movie (int movieID, String name, String language, float imdb, String genre, String producer, String director,
			int releasedYear, String coverPoster, String description, int episodeLength, String movieServer) 
	 {
		super(name, language, imdb, genre, producer, director, releasedYear, coverPoster, description);
		
		this.movieID = movieID;
		this.movieLength = episodeLength;
		this.moivieServer = movieServer;
	 }
	 
	 public Movie ( String name, String language, float imdb, String genre, String producer, String director,
				int releasedYear, String coverPoster, String description, int episodeLength, String movieServer) 
	 {
			super(name, language, imdb, genre, producer, director, releasedYear, coverPoster, description);
			
			this.movieLength = episodeLength;
			this.moivieServer = movieServer;
	 }
	 
	 public Movie(int movieID, String name, String language, String genre) {
		 super(name, language, genre);
		 this.movieID = movieID;
	 }

	
	 
	

	public int getMovieID() {
		return movieID;
	}

	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	
	public int getMovieLength() {
		return movieLength;
	}

	public void setMovieLength(int episodeLength) {
		this.movieLength = episodeLength;
	}

	public String getMoivieServer() {
		return moivieServer;
	}

	public void setMoivieServer(String moivieServer) {
		this.moivieServer = moivieServer;
	}
	 
	 
	
	 
	 
}
