package com.javaEE.flixStar.dao;

import java.util.List;
import com.javaEE.flixStar.model.Movie;

public interface MovieCtrlInterface {

	List<Movie> getAllMovies();
	
	Movie getMovie(int id);

}
