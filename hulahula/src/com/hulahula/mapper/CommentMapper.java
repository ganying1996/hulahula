package com.hulahula.mapper;

import com.hulahula.pojo.Comment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.mapper
 *
 * @author : ganying
 * @date : 2019-04-09 11:08
 */
public interface CommentMapper {

    /**
     * 插入一条评论
     * @param comment
     * @return
     */
    @Insert("INSERT into av_comment VALUES(default,#{userid},#{avid},#{create_time},#{content},#{username},#{user_icon})")
    int insByComment(Comment comment);

    /**
     * 根据视频id查询评论信息
     * @param avid
     * @return
     */
    @Select("select * from av_comment where avid=#{avid} ORDER BY create_time desc")
    List<Comment> selByAvid(int avid);

    /**
     * 根据用户id查询该用户的最近4条评论
     * @param uid
     * @return
     */
    @Select("select * from av_comment where userid=#{uid} ORDER BY create_time DESC LIMIT 4")
    List<Comment> selByUserid(int uid);
}
