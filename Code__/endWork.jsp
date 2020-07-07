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
String rvw=request.getParameter("rvw");
String rat=request.getParameter("rat");
String oid=request.getParameter("oid");
String cid=request.getParameter("cid");
String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
String USER = "root";
String PASS = "";
String sty="\"width:40%;\"";
String url="\"javascript:location.href='userprofile.jsp?un="+cid+"'\"";
 try{  
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
	 String sql="UPDATE `homekart`.`orderlog` SET `review` = '"+rvw+"', `rating` = '"+rat+"' WHERE (`id` = '"+oid+"');";
	 stmt.executeUpdate(sql);
	 out.println("<br><button style="+sty+"onclick="+url+">Thank You...Click to navigate home page</button>");
	 
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }
%>

</body>
</html>