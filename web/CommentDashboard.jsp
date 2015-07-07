<%@page import="java.util.ArrayList"%>
<%@page import="com.cleanblog.model.Comment"%>
<%@page import="com.cleanblog.model.PostHandler"%>
<%@page import="com.cleanblog.model.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><title>Clean Blog - Comment Dashboard</title>
        <%@include file="resources.jsp" %>
    </head>

    <body>
        <!-- Navigation -->
        <%@include file="navigation.jsp" %>

        <!-- Page Header -->
        <!-- Set your background image for this header on the line below. -->
        <header class="intro-header" style="background-image: url('img/home-bg.jpg')">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                        <div class="page-heading">
                            <h1>Comment Dashboard</h1>
                            <hr class="small">
                            <span class="subheading">Comments to be Approved.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <%
                        boolean noComments = true;
                        Post p;
                        for (int pid = 0; pid < PostHandler.getCurrentID(); pid++) {
                            p = PostHandler.getPostByID(pid);
                            if (p.getCommnetsOnApprovalCount() > 0) {
                    %>
                    <div class="post-preview">
                        <a href="post.jsp?pid=<%=pid%>">
                            <h3 class="post-title">  <%=p.getTitle()%> </h3>
                        </a>
                        <%
                            ArrayList<Comment> comments = p.getComments();
                            for (int cid = 0; cid < p.getComments().size(); cid++) {
                                if (!comments.get(cid).isApproved()) {
                                    if (noComments) {
                                        noComments = false;
                                    }
                        %>
                        <a href="ApproveComment?pid=<%=pid%>&cid=<%=cid%>">
                            <button type="button" class="btn btn-default ">Approve</button></a> <%=comments.get(cid).getContent()%> 
                        <p class="post-meta">Commented by <a href="#"><%=comments.get(cid).getUser()%></a> on <%=comments.get(cid).getTimestamp()%></p>
                        <%
                                }
                            }
                        %>
                    </div>
                    <hr>
                    <%                            }
                        }
                        if (noComments) {
                    %>
                    <div class="post-preview">
                        <h5 class="post-subtitle">No Comments to be approved. Go back to <a href="index.jsp">home</a> page.</h5>
                    </div>
                    <%
                        }
                    %>

                </div>
            </div>
        </div>
        <hr>

        <!-- Footer -->
        <%@include file="footer.jsp" %>

    </body>
</html>
