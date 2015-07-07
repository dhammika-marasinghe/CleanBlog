package com.cleanblog.model;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {

    private final String user;
    private final String content;
    private final Date timestamp;
    private boolean approved;

    public Comment(String user, String content) {
        this.user = user;
        this.content = content;
        this.timestamp = new Date();
        this.approved = false;
    }

    void approveComment() {
        this.approved = true;
    }

    /**
     * @return the user
     */
    public String getUser() {
        return user;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @return the timestamp
     */
    public Date getTimestamp() {
        return timestamp;
    }

    /**
     * @return the approved
     */
    public boolean isApproved() {
        return approved;
    }

}
