/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.*;

/**
 *
 * @author Priyanshu Baral
 */

//Through this annotation we can use different types of data like images.
@MultipartConfig
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            //We had remove the html part because we prevent to redirect the data into servlet page now the data only shows in the console
            
            //Getting all the incoming detail from the request...
            
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            //This class represents a part or form item that was received within a multipart/form-data POST request.
            Part part = request.getPart("image");
            String filename = part.getSubmittedFileName();
            //out.println(filename);
            //If we peint them then error occured because in ajax we only check the done string not whole data if data submited.
            
            //Connection..........
            try {
                Thread.sleep(3000);
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup_db","root","mysql12345");
                //Query...
                String q = "insert into user(name, password, email, imageName) values(?, ?, ?, ?)";
                
                PreparedStatement ps = con.prepareStatement(q);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, filename);
                
                //Fire query...
                ps.executeUpdate();
                //Upload...
                InputStream is = part.getInputStream();
                byte[] data = new byte[is.available()]; //is.available() this means the size available to byte it gives it.
                
                is.read(data);
                //.getRealPath gives the path to the in build folder then web folder in the project
                String path = request.getServletContext().getRealPath("/")+"img"+File.separator+filename;   //Here File.separator is used to put back slash according to the platform
                //out.println(path);
                FileOutputStream fos = new FileOutputStream(path);
                fos.write(data);
                
                fos.close();
                
                out.println("Done");
                
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("Error");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
