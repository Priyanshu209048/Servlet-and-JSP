<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page errorPage="error_page.jsp" %>
<%

    User user = (User)session.getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("login_page.jsp");
    }

%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    Post p = d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Permissions-Policy" content="ambient-light-sensor=()">
        <title><%= p.getpTitle()%> || TechBlog </title>
        <!--CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            body{
                background: url(img/techblogbg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            #image{
                max-width: 30%;
                max-height: 30%;
            }
            .post-title{
                font-weight: 100;
                font-size: 30px
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
            }
            .row-user{
                border: 1px solid #ce93d8;
                padding-top: 15px;
            }
        </style>
    </head>
    <body>

        <!--Start of navbar-->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-code"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-th"></span> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-list"></span> Categories</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Programming Implementation</a>
                            <a class="dropdown-item" href="#">Data Structures</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  text-white" href="#"><span class="fa fa-phone"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  text-white" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-book"></span> Do Post</a>
                    </li>
                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <!--data-target is used to access the profile model by its id which is below of it-->
                        <!--And href="#! is used because to the model is present in the current tag"-->
                        <!--href="#" is used to scroll to an element on the current page-->
                        <a class="nav-link  text-white" href="#!" data-toggle="modal" data-target="#exampleModal"><span class="fa fa-user-circle-o"></span> <%= user.getName() %></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  text-white" href="LogoutServlet"><span class="fa fa-remove"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--End of navbar-->

        <!--Main Content of body-->

        <div class="container">

            <div class="row my-4">

                <div class="col-md-6 offset-md-3">

                    <div class="card">

                        <div class="card-header primary-background text-white text-center">

                            <h4 class="post-title"><%= p.getpTitle() %></h4>

                        </div>

                        <div class="card-body">
                            <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">

                            <div class="row my-3 row-user">
                                <div class="col-md-7">
                                    <% 
                                        UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                    %>
                                    <p class="post-user-info"><a href="#!"><%= ud.getUserByUserId(p.getUserId()).getName() %></a> has posted</p>
                                </div>

                                <div class="col-md-5">
                                    <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
                                </div>
                            </div>

                            <p class="post-content"><%= p.getpContent() %></p>

                            <br>
                            <br>

                            <div class="post-code">
                                <pre><%= p.getpCode() %></pre>
                            </div>

                        </div>

                        <div class="card-footer bg-light">

                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            %>

                            <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%= ld.countLikeOnPost(p.getPid())%></span></a>
                            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span> </span></a>
                        </div>
                        <div id="fb-root"></div>
                        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v17.0" nonce="8O7nF4sT"></script>

                        <div class="card-footer">
                            <div class="fb-comments" data-href="http://localhost:8080/TechBlogProject/show_blog_page.jsp?post_id=<%= p.getPid()%>" data-width="" data-numposts="5"></div>
                        </div>

                    </div>

                </div>

            </div>

        </div>

        <!--Main Content of body-->

        <!--Profile Module-->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img id="image" src="pics/<%= user.getProfile() %>" style="border-radius: 50%">
                            <br/>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>

                            <!--Details-->
                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td><%= user.getId() %></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">E-Mail : </th>
                                            <td><%= user.getEmail() %></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><%= user.getGender() %></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About : </th>
                                            <td><%= user.getAbout() %></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered On : </th>
                                            <td><%= user.getDateTime().toString() %></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--Profile Edit-->
                            <div id="profile-edit" style="display: none;">

                                <h3 class="mt-2">Please Edit Carefully</h3>

                                <form action="EditServlet" method="POST" enctype="multipart/form-data">

                                    <table class="table">

                                        <tr>
                                            <th>ID : </th>
                                            <td><%= user.getId() %></td>
                                        </tr>
                                        <tr>
                                            <th>E-Mail : </th>
                                            <!--<td><input type="email" class="form-control" name="user_email" value=""></td>-->
                                            <td><%= user.getEmail() %></td>
                                        </tr>
                                        <tr>
                                            <th>Name : </th>
                                            <td><input type="name" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
                                        </tr>
                                        <tr>
                                            <th>Password : </th>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
                                        </tr>
                                        <tr>
                                            <th>Gender : </th>
                                            <td><%= user.getGender().toUpperCase() %></td>
                                        </tr>
                                        <tr>
                                            <th>About : </th>
                                            <td>
                                                <textarea class="form-control" name="user_about" rows="3">
                                                    <%= user.getAbout() %>
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>New Profile: </th>
                                            <td>
                                                <input type="file" name="image" class="form-control">
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-warning">Save</button>
                                    </div>

                                </form>

                            </div>

                        </div> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn primary-background text-white">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--End of Profile Module-->

        <!--Add Post Modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details...</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control" />
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height: 200px;"></textarea>
                            </div>

                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Enter your program (if any)" style="height: 200px;"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Enter your pic...</label>
                                <input type="file" name="pic">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn primary-background btn-outline-light">Post</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!--End of Post Modal-->


        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>

                                $(document).ready(function () {
                                    let editStatus = false;

                                    $('#edit-profile-button').click(function () {
                                        if (editStatus == false) {
                                            $('#profile-details').hide();
                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else {
                                            $('#profile-details').show();
                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit");
                                        }
                                    })
                                })

        </script>

        <!--Now add JS-->
        <script>

            $(document).ready(function (e) {

                $('#add-post-form').on("submit", function (event) {
                    //This code is called when code is submited
                    event.preventDefault();

                    console.log("You have clicked on submit");

                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "Saved Successfully", "success");
                            } else {
                                swal("Error", "Something Went Wrong try again", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("Error", "Something Went Wrong try again", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })

            })

        </script>

    </body>
</html>
