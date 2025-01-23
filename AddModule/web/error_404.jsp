<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! Page not found...</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        
        <style>
            img{
                height: 30%;
                width: 30%;
            }
        </style>
        
    </head>
    <body>
        
        <!--p is for padding-->
        <div class="conatiner p-3 text-center   ">
            <!--this image class is used for make the image responsive-->
            <img src="img/404-page-error.png" class="img-fluid"/>
            
            <h1 class="display-3">Sorry ! Page not found...</h1>
            
            <a class="btn btn-outline-primary mt-3" href="index.html">Home Page</a>
        </div>
        
    </body>
</html>
