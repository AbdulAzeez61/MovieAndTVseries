package com.javaEE.flixStar.dao;
import com.javaEE.flixStar.model.Show;

public abstract class ShowDAO {
	
	//delete
     abstract void delete(int id);
     
     //edit
     abstract boolean edit(Show show);
     
     //create
     abstract boolean create(Show show);

}
