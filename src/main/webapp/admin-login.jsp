<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.javaEE.flixStar.model.Admin"%>
<!DOCTYPE html>
<html>

<%
  


%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    <link rel="stylesheet" href="CSS/style.css">
    
    <style>
    
    .login-header{
        font-size: 2rem;
        font-weight: 500;
    }
    
    .login-container{
	  display: flex;
	  align-items: center;
	  justify-content:center;
	  height: 100vh;
    }
 
    .login-card{
      width: 500px;
      height: min-content;
      background-color: #3b3c3c;
      padding: 2rem;
      border-radius: 5px;
      display: flex;
      flex-direction: column;
      gap: 1.8rem;
    }
    
    </style>
   
    
</head>
<body>
  
  <div class="login-container">
   
       
       <form class="login-card" method="post" action="AdminLogin">
       
           <div>
              <span class="login-header">ADMIN /Login</span>
           </div>
       
           <div>
             <label for="name">Username</label>
             <input name="username" class="form-control form-control-lg" type="text">
           </div>
           
           <div>
             <label for="name">Password</label>
             <input name="password" class="form-control form-control-lg" type="password">
           </div>
           
        
           <div>
             <button type="submit" class="btn btn-primary btn-lg">Log In</button>
          </div>
        
       
       </form>
       
  
  </div>
  

</body>