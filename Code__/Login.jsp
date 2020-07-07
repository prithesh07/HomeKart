<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Login1.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String pg=request.getParameter("pg");
%>

<div class="sidenav">
         <div class="login-main-text">
            <h1><br>HomeKart</h1>
            <p>One place to book your service professional</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action="samp.jsp">
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" name="un" class="form-control" placeholder="User Name">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" name="pw" class="form-control" placeholder="Password">
                  </div>
                  
                  <button type="submit" class="btn btn-black">Login</button>
                  
                 
				
               </form>
               <br>

            </div>
         </div>
      </div>



</body>
</html>