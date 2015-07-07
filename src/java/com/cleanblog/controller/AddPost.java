package com.cleanblog.controller;

import com.cleanblog.model.Post;
import com.cleanblog.model.PostHandler;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddPost extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String pid = request.getParameter("pid");
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String user = "user"; //request.getRemoteUser();
            System.out.println(request.getServletContext().getRealPath("/posts/blogger.cache"));
//            if (title == null || content == null) {
//                response.sendRedirect("index.jsp");
//            }

            if (pid == null || pid.equals("null")) {
                PostHandler.addPost(new Post(title, content, user));
                pid = (PostHandler.getCurrentID() - 1) + "";
            } else {
                int pid_ = Integer.parseInt(pid);
                PostHandler.editPost(pid_, user, content);
            }
            response.sendRedirect("post.jsp?pid=" + pid);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
