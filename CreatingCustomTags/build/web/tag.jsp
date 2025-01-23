<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "jakarta.servlet.*, jakarta.servlet.http.*;" %>
<%@taglib uri="/WEB-INF/tlds/mylib" prefix="t" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <t:mytag></t:mytag>

            <hr/>
            <!--Here number is attribute-->
        <t:printTable number="5" color="red"></t:printTable>

            <hr/>

        <t:printTable number="10" color="blue"></t:printTable>

            <hr/>

            <!--JSP Implicit objects-->
        <%
          
            out.println("This is my implicit object");
            
            request.getParameter("");
            
            response.sendRedirect("");
            
            //config(ServletConfig)
            
            //application(ServletContext)
            
            //session
            out.println(session.isNew());
            session.setAttribute("name", "15");
            
            //page: current jsp page:
            
            //exception:Throwable...
            
            //pageContext: PageContext -- The PageContext is provisioned for the scope of processing a page (Request) and is short lived compared to a session.

        %>

    </body>
</html>
