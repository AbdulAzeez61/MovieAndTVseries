<!DOCTYPE html>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "flixstar";
String userid = "root";
String password = "ITSMETERRA@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
ResultSet resultSet2=null;

int tid = Integer.parseInt(request.getParameter("id"));
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="review.dao.ConnectionDao" %>
<%@page import="review.dao.ReviewDao" %>
<%@page import="java.util.List" %>
<%@page import="review.dao.ReviewDao" %>
<%@page import="review.model.reviews" %>









<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <link rel="stylesheet" href="./CSS/stylefall.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="shortcut icon" href="./CSS/images/icon.png" type="image/png">
  <title>TVseries</title>
  <style>
  	body, section{background-color:black;}
  	
     .player{
     margin:40px;
     padding: 40px;
     border: 3px solid white;
     
     
   }
   .player:hover{
     paddding: 30px;
     border: 3px solid red;
          box-shadow: -1px -1px 15px 6px rgba(83,168,209,0.75);
-webkit-box-shadow: -1px -1px 15px 6px rgba(83,168,209,0.75);
-moz-box-shadow: -1px -1px 15px 6px rgba(83,168,209,0.75);
   }
   .data-fields{
    
    margin:30px;
    padding:30px;
    border:1.2px solid white;
    border-radius:15px;
    box-shadow: -1px -17px 67px 6px rgba(143,211,240,0.75);
-webkit-box-shadow: -1px -17px 67px 6px rgba(143,211,240,0.75);
-moz-box-shadow: -1px -17px 67px 6px rgba(143,211,240,0.75);
    
   }
   .data-fields:hover{
    padding:35px;
    border:2px solid red;
    
   }
  </style>
  </head>
  <body>
   
   
   <section>
   
    <div class="page">
    
    <%-- <section>
	
		<%
try{
	
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1 ="select*from episodes e inner join series s on s.TID=e.seriesId where s.TID="+tid;
resultSet2 = statement.executeQuery(sql1);
while(resultSet2.next()){
%>
		<section>
    	
    	
    	

		<span>Episode No: <%=resultSet2.getString("epNo") %></span><br>
		</section>
		
		
		
		<section>
        <div class="player">
            <iframe width="100%" height="100%" src=<%=resultSet2.getString("epLink")%> title="YouTube video player" frameborder="0"
             allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
    	</section>
    	
    	
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> --%>
    	
    	
    	
    	
    	
    	
    	
    	
    	<!-- </section> -->
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    		<%
		try{
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		statement=connection.createStatement();
		String sql ="select * from series where TID=" + tid; //check with tid part 
		
		//String sql1 ="select*from episodes e inner join series s on s.TID=e.seriesId where s.TID=11;";
		 
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			
		
		%>
    	
		<div class="data-fields">
           <div >
             <img class="cover" src="<%=resultSet.getString("cover")%>">
           </div>
           <div class="txt">
              <h4 class="show-name"><%=resultSet.getString("tsname") %></h4>
              <div>
                <span class="tag-box">IMDB <%=resultSet.getString("imdb") %></span>
                <span class="tag-box"><%=resultSet.getString("epLength") %></span>
              </div>
              <div class="show-description">
                <p><%=resultSet.getString("description") %></p>
              </div>
              <div>
                 <div class="data-grid">
                   
                        <span>Genre</span>
                        <span><%=resultSet.getString("genre") %></span>
                    
             
                        <span>Language</span>
                        <span><%=resultSet.getString("language") %></span>
                    
                
                        <span>Released</span>
                        <span><%=resultSet.getString("year") %></span>
                    
                
                        <span>Director</span>
                        <span><%=resultSet.getString("director") %></span>
                    
                
                        <span>Producer</span>
                        <span><%=resultSet.getString("producer") %></span>
                    
                
                 </div>
              </div>
           </div>
        </div>
        <%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		%>
    </section>
    <section>
    <%try{
	
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1 ="select*from episodes e inner join series s on s.TID=e.seriesId where s.TID="+tid;
resultSet2 = statement.executeQuery(sql1);
while(resultSet2.next()){
%>
		<section>
    	
    	
    	

		<span style="color:white;margin-left:25px;font-weight:700">Episode No: <%=resultSet2.getString("epNo") %></span><br>
		</section>
		
		
        <div class="player">
            <iframe width="100%" height="100%" src=<%=resultSet2.getString("epLink")%> title="YouTube video player" frameborder="0"
             allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
    	
    	
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    
    </section>
  </div>
  </section>

  
 </body>
</html>


