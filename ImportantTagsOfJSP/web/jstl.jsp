<!--Comment Directive-->
<%-- A taglib directive is used to associate a prefix with a tag library--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--In jakarta we have to add extra two libraries for using these uri-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page isErrorPage="true" %>--%> <%--We can not use this because we don't want to make this page as a error page --%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Taglib Directive</title>
    </head>
    <body>
        <h1>Taglib Directive Example: </h1>
        <hr/>
        <!--Here name is var is used to create a variable-->
        <c:set var="name" value="Priyanshu Baral" ></c:set>
        <!--This tag is used for output-->
        <c:out value="${name}" ></c:out>
        
        <c:if test="${3>2}">
            <h2>Yes 3 is greater then 2</h2>
        </c:if>
            
        <hr/>
        <%!
            int n1 = 50;
            int n2 = 0;
            String content = null;
        %>
        <%
            int division = n1 / n2;
        %>
        <h1>Division = <%= division %></h1>
        <!--<h1>Division = <%= content.length() %></h1> This also gives error-->
        
    </body>
</html>
