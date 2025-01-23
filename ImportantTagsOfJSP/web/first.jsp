<%-- 
    Document   : first
    Created on : 14-Jun-2023, 12:30:08 pm
    Author     : Priyanshu Baral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background: #e2e2e2">
        <h1>Hello World!</h1>

        <!--Declarative Tag-->
        <%!
            int a = 10;
            int b = 5;
            String name = "Priyanshu Baral";
            public int doSum() {
                return a + b;
            }

            public String reverse() {
                StringBuffer sb = new StringBuffer(name);
                return sb.reverse().toString();
            }
        %>

        <!--Scripting Tag - Auto generated servlet this went to service method-->
        <%
          out.println("a : " + a + "<br/>");
          out.println("b : " + b + "<br/>");
          out.println("Sum is : " + doSum() + "<br/>");
          out.println(reverse());
        %>

        <!--Expression Tag - it work as an alternative of the out.print-->
        <h1 style="color:blue;">Sum is : <%= doSum() %></h1>
        a : <%= a %>

    </body>
</html>
