package com.cleanblog.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

public class Post implements Serializable {

    private final String title;
    private String content;
    private String user;
    private Date timestamp;
    private int hitCount;
    private ArrayList<Comment> comments;
    private int commnetsOnApprovalCount;

    public Post(String title, String content, String user) {
        this.title = title;
        this.content = content;
        this.user = user;
        this.timestamp = new Date();
        this.hitCount = 0;
        this.comments = new ArrayList<Comment>();
        this.commnetsOnApprovalCount = 0;
    }

    void editPost(String user, String content) {
        this.setContent(content);
        this.user = user;
        this.timestamp = new Date();
    }

    void addComment(Comment c) {
        getComments().add(c);
        commnetsOnApprovalCount++;
    }

    void approveComment(int cid) {
        getComments().get(cid).approveComment();
        commnetsOnApprovalCount--;
    }

    void hit() {
        this.hitCount++;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the user
     */
    public String getUser() {
        return user;
    }

    /**
     * @return the timestamp
     */
    public Date getTimestamp() {
        return timestamp;
    }

    /**
     * @return the comments
     */
    public ArrayList<Comment> getComments() {
        return comments;
    }

    /**
     * @return the hitCount
     */
    public int getHitCount() {
        return hitCount;
    }

    /**
     * @return the commnetsOnApprovalCount
     */
    public int getCommnetsOnApprovalCount() {
        return commnetsOnApprovalCount;
    }
}
