package com.hulahula.pojo;

import java.util.Date;

/**
 * Project: finalCourse
 * Package: com.hulahula.pojo
 *
 * @author : ganying
 * @date : 2019-03-31 12:21
 */
public class Av {
    private int id;
    private Date create_time;
    private int create_id;
    private String avCover;
    private String avUri;
    private String title;
    private String avDesc;
    private int type;
    private int collect_num;
    private int like_num;
    private int play_num;

    public Av() {
    }

    public Av(Date create_time, int create_id, String avCover, String avUri, String title, String avDesc, int type, int collect_num, int like_num, int play_num) {

        this.create_time = create_time;
        this.create_id = create_id;
        this.avCover = avCover;
        this.avUri = avUri;
        this.title = title;
        this.avDesc = avDesc;
        this.type = type;
        this.collect_num = collect_num;
        this.like_num = like_num;
        this.play_num = play_num;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public int getCreate_id() {
        return create_id;
    }

    public void setCreate_id(int create_id) {
        this.create_id = create_id;
    }

    public String getAvCover() {
        return avCover;
    }

    public void setAvCover(String avCover) {
        this.avCover = avCover;
    }

    public String getAvUri() {
        return avUri;
    }

    public void setAvUri(String avUri) {
        this.avUri = avUri;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAvDesc() {
        return avDesc;
    }

    public void setAvDesc(String avDesc) {
        this.avDesc = avDesc;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getCollect_num() {
        return collect_num;
    }

    public void setCollect_num(int collect_num) {
        this.collect_num = collect_num;
    }

    public int getLike_num() {
        return like_num;
    }

    public void setLike_num(int like_num) {
        this.like_num = like_num;
    }

    public int getPlay_num() {
        return play_num;
    }

    public void setPlay_num(int play_num) {
        this.play_num = play_num;
    }
}
