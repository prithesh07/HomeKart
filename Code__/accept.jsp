<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%

String sty="\"width:40%;\"";
String uname=request.getParameter("id");
String un=request.getParameter("un");
String url="\"javascript:location.href='adminprofile.jsp?un="+un+"'\"";
String status=request.getParameter("s");
if(status.equals("a"))
{
	String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
	String USER = "root";
	String PASS = "";
	
	 try{  
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
		 Statement stmt = conn.createStatement();
		 String sql = "UPDATE `homekart`.`orderlog` SET `status` = 'approved' WHERE (`id` = '"+uname+"');";
		 stmt.executeUpdate(sql);
		 out.println("Approved Succesfully");
		 
		 
	 }
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
}
else if(status.equals("b"))
{
	String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
	String USER = "root";
	String PASS = "";
	
	 try{  
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
		 Statement stmt = conn.createStatement();
		 String sql = "DELETE FROM `homekart`.`orderlog` WHERE (`id` = '"+uname+"')";
		 stmt.executeUpdate(sql);
		 out.println("Declined");
		 
	 }
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
}
out.println("<br><button style="+sty+"onclick="+url+">Click here to navigate to home page</button>");
%>

</body>
</html>