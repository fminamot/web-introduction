<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Datasource Sample</title>
</head>
<body>
<h1>Datasource sample</h1>
<%
 Connection conn;
 Statement stat;
 ResultSet rs;

 try {
   conn = DriverManager.getConnection(
         "jdbc:mysql://localhost/items?user=user1&password=mypa55");
   try {
     stat = conn.createStatement();
     rs = stat.executeQuery("SELECT * FROM Projects" );
     while( rs.next() ) {

%>
<h2><%=rs.getInt(1)%> <%=rs.getString(2)% <%=rs.getString(3)%></h2>
<%
   finally {
     conn.close();
   }
%>
</body>
</html>
