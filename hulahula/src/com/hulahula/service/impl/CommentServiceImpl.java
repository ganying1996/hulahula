package com.hulahula.service.impl;

import com.hulahula.mapper.CommentMapper;
import com.hulahula.pojo.Comment;
import com.hulahula.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.service.impl
 *
 * @author : ganying
 * @date : 2019-04-09 11:17
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentMapper commentMapper;

    /**
     * 根据视频id查询评论信息
     * @param avid
     * @return
     */
    @Override
    public List<Comment> selByAvid(int avid) {
        return commentMapper.selByAvid(avid);
    }

    /**
     * 新增一条评论记录
     * @param comment
     * @return
     */
    @Override
    public int insByComment(Comment comment) {
        return commentMapper.insByComment(comment);
    }

    /**
     * 根据用户id查询查询该用户最近发布的4条评论
     * @param uid
     * @return
     */
    @Override
    public List<Comment> selByUserid(int uid) {
        return commentMapper.selByUserid(uid);
    }
}
