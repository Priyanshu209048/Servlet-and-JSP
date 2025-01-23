package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(urlPatterns = "/web3", name = "Third")  //We can also this type of mapping instead of map using servlet tag in web.xml file
public class ThirdServlet extends HttpServlet{
    
    //doGet() shall be used to sent the data and less secure then doPost().
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        System.out.println("This is the get method...");
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        writer.print("<h3>This is the get method data...</h3>");
        writer.print(new Date().toString());
    }

    //doPost() shall be used when comparatively large amount of sensitive data has to be sent.
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("This is the post method...");
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        writer.print("<h3>This is the post method data...</h3>");
    }
    
    
    
}
