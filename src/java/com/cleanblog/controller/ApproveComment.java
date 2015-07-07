package com.cleanblog.controller;

import com.cleanblog.model.PostHandler;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApproveComment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String pid_ = request.getParameter("pid");
            String cid_ = request.getParameter("cid");

            int pid = Integer.parseInt(pid_);
            int cid = Integer.parseInt(cid_);

            PostHandler.approveComment(pid, cid);
            response.sendRedirect("CommentDashboard.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
