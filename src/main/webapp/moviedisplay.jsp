<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

int id = Integer.parseInt(request.getParameter("id"));
System.out.println(id);

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
%>











<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <link rel="stylesheet" href="./CSS/stylefall.css">
     <link rel="shortcut icon" href="./CSS/images/icon.png" type="image/png">
  <title>Movies</title>
   <style>
   
   	body, section{background-color:black; font-size:20px}
   
   .player{
     margin:40px;
     padding: 40px;
     border: 3px solid white;
     box-shadow: -1px -1px 15px 6px rgba(240,143,189,0.75);
-webkit-box-shadow: -1px -1px 15px 6px rgba(240,143,189,0.75);
-moz-box-shadow: -1px -1px 15px 6px rgba(240,143,189,0.75);
     
   }
   .player:hover{
     paddding: 30px;
     border: 3px solid red;
     box-shadow: -1px -1px 15px 6px rgba(83,168,209,0.75);
-webkit-box-shadow: -1px -1px 15px 6px rgba(83,168,209,0.75);
-moz-box-shadow: -1px -1px 15px 6px rgba(83,168,209,0.75);
   }
   .show-description{
      margin:30px;
      padding:30px;
   }
   </style>	
   
  </head>
  <body>
   
   
   <section>

   
    <div class="page">
    
    <section>
		<%
		
		
		
		try{
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		statement=connection.createStatement();
		String sql ="select * from movie where MID="+id;

		System.out.println(sql);
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
		
        <div class="player">
            <iframe width="100%" height="100%" src=<%=resultSet.getString("plink")%> title="YouTube video player" frameborder="0"
             allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
        </div>
		<div class="data-fields">
           <div >
             <img class="cover" src="<%=resultSet.getString("cover")%>">
           </div>
           <div class="txt">
              <h4 class="show-name"><%=resultSet.getString("mName") %></h4>
              <div>
                <span class="tag-box">IMDB <%=resultSet.getString("imdb") %></span>
                <span class="tag-box"><%=resultSet.getString("length") %></span>
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
    
    
  </div>
  </section>
</body>
</html>