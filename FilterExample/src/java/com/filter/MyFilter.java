package com.filter;


import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import java.io.IOException;

public class MyFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {
        System.out.println("Before Filter");
        //...
        //...
        fc.doFilter(sr, sr1);   //This line forward the filter to Servlet as we configure in the web.xml means this execute the servlet as per configuration
        System.out.println("After Filter");
        //...
        //...
    }

    @Override
    public void destroy() {
        
    }
    
}
