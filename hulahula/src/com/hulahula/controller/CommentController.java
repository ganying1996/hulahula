package com.hulahula.controller;

import com.hulahula.pojo.Comment;
import com.hulahula.service.CommentService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Project: finalCourse
 * Package: com.hulahula.controller
 *
 * @author : ganying
 * @date : 2019-04-09 11:24
 */
@Controller
public class CommentController {

    @Resource
    private CommentService commentService;

    /**
     * 用户评论
     * @param userid
     * @param avid
     * @param content
     * @param uname
     * @param uicon
     * @return
     */
    @RequestMapping(value = "views/comment")
    @ResponseBody
    public Object doComment(String userid, String avid, String content,String uname, String uicon){

        //返回数据的json对象
        JSONObject res = new JSONObject();

        //当前用户id
        int uid = 0;
        //当前视频id
        int aid = 0;

        if (null != userid){
            uid = Integer.parseInt(userid);
        }
        if (null != avid){
            aid = Integer.parseInt(avid);
        }

        //新建一个评论对象
        Comment comment = new Comment();
        comment.setAvid(aid);
        comment.setUserid(uid);
        comment.setContent(content);
        comment.setCreate_time(new Date());
        comment.setUsername(uname);
        comment.setUser_icon(uicon);

        //调用service 存储评论信息
        int i = commentService.insByComment(comment);

        if (i>0){
            //记录保存成功
            res.put("code","1");
            res.put("comment",comment);

            return res;
        } else {
            //记录保存失败
            res.put("code","0");
            res.put("comment","");

            return res;
        }
    }
}
