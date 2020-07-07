<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<script>


function goBack() {
	  window.history.back();
	}
</script>
<link rel="stylesheet" type="text/css" href="table.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="log.css">
<meta charset="ISO-8859-1">
<title>Worker Profile </title>

</head>
<body>


    
<div class="sidenav">
         <div class="login-main-text">
            <h1><br>HomeKart</h1>
            <p>One place to book your service professional</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-5">
         
<br>
 

<%
String uname=request.getParameter("un");
String url="javascript:location.href='index.html'";
        out.println("<button  class=\"btn btn-black\" onclick="+url+">   SIGN_OUT   </button>");     
       out.println("<button class=\"btn btn-black\" onclick=\"javascript:location.href='userOrder.jsp?un="+uname+" '\">   Previous Orders   </button> ");
 %>

        <br><br> <p><b>Your Account Details !!</b></p>

         
<table border="1" width="400" border-spacing="50px 0" style="margin: 0px;">
<tr>     
<td align ="center" rowspan="6"><img src="C:/Users/prith/Desktop/download.jpg" width="150" height="150">  </td>
<%@ page import="java.sql.*"%>
<%

String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
String USER = "root";
String PASS = "";
String x="width:100%";
 try{  
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
	 ResultSet rs = stmt.executeQuery("Select * from homekart.worker where id="+uname+";"); 
     if(rs.next())
     {
    	 String un=rs.getString(1);
         String name=rs.getString(2);
         String mobile=rs.getString(3);
         String address=rs.getString(4);
         String status=rs.getString(5);
         String area=rs.getString(6);
         String gender=rs.getString(7);
         
    	 
        out.println("<td>");
       	out.println("Name= "+name);
       	out.println("</td>");
       	out.println("</tr>");
       	out.println("<tr>");
       	out.println("<td>");
       	out.println("Mobile= "+mobile);
       	out.println("</td>");
       	out.println("</tr>");  
    	out.println("<tr>");
       	out.println("<td>");
       	out.println("Address= "+address);
       	out.println("</td>");
       	out.println("</tr>");    
    	out.println("<tr>");
       	out.println("<td>");
       	out.println("Area= "+area);
       	out.println("</td>");
       	out.println("</tr>");   
    	out.println("<tr>");
       	out.println("<td>");
       	out.println("Gender= "+gender);
       	out.println("</td>");
       	out.println("</tr>");  
    	out.println("<tr>");
       	out.println("<td>");
       	out.println("Status= "+status);   
       	out.println("</td>");
       	out.println("</tr>");
     
       	
     }
        	
 }
 catch(Exception e){
	 System.out.println(e);
 } 
 

%>

 </tr></table>       <br>

 <p>

<p><b>Your Skills...</b></p>
<div class="table-wrapper-scroll-y my-custom-scrollbar">
<table id="myTable" class="table table-bordered table-striped mb-0">
  <tr class="header">

    <th style="width:10%;">Skill</th>

  </tr>
  <tbody>
<%

 try{  
	 String link="bookpro.jsp?name=";
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery("(Select worker.name,painter.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.painter where worker.id=painter.eid and worker.id=\""+uname+"\" and worker.status=\"Available\") union (Select worker.name,plumber.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.plumber where worker.id=plumber.eid and worker.id=\""+uname+"\" and worker.status=\"Available\") union (Select worker.name,electrician.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.electrician where worker.id=electrician.eid and worker.id=\""+uname+"\" and worker.status=\"Available\") union (Select worker.name,architect.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.architect where worker.id=architect.eid and worker.id=\""+uname+"\" and worker.status=\"Available\");"); 
   //  out.println("(Select worker.name,painter.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.painter where worker.id=painter.eid and worker.contractor_id=\"+uname+\" and worker.status=\"Available\") union (Select worker.name,plumber.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.plumber where worker.id=plumber.eid and worker.contractor_id=\"+uname+\" and worker.status=\"Available\") union (Select worker.name,electrician.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.electrician where worker.id=electrician.eid and worker.contractor_id=\"+uname+\" and worker.status=\"Available\") union (Select worker.name,architect.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.architect where worker.id=architect.eid and worker.contractor_id=\"+uname+\" and worker.status=\"Available\");");
     while(rs.next())
     {
         String name=rs.getString(1);
         String skill=rs.getString(2);
         String mobile=rs.getString(3);
         String status=rs.getString(4);
         String area=rs.getString(5);
         String gender=rs.getString(6);
         String id=rs.getString(7);
        // String cid=rs.getString(8);
        out.println("<tr>");
    	out.println("<td><a href="+link+name+"&skill="+skill+"&id="+id+"&cid="+uname+">");
       	out.println(skill);
       	out.println("</a></td>");
     
       	out.println("</tr>");
     }
        	
 }
 catch(Exception e){
	 System.out.println(e);
 } 

%>
</tbody>
  <tfoot>
    <tr>
      
      <th>Skill
      </th>
      
    </tr>
  </tfoot>
</table>
<br>




				
            </div>
            </div>
            </div>
        
    


</body>
</html>



</div></div>
</body>
</html>