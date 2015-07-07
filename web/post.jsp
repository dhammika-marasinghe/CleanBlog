<%@page import="com.cleanblog.model.Comment"%>
<%@page import="com.cleanblog.model.PostHandler"%>
<%@page import="com.cleanblog.model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Clean Blog - Post</title>
        <%@include file="resources.jsp" %>
    </head>

    <body>
        <!-- Navigation -->
        <%@include file="navigation.jsp" %>

        <%
            int pid = Integer.parseInt(request.getParameter("pid"));
            Post post = PostHandler.getPostByID(pid);
            if (post == null) {
                response.sendRedirect("index.jsp");
            }
            PostHandler.hitPost(pid);
        %>
        <!-- Page Header -->
        <!-- Set your background image for this header on the line below. -->
        <header class="intro-header" style="background-image: url('img/home-bg.jpg')">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                        <div class="post-heading">
                            <h1><%=post.getTitle()%></h1>
                            <span class="meta">Posted by <a href="#"><%=post.getUser()%></a> on <%=post.getTimestamp()%> | <%=post.getHitCount()%> hits | <%=post.getComments().size()%> comments</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Post Content -->
        <article>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                        <h1><%=post.getTitle()%></h1>
                        <p><%=post.getContent()%></p>
                        <a href="postEditor.jsp?pid=<%=pid%>"><button type="button" class="btn btn-default ">Edit Post</button></a>
                        <hr>
                        <h2>Comments</h2>
                        <hr>
                        <%
                            ArrayList<Comment> comments = post.getComments();
                            if (comments == null || comments.isEmpty()) {
                        %>
                        <div class="user-comment">                        
                            <h5 class="post-subtitle">No comments. Be the first to comment.</h5>
                        </div>   
                        <%
                        } else {
                            int commentsOnApproval = 0;
                            for (Comment c : comments) {
                                if (c.isApproved()) {
                        %>
                        <div class="user-comment">                        
                            <h4 class="post-subtitle"><%=c.getContent()%></h4>                   
                            <p class="post-meta">Commented by <a href="#"><%=c.getUser()%></a> on <%=c.getTimestamp()%></p>
                        </div>                
                        <hr>
                        <%
                                } else {
                                    commentsOnApproval++;
                                }
                            }
                            if (commentsOnApproval > 0) {
                        %>
                        <div class="user-comment">                        
                            <h5 class="post-subtitle"><%=commentsOnApproval%> comments on approval. Approve them on <a href="CommentDashboard.jsp">Comment Dashboard</a></h5>
                        </div>   
                        <%
                                }
                            }
                        %>
                        <div class="post-preview">                    
                            <h3>Add New Comment </h3>
                            <form name="Comment" action="AddComment"   method="POST" role="form">
                                <input type="hidden" name="pid" value="<%=pid%>" />
                                <div class="form-group">
                                    <label for="content">Comment:</label>
                                    <textarea class="form-control" rows="5" name="comment" id="comment" placeholder="Write Somthing" required></textarea>
                                </div>
                                <input type="submit" class="btn btn-default " value="Comment" />
                            </form>
                        </div>
                        <hr>
                    </div>

                </div>
            </div>
        </article>

        <!-- Footer -->
        <%@include file="footer.jsp" %>
    </body>

</html>
