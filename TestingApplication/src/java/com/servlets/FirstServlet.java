package com.servlets;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

//This is the First Servlet which were created by implementing Servlet interface
public class FirstServlet implements Servlet{
    //LifeCycle method:
    ServletConfig conf;
    
    @Override
    public void init(ServletConfig conf){
        this.conf = conf;
        System.out.println("Creating Object");
    }
    
    @Override
    public void service(ServletRequest req, ServletResponse resp) throws IOException, ServletException{
        System.out.println("Servicing............");
        //Set the content type of the response
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("This is my output from service method of servlet");
        out.println("<h1>Todays date and time is : " + new Date().toString() + "</h1>");
    }
    
    @Override
    public void destroy(){
        System.out.println("Going to destroy servlet object");
    }
    
    //Non LifeCycle method:
    @Override
    public ServletConfig getServletConfig(){
        return this.conf;
    }
    
    @Override
    public String getServletInfo(){
        return "This Servlet is created by Priyanshu Baral";
    }
            
    
}
