<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="log.css">
<script>


function goBack() {
	  window.history.back(-2);
	}
</script>
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
         <div class="col-md-5">
<br><br><br>
<table border="1" width="800" border-spacing="50px 0" style="margin: 0px;">
<tr>     
<td style="width:35%;" rowspan="8"><img src="C:/Users/prith/Desktop/download.jpg" width="200" height="200">  </td>

<%@ page import="java.sql.*"%>
<%
String ccid=request.getParameter("cid");
String namee=request.getParameter("name");
String n='"'+namee+'"';
String id=request.getParameter("id");
String sid='"'+id+'"';
String skill=(request.getParameter("skill")).toLowerCase();
out.println("<td> Skill = "+skill.toUpperCase()+"</td>");
String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
String USER = "root";
String PASS = "";
String url="\"javascript:location.href='comfirmbook.jsp?"+"cid="+ccid+"&id="+id+"'\"";
String sty="\"width:30%;\"";
 try{  
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
	 //out.println("SELECT worker.name,"+skill+".rating,worker.status,worker.area FROM homekart.worker,homekart."+skill+" where name="+n+" and "+skill+".eid=homekart.id;");
     ResultSet rs = stmt.executeQuery("SELECT worker.name,"+skill+".rating,worker.status,worker.area FROM homekart.worker,homekart."+skill+" where name="+n+" and "+skill+".eid=worker.id;"); 
     if(rs.next())
     {
        String name=rs.getString(1);
        String rating=rs.getString(2);
        String status=rs.getString(3);   
        if(!status.equals("Available"))
        {
        	out.println("<script>goBack();</script>");
        }
        String area=rs.getString(4);
        out.println("</tr>");
        out.println("<td>");
       	out.println(" Name = "+name);
       	out.println("</td>");
       	out.println("</tr>");
       	out.println("<tr>");
       	out.println("<td>");
      	out.println(" Rating = "+rating);
       	out.println("</td>");
       	out.println("</tr>");
       	out.println("<tr>");
       	out.println("<td>");
       	out.println(" Status = "+status);
       	out.println("</td>");
       	out.println("</tr>");
       	out.println("<tr>");
       	out.println("<td>");
       	out.println(" Area = "+area);
       	out.println("</td>");
       	out.println("</tr>");

     }
    
     out.println(" </tr></table>");
     out.println("<br><button style="+sty+"onclick="+url+">Request Book</button>");
        	
 }
 catch(Exception e){
	 System.out.println(e);
 } 


%>

 </tr></table>
  <button style="width:30%;" onclick="goBack()">Go Back</button>
 <br>
 <h2>Previous Work History </h2>

 <div class="table-wrapper-scroll-y my-custom-scrollbar">
<table id="myTable" class="table table-bordered table-striped mb-0">
  <tr class="header">
    <th style="width:8%;">Work ID</th>
    <th style="width:8%;">Customer ID</th>
    <th style="width:38%;">Work Details</th>
    <th style="width:38%;">Review</th>
    <th style="width:8%;">Rating</th>
  </tr>
  <tbody>

<tr>  
<%
try{  
	
	
	String sskill='"'+skill+'"';
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
	 //out.println("SELECT worker.name,"+skill+".rating,worker.status,worker.area FROM homekart.worker,homekart."+skill+" where name="+n+" and "+skill+".eid=homekart.id;");
    ResultSet rs = stmt.executeQuery("SELECT * FROM homekart.orderlog where eid="+sid+"and etype="+sskill); 
    while(rs.next())
    {
    	String idd=rs.getString(1);
        String ctype=rs.getString(4);
       String cid=rs.getString(5);
       String review=rs.getString(6);
       String rating=rs.getString(7);
       String details=rs.getString(8);
        out.println("<td>");
        out.println(idd);
      	out.println("</td>");
      	out.println("<td>");
     	out.println(ctype+" "+cid);
      	out.println("</td>");
      	out.println("<td>");
      	out.println(details);
      	out.println("</td>");
      	out.println("<td>");
      	out.println(review);
      	out.println("</td>");
      	out.println("<td>");
      	out.println(rating);
      	out.println("</td>");
      	out.println("</tr>");

    }
      
}
catch(Exception e){
	 System.out.println(e);
} 

%>

</table>   </div>
</div></div>
</body>
</html>