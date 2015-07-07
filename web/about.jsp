<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Clean Blog - About US</title>
        <%@include file="resources.jsp" %>
    </head>

    <body>
        <%@include file="navigation.jsp" %>

        <!-- Page Header -->
        <!-- Set your background image for this header on the line below. -->
        <header class="intro-header" style="background-image: url('img/home-bg.jpg')">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                        <div class="page-heading">
                            <h1>About US</h1>
                            <hr class="small">
                            <span class="subheading">This is what we do.</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <p>E/11/258 Marasinghe, M.M.D.B.</p>
                    <p>E/11/148 Herath, D.H.M.S.N.</p>
                </div>
            </div>
        </div>

        <hr>

        <!-- Footer -->
        <%@include file="footer.jsp" %>

    </body>

</html>
