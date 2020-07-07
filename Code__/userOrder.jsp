<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="log.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="table.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h1><br>HomeKart</h1>
            <p>One place to book your service professional</p>
         </div>
      </div>
      <div class="main">
    <br>
    <br>
    <br>
    <h2>Order Log</h2>
    <br>
    
 <table id="myTable" class="table table-bordered table-striped mb-0">
 <caption>"Previous Work History"</caption>
  <tr class="header" title="hi">
    <th style="width:10%;">Work ID</th>
    <th style="width:10%;">Work Type</th>
    <th style="width:35%;">Work Review</th>
    <th style="width:10%;">Work Rating</th>
    <th style="width:35%;">Work Details</th>
  </tr>
 <tr>
 <%@ page import="java.sql.*"%>
 <%
 
 try{  
	 String uname=request.getParameter("un");
	 String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
	 String USER = "root";
	 String PASS = "";
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery("Select * from homekart.orderlog where cid="+uname+";");
     String etype="a";
     String oid="0";
     while(rs.next())
    	 {
    	 String review=rs.getString(6);
    	
         
    	 oid=rs.getString(1);
         etype=rs.getString(3);
         String rating=rs.getString(7);
         String details=rs.getString(8);
         out.println("<tr>");
         out.println("<td>");
        	out.println(oid);
        	out.println("</td>");
        	
        	
        	out.println("<td>");
        	out.println(etype);
        	out.println("</td>");
        	
        	out.println("<td>");
        	out.println(review);
        	out.println("</td>");
        	
        	out.println("<td>");
        	out.println(rating);
        	out.println("</td>");
        	
        	out.println("<td>");
        	out.println(details);
        	out.println("</td>");
        	out.println("</tr>");  
     	
       	
       	
     
    	 }
        if(etype==null)
        {
        	out.println("<h6>You have an active order click here to end it<h6>");
        	out.println("<br>");
        	out.println("<form action=endWork.jsp>");
        	out.println("Enter Work Review   : <input type=\"textarea\" name=\"rvw\" placeholder=\"Review Here\" required><br><br>");
        	out.println("Enter Work Rating:  <input type=\"text\" name=\"rat\" placeholder=\"Rate out of 5\" required><br><br>");
        	out.println("<input type=\"hidden\" name=\"oid\" value="+oid+" required><br><br>");
        	out.println("<input type=\"hidden\" name=\"cid\" value="+uname+" required><br><br>");
        	out.println( "<button type=\"submit\">Submit & End Work</button>" );
        	out.println("</form>");
        }        



 }
 catch(Exception e){
	 System.out.println(e);
 } 
 

%>

</tr>
 </table>
 </div>
</body>
</html>