package com.cleanblog.controller;

import com.cleanblog.model.PostHandler;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddComment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String pid = request.getParameter("pid");
            String comment = request.getParameter("comment");
            String user = "user"; //request.getRemoteUser();

            int pid_ = Integer.parseInt(pid);
            if (comment == null) {
                response.sendRedirect("index.jsp");
            }
            PostHandler.addComment(pid_, user, comment);

            response.sendRedirect("post.jsp?pid=" + pid);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
