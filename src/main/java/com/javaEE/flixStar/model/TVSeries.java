package com.javaEE.flixStar.model;

import java.util.ArrayList;

public class TVSeries extends Show {

	 private int seriesCount = 0;
	 private int tvSeriesID = 0;
	 private int episodeLength = 0;
	 private int seasonNo = 0;
	 public ArrayList<String> episodeServers = new ArrayList<String>();
	 
	 public TVSeries() {
		 super();
	 }
	 
	
	 public TVSeries (int seriesID, String name, String language, float imdb, String genre, String producer, String director,
			int releasedYear, String coverPoster, String description, int episodeLength, ArrayList<String> episodeServers, int tvSeriesID) 
	 {
		super(name, language, imdb, genre, producer, director, releasedYear, coverPoster, description);
		
		this.tvSeriesID = tvSeriesID;
		this.episodeLength = episodeLength;
		this.episodeServers  = episodeServers;
	 }
	 
	 public TVSeries ( String name, String language, float imdb, String genre, String producer, String director,
				int releasedYear, String coverPoster, String description, int episodeLength, int seasonNo, ArrayList<String> episodeServers) 
	 {
			super(name, language, imdb, genre, producer, director, releasedYear, coverPoster, description);
			
			System.out.println(seasonNo);
			this.seasonNo = seasonNo;
			this.episodeLength = episodeLength;
			this.episodeServers  = episodeServers;
	 }
	 
	 
	 public TVSeries (int id, String name, String language, float imdb, String genre, String producer, String director,
				int releasedYear, String coverPoster, String description, int episodeLength, int seasonNo) 
	 {
			super(name, language, imdb, genre, producer, director, releasedYear, coverPoster, description);
			
			this.tvSeriesID = id;
			this.seasonNo = seasonNo;
			this.episodeLength = episodeLength;
	 }
	 
	
	 public TVSeries(int tvSeriesID, String name, String language, String genre, int seasonNo) {
		 
		 super(name,language,genre);
		 this.tvSeriesID = tvSeriesID;
		 this.seasonNo = seasonNo;
		 
	 }
	 
	public int getSeasonNo() {
		return seasonNo;
	}


	public void setSeasonNo(int seasonNo) {
		this.seasonNo = seasonNo;
	}


	public TVSeries(int movieID, String name, String language, String genre) {
		 super(name, language, genre);
		 this.tvSeriesID = tvSeriesID;
	 }


	public int getTvSeriesID() {
		return tvSeriesID;
	}


	public void setTvSeriesID(int tvSeriesID) {
		this.tvSeriesID = tvSeriesID;
	}


	public int getEpisodeLength() {
		return episodeLength;
	}


	public void setEpisodeLength(int episodeLength) {
		this.episodeLength = episodeLength;
	}


	public ArrayList<String> getEpisodeServers() {
		return episodeServers;
	}


	public void setEpisodeServers(ArrayList<String> episodeServers) {
		this.episodeServers = episodeServers;
	}


	public int getSeriesCount() {
		return seriesCount;
	}


	public void setSeriesCount(int seriesCount) {
		this.seriesCount = seriesCount;
	}
	
	 
	
} 