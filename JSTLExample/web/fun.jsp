<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Function Tag</h1>
        <p>This page is all about function tag</p>
        
        <c:set var="name" value="Priyanshu Baral"></c:set>
        <h1><c:out value="${name}"></c:out></h1>
        
        <h1><c:out value="${fn:length(name)}"></c:out></h1>
        
        <h1><c:out value="${fn:toLowerCase(name)}"></c:out></h1>
        
        <h1><c:out value="${fn:contains(name, 'ya')}"></c:out></h1>
        
    </body>
</html>
