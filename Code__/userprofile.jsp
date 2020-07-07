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
<title>User Profile</title>
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
     ResultSet rs = stmt.executeQuery("Select * from homekart.user where id="+uname+";"); 
     if(rs.next())
     {
     String un=rs.getString(1);
        String name=rs.getString(2);
        String mobile=rs.getString(3);
        String address=rs.getString(4);
        String area=rs.getString(5);
        String gender=rs.getString(6);
        String points=rs.getString(7);
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
       	out.println("Points= "+points);   
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
 <label for="sb"><b>Search By :</b>  </label>

<select style="width:40%;" id="sb">
  <option value="Name">Name</option>
  <option value="Skill">Skill</option>
  <option value="Area">Area</option>
  
</select>
<br>
 <input type="text" id="myInput"  onkeyup="myFunction()" placeholder="Search by keyword..."></p>
<p><b>Select your favorite professionals name...</b></p>
<div class="table-wrapper-scroll-y my-custom-scrollbar">
<table>
  <tr class="header">
    <th style="width:10%;">Name</th>
    <th style="width:10%;">Skill</th>
    <th style="width:30%;">Mobile</th>
    <th style="width:12%;">Status</th>
    <th style="width:27%;">Area</th>
    <th style="width:10%;">Gender</th>
  </tr>
  <tbody>
<%

 try{  
	 String link="bookpro.jsp?name=";
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery("(Select worker.name,painter.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.painter where worker.id=painter.eid and worker.status=\"Available\") union (Select worker.name,plumber.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.plumber where worker.id=plumber.eid  and worker.status=\"Available\") union (Select worker.name,electrician.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.electrician where worker.id=electrician.eid and worker.status=\"Available\") union (Select worker.name,architect.skill,worker.mobile,worker.status,worker.Area,worker.Gender,worker.id from homekart.worker,homekart.architect where worker.id=architect.eid  and worker.status=\"Available\");"); 
     while(rs.next())
     {
         String name=rs.getString(1);
         String skill=rs.getString(2);
         String mobile=rs.getString(3);
         String status=rs.getString(4);
         String area=rs.getString(5);
         String gender=rs.getString(6);
         String id=rs.getString(7);
        out.println("<tr>");
    	out.println("<td><a href="+link+name+"&skill="+skill+"&id="+id+"&cid="+uname+">");
       	out.println(name);
       	out.println("</a></td>");
       	out.println("<td>");
       	out.println(skill);
       	out.println("</td>");
       	out.println("<td>");
       	out.println(mobile);
       	out.println("</td>");
       	out.println("<td>");
       	out.println(status);
       	out.println("</td>");
       	out.println("<td>");
       	out.println(area);
       	out.println("</td>");
       	out.println("<td>");
       	out.println(gender);
       	out.println("</td>");
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
      <th>Name
      </th>
      <th>Skill
      </th>
      <th>Mobile
      </th>
      <th>Status
      </th>
      <th>Area
      </th>
      <th>Gender
      </th>
    </tr>
  </tfoot>
</table>
<br>

<script>

function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i,j=0, txtValue;
  var comp=document.getElementById("sb").value;
  if(comp=="Name")
  {
  j=0;
  }
  else if(comp=="Skill")
  {
  j=1;
  } 
  else if(comp=="Area")
	  {
	  j=4;
	  }



  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
	 
    td = tr[i].getElementsByTagName("td")[j];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    
    }
  }
}
</script>

				
            </div>
            </div>
            </div>
        
    


</body>
</html>