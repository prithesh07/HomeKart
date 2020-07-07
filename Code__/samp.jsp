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

String uname=request.getParameter("un");
String pword=request.getParameter("pw");
String type=request.getParameter("type");
String DB_URL = "jdbc:mysql://localhost/users?serverTimezone=UTC";
String USER = "root";
String PASS = "";
 try{  
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	 Statement stmt = conn.createStatement();
   	boolean b=false;
   	ResultSet rs=stmt.executeQuery("Select id,password  from homekart.user;");
   	if(type.equals("G-USER"))
   	{
        rs = stmt.executeQuery("Select id,password  from homekart.user;");    
   	}
   	else if(type.equals("BUILDER"))
   	{
   	  rs = stmt.executeQuery("Select id,password  from homekart.contractor;"); 
   	}
   	else if(type.equals("WORKER"))
   	{
   	rs = stmt.executeQuery("Select id,password  from homekart.worker;"); 
   	}
   	else if(type.equals("ADMIN"))
   	{
   	 rs = stmt.executeQuery("Select id,password from homekart.admin;"); 
   	}
        while(rs.next())
        {
        	String un=rs.getString(1);
        	String pw=rs.getString(2);
        	if(un.equals(uname) && pw.equals(pword) )
        	{	
        		String redirectURL="";
        		if(type.equals("G-USER"))	
        		redirectURL = "userprofile.jsp?"+"un="+uname+"&pw"+"ax"+pw+"ax";
        		else if(type.equals("BUILDER"))
           		redirectURL = "builderprofile.jsp?"+"un="+uname+"&pw"+"ax"+pw+"ax";
        		else if(type.equals("WORKER"))
           		redirectURL = "workerprofile.jsp?"+"un="+uname+"&pw"+"ax"+pw+"ax";
        		else if(type.equals("ADMIN"))
           		redirectURL = "adminprofile.jsp?"+"un="+uname+"&pw"+"ax"+pw+"ax";
        		 
        	   response.sendRedirect(redirectURL);
        		    b=true;
        	}
        		
        }
        if(!b)
        {
        	   out.println("<script type=\"text/javascript\">");
        	   out.println("alert('User Name,password combination is incorrect');");
        	   out.println("location='index.html';");
        	   out.println("</script>");
        }
        	
 }
 catch(Exception e){
	 System.out.println(e);
 } 
%>

</body>
</html>