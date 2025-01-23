<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="row">

    <% 
        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        User user = (User)session.getAttribute("currentUser");
        
        List<Post> posts = null;
        if(cid == 0){
            posts = d.getAllPost(user.getId());
        } else{
            posts = d.getPostByCatId(cid,user.getId());
        }
        
        if(posts.size() == 0){
            out.println("<h3 class='display-3 text-center'>No Posts in this category...</h3>");
            return;
        }
        
        for(Post p:posts){
    %>

    <div class="col-md-6 mt-2">

        <div class="card">

            <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">

            <div class="card-body">

                <b><%= p.getpTitle() %></b>
                <p><%= p.getpContent() %></p>

            </div>

            <div class="card-footer bg-light">
<!--                <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span> 5</span></a>
                <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span> 20</span></a>-->
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm float-right">Read More...</a>
            </div>

        </div>

    </div>

    <% 
        }
    %>
</div>