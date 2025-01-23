<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL Example</title>
    </head>
    <body>

        <h1>This is JSTL Example</h1>

        <!--1. Out Tag : It is used to get an output-->
        <!--2. Set Tag : It is use to assign a variable-->
        <c:set var="i" value="10" scope="application"></c:set>  <!-- Here scope means where we want to use this variable like in a particular program or whole jsp -->
        <h1><c:out value="${i}"></c:out></h1>
        <c:set var="j" value="20" scope="application"></c:set>
        <h1><c:out value="${j}"></c:out></h1>

            <!--3. Remove-->
        <c:remove var="i"></c:remove>
        <h1><c:out value="${i}">We remove the value here</c:out></h1>

        <!--4. If Case : Test Condition-->
        <c:if test="${j==10}">
            <h1>Yes this is the if true statement</h1>
        </c:if>
            
        <!--5. Choose, When, Otherwise : Java Switch-->
        <c:choose>
            <c:when test="${j > 100}">
                <h1>This is greater then 100</h1>
            </c:when>
                <c:when test="${j < 100}">
                <h1>This is smaller then 100</h1>
            </c:when>
            <c:otherwise>
                <h1>Value of j is equal to 100</h1>
            </c:otherwise>
        </c:choose>
                
        <!--6. For Each Tag : For repeating and traversing-->
        <c:forEach var="k" begin="1" end="5">   <!-- In collection we use items keyword -->
            <h1>Value of k is <c:out value="${k}"></c:out></h1>
        </c:forEach>
            
        <!--7. Redirect Tag-->
        <c:url var="myurl" value="https://www.google.com/search">
            <c:param name="q" value="Servlet"></c:param>
        </c:url>
        
        <c:out value="${myurl}"></c:out>
        
        <%--<c:redirect url="${myurl}"></c:redirect>--%>

    </body>
</html>
