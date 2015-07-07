<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Clean Blog - Page Not Found</title>
        <%@include file="resources.jsp" %>
    </head>

    <body>
        <%@include file="navigation.jsp" %>

        <!-- Page Header -->
        <!-- Set your background image for this header on the line below. -->
        <header class="intro-header" style="background-image: url('img/404-git.jpg')">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                        <div class="page-heading">
                            <h2>Page Not Found</h2>
                            <hr class="small">
                            <span class="subheading">Sorry :(</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <p>The requested resource is not available.</p>
                    <p>Go back to <a href="index.jsp">Home</a> page.</p>
                </div>
            </div>
        </div>

        <hr>

        <!-- Footer -->
        <%@include file="footer.jsp" %>

    </body>

</html>
