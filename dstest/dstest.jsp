<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Datasource Sample</title>
</head>
<body>
<h1>Datasource sample</h1>
<%
   Connection connection;

   DataSource itemsDS = (DataSource) new InitialContext().lookup("java:jboss/datasources/items");
   connection = itemsDS.getConnection(); 
   try {
     Statement statement = connection.createStatement();
     ResultSet rs = statement.executeQuery("SELECT * FROM Projects" );
     while( rs.next() ) {

%>
<h2>Record=(<%=rs.getInt(1)%>,<%=rs.getString(2)%>,<%=rs.getString(3)%>)</h2>
<%
     }
   }
   finally {
     connection.close();
   }
%>
</body>
</html>
