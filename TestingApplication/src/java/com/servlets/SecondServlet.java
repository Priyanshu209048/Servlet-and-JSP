package com.servlets;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//This is the Second Servlet which were created by extending Genric Servlet class
public class SecondServlet extends GenericServlet{

    @Override
    public void service(ServletRequest sr, ServletResponse sr1) throws ServletException, IOException {
        System.out.println("This is the servlet using GenericServlet Class");
        
        sr1.setContentType("text/html");
        PrintWriter writer = sr1.getWriter();
        writer.print("<h3>This is my second servlet using Generic Servlet</h3>");
    }
    
}
