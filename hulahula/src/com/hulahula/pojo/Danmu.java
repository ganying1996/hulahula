package com.hulahula.pojo;

/**
 * Project: finalCourse
 * Package: com.hulahula.pojo
 *
 * @author : ganying
 * @date : 2019-04-10 13:22
 */
public class Danmu {

    private int id;
    private String color;
    private int position;
    private int size;
    private String text;
    private int time;
    private int video_id;

    @Override
    public String toString() {
        return "Danmu{" +
                "id=" + id +
                ", color='" + color + '\'' +
                ", position=" + position +
                ", size=" + size +
                ", text='" + text + '\'' +
                ", time=" + time +
                ", video_id=" + video_id +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getVideo_id() {
        return video_id;
    }

    public void setVideo_id(int video_id) {
        this.video_id = video_id;
    }
}
