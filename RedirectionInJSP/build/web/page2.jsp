<%-- 
    Document   : page2
    Created on : 15-Jun-2023, 12:41:41 am
    Author     : Priyanshu Baral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: red">
        <h1>This is page 2</h1>
        
        <%
            //redirection
            //response.sendRedirect("page3.jsp");
            response.sendRedirect("https://www.javatpoint.com/steps-to-create-a-servlet-using-tomcat-server");
        %>
        
    </body>
</html>
