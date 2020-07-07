<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Your request has been successfully recorded </h3>
<%@ page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String cid=request.getParameter("cid");
String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
String USER = "root";
String PASS = "";
String url="\"javascript:location.href='userprofile.jsp?un="+cid+"'\"";
String sty="\"width:40%;\"";
 try{  
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
	 String sql = "UPDATE homekart.worker set  worker.status="+"\"NA\""+" WHERE id="+id;
	 stmt.executeUpdate(sql);
	 
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }
 try{  
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
	
	 String sql2 = "INSERT INTO `homekart`.`orderlog` (`eid`,`cid`,`ctype`,`review`) VALUES ("+id+","+cid+","+"\"user\""+",\"NA\""+");";
	 stmt.executeUpdate(sql2);
	 out.println("<br><button style="+sty+"onclick="+url+">Click to continue booking...</button>");
	 
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }
%>
 

 
</body>
</html>