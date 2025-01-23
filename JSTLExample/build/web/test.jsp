<%-- 
    Document   : test
    Created on : 15-Jun-2023, 9:49:32 pm
    Author     : Priyanshu Baral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is Test Jsp</h1>
        <h1><c:out value="${i}"></c:out></h1>
    </body>
</html>
