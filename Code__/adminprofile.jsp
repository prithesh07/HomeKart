<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<script>


function goBack() {
	  window.history.back();
	}
</script>
<link rel="stylesheet" type="text/css" href="table.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="log.css">
<meta charset="ISO-8859-1">
<title>Admin Profile</title>
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
	   out.println("<p><button  class=\"btn btn-black\" onclick="+url+">   SIGN_OUT   </button>");     
       out.println("<button class=\"btn btn-black\" onclick=\"javascript:location.href='signup.jsp'\">   Add User   </button>");
       out.println("<button class=\"btn btn-black\" onclick=\"javascript:location.href='signupadmin.jsp'\">   Add Admin   </button> </p>");
       out.println("<p><button class=\"btn btn-black\" onclick=\"javascript:location.href='authoriseworker.jsp'\">   Authorise Worker   </button> ");
       out.println("<button class=\"btn btn-black\" onclick=\"javascript:location.href='authorisebuilder.jsp '\">   Authorise Builder   </button></p> ");
 %>

        <br> <p><b>Your Account Details !!</b></p>

         
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
	 ResultSet rs = stmt.executeQuery("Select * from homekart.admin where id="+uname+";"); 
     if(rs.next())
     {
    	
    	 
     String un=rs.getString(1);
        String name=rs.getString(2);
        String email=rs.getString(3);
        out.println("<td>");
       	out.println("User Name= "+un);
       	out.println("</td>");
       	out.println("</tr>");
       	out.println("<tr>");
       	out.println("<td>");
       	out.println("Mobile= "+ name);
       	out.println("</td>");
       	out.println("</tr>");  
    	out.println("<tr>");
       	out.println("<td>");
       	out.println("Email= "+email);
       	out.println("</td>");
       	out.println("</tr>");    
    	
       	
     }
        	
 }
 catch(Exception e){
	 System.out.println(e);
 } 
 

%>

 </tr></table>       <br>
Pending Request Approval
 <div class="table-wrapper-scroll-y my-custom-scrollbar">
<table id="myTable" class="table table-bordered table-striped mb-0">
  <tr class="header">
    <th style="width:12%;">Order ID</th>
    <th style="width:12%;">Employee ID</th>
    <th style="width:12%;">Customer ID</th>
    <th style="width:36%;">Customer Type</th>
    <th style="width:36%;">Approval</th>
  </tr>
  <tbody>

<tr>  
<%
try{  
	
	
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
	 //out.println("SELECT worker.name,"+skill+".rating,worker.status,worker.area FROM homekart.worker,homekart."+skill+" where name="+n+" and "+skill+".eid=homekart.id;");
    ResultSet rs = stmt.executeQuery("SELECT * FROM homekart.orderlog"); 
    while(rs.next())
    {
    	String idd=rs.getString(1);
    	String eid=rs.getString(2);
    	String etype=rs.getString(3);
    	String cid=rs.getString(5);
    	String ctype=rs.getString(4);
    	String review=rs.getString(6);
    	String status=rs.getString(9);
   
       if(status.equals("not approved"))
       {
       String rating=rs.getString(7);
       String details=rs.getString(8);
        out.println("<td>");
        out.println(idd);
      	out.println("</td>");
      	out.println("<td>");
     	out.println(eid);
      	out.println("</td>");
      	out.println("<td>");
      	out.println(cid);
      	out.println("</td>");
      	out.println("<td>");
      	out.println(ctype);
      	out.println("</td>");
      	out.println("<td><a href=accept.jsp?id="+idd+"&s=a&un="+uname+">Accept</a>"+" /  "+"<a href=accept.jsp?id="+idd+"&s=b&un="+uname+" >decline<a>");
      	out.println("</td>");
      	out.println("</tr>");
      	
       }
       else
       {
    	   continue;
       }

    }
      
}
catch(Exception e){
	 System.out.println(e);
} 

%>

</table>   </div>
<br><br>
<div class="container">
 <form action="delete.jsp"  >
TO delete personnel enter username: 
 <div class="form-group">
                     <label >Name</label>
                     <input type="text" name="id" class="form-control" placeholder="User Name" required>
                     <label >Enter your id to confirm</label>
                     <input type="text" name="idd" class="form-control" placeholder="User Name" required>
</div>
Select personnel type<br>
                     <input type="radio" id="1" name="type" value="admin" required>
					<label for="1"> Admin</label><br>

						<input type="radio" id="2" name="type" value="worker" required>
						<label for="2">Worker </label><br>
						
						<input type="radio" id="3" name="type" value="user" required>
						<label for="3">User </label><br>
						<input type="radio" id="4" name="type" value="contractor" required>
						<label for="4">Contractor </label><br>
						                  <div class="form-group">
                     <button type="submit" class="btn btn-black">Delete Personnel</button>                     
                  </div>
</form>
				
            </div>
            </div>
           
    </div>
 


</body>
</html>



