<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
http://localhost:8087/nexus/delete.jsp?id=19&type=worker
<%@ page import="java.sql.*"%>
<%
String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
String USER = "root";
String PASS = "";
String cid=request.getParameter("iid");
String sty="\"width:40%;\"";
String id=request.getParameter("id");
String type=request.getParameter("type");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
Statement stmt = conn.createStatement();

String sql2 = "DELETE FROM `homekart`.`"+type+"` WHERE (`id` = '"+id+"');";
stmt.executeUpdate(sql2);

String url="\"javascript:location.href='adminprofile.jsp?un="+cid+"'\"";

out.println("<br>Sucessfully Deleted<br><button style="+sty+"onclick="+url+">Home</button>");

%>
</body>
</html>