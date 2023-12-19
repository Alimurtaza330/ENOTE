package com.UserDeatil;

import java.sql.Timestamp;

public class mynotes {

    private int id;
    private String title;
    private String discription;
    private Timestamp pdate;
    private UserDetail user;

    public mynotes() {
        super();
    }

    public mynotes(int id, String title, String discription, Timestamp timestamp, UserDetail user) {
        super();
        this.id = id;
        this.title = title;
        this.discription = discription;
        this.pdate = timestamp;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp timestamp) {
        this.pdate = timestamp;
    }

    public UserDetail getUser() {
        return user;
    }

    public void setUser(UserDetail user) {
        this.user = user;
    }
}
