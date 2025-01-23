package com.practice;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/RegisterServlet", name = "resgister")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        writer.print("<h2>Welcome to Register Servlet</h2>");

        String name = req.getParameter("user_name");
        String password = req.getParameter("user_password");
        String email = req.getParameter("user_email");
        String gender = req.getParameter("user_gender");
        String course = req.getParameter("user_course");

        String cond = req.getParameter("condition");
        writer.print("Checked Status : " + cond);
        if (cond != null) {
            if (cond.equals("checked")) {
                writer.println("<h2> Name : " + name + "</h2>");
                writer.println("<h2> Password : " + password + "</h2>");
                writer.println("<h2> E-mail : " + email + "</h2>");
                writer.println("<h2> Gender : " + gender + "</h2>");
                writer.println("<h2> Course : " + course + "</h2>");
                //
                //JDBC
                //
                
                //saved to db
                //...
                RequestDispatcher rd = req.getRequestDispatcher("success");
                rd.forward(req, resp);
                
            } else {
                writer.print("<h2>You have not accepted the terms and conditions</h2>");
            }
        } else {
                writer.print("<h2>You have not accepted the terms and conditions</h2>");
                //I want to include the output of index.html
                
                //Get the object of the RequestDispatcher
                RequestDispatcher dp = req.getRequestDispatcher("index.html");
                //include
                dp.include(req, resp);
        }
    }

}
