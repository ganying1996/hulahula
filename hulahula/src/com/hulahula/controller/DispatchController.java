package com.hulahula.controller;

import com.hulahula.pojo.Av;
import com.hulahula.pojo.Comment;
import com.hulahula.pojo.History;
import com.hulahula.pojo.User;
import com.hulahula.service.AvService;
import com.hulahula.service.CommentService;
import com.hulahula.service.HistoryService;
import com.hulahula.service.UserService;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.controller
 *
 * @author : ganying
 * @date : 2019-04-08 13:30
 */
@Controller
public class DispatchController {

    @Resource
    private AvService avService;
    @Resource
    private UserService userService;
    @Resource
    private HistoryService historyService;
    @Resource
    private CommentService commentService;

    /**
     * 观看视频
     * @param id
     * @param type
     * @param request
     * @return
     */
    @RequestMapping(value = "views/play")
    public String toplay(String id, String type,String uid, HttpServletRequest request){
        //当前播放的视频id
        int aid=0;
        //当前登录的用户id
        int cuserid = 0;

        //把id转为int类型
        if (""!=id){
            aid = Integer.parseInt(id);
        }
        if ("" != uid){
            cuserid = Integer.parseInt(uid);
        }
        //拼接av列表名称
        String name = "avlist"+type;
        //用于接收当前AV对象
        Av currentAv = new Av();

        List<Av> avlist = (List) request.getSession().getAttribute(name);

        if (null != avlist){

            for (Av av : avlist){
                if (av.getId() == aid){
                    currentAv = av;
                }
            }

            //根据发布者id查询发布者信息
            User user = userService.selById(currentAv.getCreate_id());
            //修改视频观看次数
            int i = avService.updPlaynumById(currentAv.getId(), currentAv.getPlay_num() + 1);
            //生成观看历史记录对象
            History history = new History();
            history.setUserid(cuserid);
            history.setAvid(aid);
            history.setCreate_time(new Date());

            //根据当前播放视频的id查询该视频所有评论
            List<Comment> comments = commentService.selByAvid(aid);


            //视频播放次数修改成功
            if (i>0){

                //生成播放记录
                int j = historyService.insByHistory(history);

                if (j>0){
                    //把视频和视频发布者存储在requestScope中
                    request.setAttribute("paly_av",currentAv);
                    request.setAttribute("paly_user",user);
                    request.setAttribute("avuri",currentAv.getAvUri());
                    request.setAttribute("comments",comments);
                    request.setAttribute("commentsnum",comments.size());

                    return "forward:/views/play.jsp";
                } else {
                    //生成历史记录失败
                    return "redirect:/views/error.jsp";
                }

            } else {
                //播放次数修改失败
                return "redirect:/views/error.jsp";
            }

        } else{

            return "redirect:/views/error.jsp";
        }

    }


    /**
     * 跳转至个人首页
     * @param userid
     * @param session
     * @return
     */
    @RequestMapping(value = "views/mypage")
    public String dispToUserpage(String userid, HttpSession session){
        //接收用户id
        int uid = 0;

        if (null != userid){
            uid = Integer.parseInt(userid);
        }

        //根据uid查询用户最近收藏的视频
        List<Av> avsLike = avService.selByLike(uid);

        //根据uid查询用户最近观看的视频
        List<Av> avsHistory = avService.selByHistory(uid);

        //根据uid查询用户最近的评论
        List<Comment> comments = commentService.selByUserid(uid);

        if (null != avsHistory&& null!=avsLike && null != comments){

            //把查询到的信息存入session中
            session.setAttribute("likelist",avsLike);
            session.setAttribute("historylist",avsHistory);
            session.setAttribute("commentlist",comments);

            //跳转到个人主页
            return "forward:/views/myHomepage.jsp";
        } else{
            return "redirect:/views/error.jsp";

        }


    }

}
