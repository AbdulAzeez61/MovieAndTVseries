
<%@page import="com.javaEE.flixStar.model.Users"%>
<%@page import="com.javaEE.flixStar.model.Show"%>
<%@page import="com.javaEE.flixStar.dao.UserDAO"%>
<%@page import="com.javaEE.flixStar.connection.dbCon"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
   String username = request.getParameter("username");
    UserDAO User = new UserDAO(dbCon.getConnection());
    Users selected = User.getUser(username);
    request.setAttribute("EDIT_User", selected);
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Edit User</title>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
        
    <style>
    
    
      .editbox{
          display: flex;
          justify-content: center;
          margin-top: 6rem;
       }
    
       .editform {
           max-width: 60%;
       }
       
     
     
    
    </style>
    

    <link rel="stylesheet" href="CSS/style.css">
    </head>
   <body>
    <div class="editbox" >
    <form class="editform" action="EditUser" method="post">
     
            <div class="form-header">
                <h4>User Submit</h4>
            </div>

                <div class="row g-4">
                    <div>
                        <input id="username" name="username" class="form-control form-control-lg" type="hidden"  value="${EDIT_User.username}" readonly>
                    </div>
                    <div class="col-5">
                        <label for="name">Password</label>
                        <input id="Password" name="Password" class="form-control form-control-lg" type="text"  value="${EDIT_User.password}" >
                    </div>

                    <div class="col-3">
                        <label for="imdb">email</label>
                        <input id="Email" name="Email" class="form-control form-control-lg" type="text" value="${EDIT_User.email}" >
                    </div>

                    <button type="submit" class="btn btn-danger col-5">Save</button>
                    <button type="button" class="btn btn-warning col-3" onclick="dashboard.jsp">Cancel</button>
                </div>
            </form>
            </div>
 
</body>
</html>