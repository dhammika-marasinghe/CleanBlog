<%@page import="com.cleanblog.model.PostHandler"%>
<%@page import="com.cleanblog.model.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><title>Clean Blog - Contact</title>
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
                            <h1>Post Editor</h1>
                            <hr class="small">
                            <span class="subheading">Have ideas? Share with us.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Contsent -->
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="post-preview">
                        <%
                            String pid = request.getParameter("pid");
                            Post p;
                            String title = "";
                            String content = "";
                            if (pid != null) {
                                p = PostHandler.getPostByID(Integer.parseInt(pid));
                                title = p.getTitle();
                                content = p.getContent();
                            }
                        %>
                        <h2>Add New Post </h2>
                        <form name="Post" action="AddPost" onsubmit="return validateForm()" method="POST" role="form" >
                            <input type="hidden" name="pid" value="<%=pid%>" />
                            <div class="form-group">
                                <label for="title">Title:</label>
                                <input type="text" class="form-control" name="title" id="title" placeholder="Add Title" value="<%=title%>" <%if (pid != null) {
                                        out.write("disabled=\"disabled\"");
                                    }%>>
                            </div>
                            <div class="form-group">
                                <label for="content">Content:</label>
                                <textarea class="form-control" rows="15" name="content" id="content" placeholder="Write Somthing"><%=content%></textarea>
                                <br/>
                                <input type="submit" class="btn btn-success " value="Submit" />
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <hr>

        <!-- Footer -->
        <%@include file="footer.jsp" %>
        <script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script> 
        <script type="text/javascript">
                            //<![CDATA[
                            bkLib.onDomLoaded(function() {
                                nicEditors.allTextAreas();
                            });
                            //]]>
        </script>
        <script type="text/javascript">
            function validateForm() {
                var title = document.forms["Post"]["title"].value;
                var content = document.forms["Post"]["content"].value;
                if (title == null || title == "" || content == null || content == "") {
                    alert("Title and Content must be filled out");
                    return false;
                }
            }
        </script>
    </body>
</html>
