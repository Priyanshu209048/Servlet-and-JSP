<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Page Directive - It is used to declare properties which is applied in the whole jsp page-->
<%@page import="java.util.*, java.lang.*, java.io.*" %>
<%@page isErrorPage="true" %>
<%@page session="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin: 0px;
                padding: 0px;
            }
        </style>
    </head>
    <body>
        
        <!--It tells the JSP engine to include the contents of another file (HTML, JSP, etc) into the current file-->
        <%@include file="header.jsp" %>
        
        <h1>Random Number : 
        <%
          Random r = new Random();
          int n = r.nextInt(50);
        %>
        <%= n %>
        </h1>

    </body>
</html>
