package com.javaEE.flixStar.model;

public class Show {
	
	protected String name;
	protected String language;
	protected float imdb;
	protected String genre;
	protected String producer;
	protected String director;
    protected int releasedYear;
    protected String coverPoster;
    protected String description;
    
    public Show() {
    	
    }
    
	public Show (String name, String language, float imdb, String genre, String producer, String director,
			int releasedYear, String coverPoster, String description) {
		
		this.name = name;
		this.language = language;
		this.imdb = imdb;
		this.genre = genre;
		this.producer = producer;
		this.director = director;
		this.releasedYear = releasedYear;
		this.coverPoster = coverPoster;
		this.description = description;
	}
	
   public Show (String name, String language, String genre) {  
	   this.name = name;
	   this.language = language;
	   this.genre = genre;
   }


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getLanguage() {
		return language;
	}


	public void setLanguage(String language) {
		this.language = language;
	}


	public float getImdb() {
		return imdb;
	}


	public void setImdb(float imdb) {
		this.imdb = imdb;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getProducer() {
		return producer;
	}


	public void setProducer(String producer) {
		this.producer = producer;
	}


	public String getDirector() {
		return director;
	}


	public void setDirector(String director) {
		this.director = director;
	}


	public int getReleasedYear() {
		return releasedYear;
	}


	public void setReleasedYear(int releasedYear) {
		this.releasedYear = releasedYear;
	}


	public String getCoverPoster() {
		return coverPoster;
	}


	public void setCoverPoster(String coverPoster) {
		this.coverPoster = coverPoster;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
    
    
	
}
