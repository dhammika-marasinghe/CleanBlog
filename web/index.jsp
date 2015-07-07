<%@page import="com.cleanblog.model.PostHandler"%>
<%@page import="com.cleanblog.model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //PostHandler.setRealPath(request);%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Clean Blog</title>        
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
                        <div class="site-heading">
                            <h1>Clean Blog</h1>
                            <hr class="small">
                            <span class="subheading">A Clean Blog Theme by Start Bootstrap</span>
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
                        String startPID = request.getParameter("startPID");
                        int startPID_;
                        if (startPID == null || startPID.equals("null")) {
                            startPID_ = 0;
                        } else {
                            startPID_ = Integer.parseInt(startPID);
                        }
                        Post post;
                        boolean lastPage = false;
                        if (PostHandler.getCurrentID() != 0) {
                            for (int pid = PostHandler.getCurrentID() - startPID_, i = 1; i <= 10; i++) {
                                post = PostHandler.getPostByID(pid - i);
                                if (post == null) {
                                    lastPage = true;
                                    break;
                                }
                    %>
                    <div class="post-preview">
                        <a href="post.jsp?pid=<%=(pid - i)%>">
                            <h2 class="post-title">
                                <%=post.getTitle()%>
                            </h2>
                        </a>
                        <p class="post-meta">Posted by <a href="#"><%=post.getUser()%></a> on <%=post.getTimestamp()%> | <%=post.getHitCount()%> hits | <%=post.getComments().size()%> comments</p>
                    </div>
                    <hr>
                    <%
                        }
                    } else {
                    %>
                    <div class="post-preview">
                        <h5 class="post-subtitle">No Posts. Be the first to <a href="new_post">post</a>.</h5>
                    </div>
                    <%
                        }
                        if (startPID_ >= 10) {
                    %>
                    <!-- Pager -->
                    <ul class="pager">
                        <li class="previous">
                            <a href="index.jsp?startPID=<%=(startPID_ - 10)%>">Previous Posts &larr;</a>
                        </li>
                    </ul>
                    <%
                        }
                        if (!lastPage) {
                    %>
                    <!-- Pager -->
                    <ul class="pager">
                        <li class="next">
                            <a href="index.jsp?startPID=<%=(startPID_ + 10)%>">Older Posts &rarr;</a>
                        </li>
                    </ul>
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
