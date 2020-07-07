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
String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
String USER = "root";
String PASS = "";
String cid="1";
String sty="\"width:40%;\"";
String name=request.getParameter("name");
String password=request.getParameter("pw");
String mobile=request.getParameter("mb");
String address=request.getParameter("add");
String area=request.getParameter("area");
String gen=request.getParameter("gen");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
Statement stmt = conn.createStatement();

String sql2 = "INSERT INTO `homekart`.`contractor` (`name`,  `address`, `area`,`mobile`, `gender`,`experience`,`rating`, `password`) VALUES ( '"+name+"', '"+address+"', '"+area+"', '"+mobile+"', '"+gen+"','0 years','0', '"+password+"');";
stmt.executeUpdate(sql2);
ResultSet rs = stmt.executeQuery("SELECT id FROM `homekart`.`contractor` ORDER BY contractor.id DESC LIMIT 1;");
while(rs.next())
{
cid=rs.getString(1);
}
String url="\"javascript:location.href='builderprofile.jsp?un="+cid+"'\"";

out.println("<br><button style="+sty+"onclick="+url+">Click to view your newly created profile...</button>");

%>
</body>
</html>