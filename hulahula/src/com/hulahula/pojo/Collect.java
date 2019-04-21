package com.hulahula.pojo;


import java.util.Date;

/**
 * Project: finalCourse
 * Package: com.hulahula.pojo
 *
 * @author : ganying
 * @date : 2019-04-08 20:41
 */
public class Collect {

    private int id;
    private int userid;
    private int avid;
    private Date create_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getAvid() {
        return avid;
    }

    public void setAvid(int avid) {
        this.avid = avid;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}
