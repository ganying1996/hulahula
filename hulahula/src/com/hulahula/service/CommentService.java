package com.hulahula.service;

import com.hulahula.pojo.Comment;

import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.service
 *
 * @author : ganying
 * @date : 2019-04-09 11:14
 */
public interface CommentService {

    /**
     * 插入一条评论记录
     * @param comment
     * @return
     */
    int insByComment(Comment comment);

    /**
     * 根据视频id查询评论信息
     * @param avid
     * @return
     */
    List<Comment> selByAvid(int avid);

    /**
     * 根据用户id查询该用户最近的4条评论信息
     * @param uid
     * @return
     */
    List<Comment> selByUserid(int uid);
}
