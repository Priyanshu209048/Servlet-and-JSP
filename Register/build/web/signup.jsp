<%-- 
    Document   : signup
    Created on : 13-Jun-2023, 12:10:08 pm
    Author     : Priyanshu Baral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>
    <body style="background: url(img/bg.jpg); background-size: cover; background-attachment: fixed;">
        <!--To use the material theme we have to use the class keyword to them style-->
        <!--In material css the container class is set to ~70% of the window width-->
        <div class="container">
            <div class="row">
                <!--In material css the container col divided into 12 card m6 is used to select the first 6 cards and offset is used to shift by 3 card to make it center-->
                <div class="col m6 offset-m3">

                    <div class="card">
                        <div class="card-content">

                            <h3 style="margin-top: 10px;" class="center-align">Register here !!</h3>
                            <h5 id="msg" class="center-align"></h5>

                            <div class="form center-align">
                                <!--Creating form-->
                                <form action="register" method="post" id="myform">
                                    <input type="text" name="user_name" placeholder="Enter your name...">
                                    <input type="password" name="user_password" placeholder="Enter your password...">
                                    <input type="email" name="user_email" placeholder="Enter your email...">

                                    <div class="file-field input-field">
                                        <div class="btn purple lighten-2">
                                            <span>File</span>
                                            <input name="image" type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>

                                    <!--When I add class in button tag then it gives material UI theme-->
                                    <button type="submit" class="btn purple lighten-2">Submit</button> 
                                </form>

                            </div>

                            <div class="loader center-align" style="margin-top: 10px; display: none">
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>

                                <h6>Please Wait...</h6>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script
            src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
        crossorigin="anonymous"></script>

        <!--This is used to check that jquery is added to our program or not, if not added then the message not display in the console of the browser.-->
        <script>
            $(document).ready(function () {
                console.log("Page is ready...");

                $("#myform").on('submit', function (event) {
                    //This line prevent form to go to servlet which is by default perform so we have to prevent it
                    event.preventDefault();
                    
                    //This can be only used for text data
                    //var f = $(this).serialize();    //Here 'this' represent to myform if
                    
                    let f = new FormData(this); //This can accept text as well as another type of data like image.
                    console.log(f); //This print all the data into the console which we want to print in the console

                    $(".loader").show();
                    $(".form").hide();

                    //This function send request
                    $.ajax({
                        url: "register",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("Success.......");
                            $(".loader").hide();
                            $(".form").show();
                            if (data.trim() === 'Done') {
                                $('#msg').html("SuccessFully Registered !!");
                                $('#msg').addClass("green-text");
                            } else {
                                $('#msg').html("Something Went Wrong on Server!!");
                                $('#msg').addClass("red-text");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("Error.......");
                            $(".loader").hide();
                            $(".form").show();
                            $('#msg').html("Something Went Wrong on Server!!");
                            $('#msg').addClass("red-text");
                        }, 
                        //By doing this work our image also able sent to the server.
                        processData: false,
                        contentType: false
                    });

                });

            });
        </script>

    </body>
</html>
