<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="./CSS/Userlogincss.css" media="screen"/>
    <link rel="shortcut icon" href="CSS/images/icon.png" type="image/png">
    <title>Cineflix</title>
  </head>
  
  <body>
  <header>
  <h2>MOVIES AND SERIES</h2>
  <p class="w3-container w3-center w3-animate-zoom"> Ready to watch? Enter your email to create </p>
</header>
    <div id="overlay"></div>
    <div class="main">
      <input type="checkbox" id="chk" aria-hidden="true" />

      <div class="signup">
      
        <form action= "<%= request.getContextPath()%>/Userservlet" method="post">
          <label for="chk" aria-hidden="true">Sign up</label>
            <h4 style=color:red;padding-left:30px;font-family:Times-New-Roman,Times,serif;>${message2}</h4>
            <h4 style=color:red;padding-left:40px;font-family:Times-New-Roman,Times,serif;>${message5}</h4>
          <input type="text" name="username" placeholder="User name,  eg: Cine12 " pattern="(?=.*\d)(?=.*[a-z]).{5,}" title="Must contain at least one number and 5 or more characters" required />
          <input type="email" name="email" placeholder="Email" required />
          <input type="password" name="password" placeholder="Password,  eg: Cineflix123" autocomplete="new-password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="16" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required />
          
          <button>Sign up</button>
        </form>
      </div>

      <div class="login">
        <form action="Loginservlet" method="post">
          <label for="chk" aria-hidden="true">Login</label>
          <h4 style=color:red;padding-left:40px;font-family:Times-New-Roman,Times,serif;>${message}</h4>
          <input type="text" name="username" placeholder="Username" required/>
          <input type="password" name="password" placeholder="Password" required />
          <button>Login</button>
        </form>
      </div>
    </div>
  </body>
</html>