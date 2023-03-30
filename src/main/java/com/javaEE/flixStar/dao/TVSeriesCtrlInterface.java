package com.javaEE.flixStar.dao;
import java.util.List;

import com.javaEE.flixStar.model.TVSeries;

public interface TVSeriesCtrlInterface {

	List<TVSeries> getAllTVSeries();
	
	TVSeries getTVSeries(int id);
	
}
