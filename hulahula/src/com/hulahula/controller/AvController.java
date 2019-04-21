package com.hulahula.controller;

import com.hulahula.pojo.Av;
import com.hulahula.pojo.User;
import com.hulahula.pojo.UserLike;
import com.hulahula.service.AvService;

import com.hulahula.service.UserLikeService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
 * @date : 2019-03-31 11:54
 */
@Controller
public class AvController {

    @Resource
    private AvService avService;
    @Resource
    private UserLikeService userLikeService;

    /**
     * 提交上传视频的表单
     *
     * @param av_title
     * @param desc
     * @param avType
     * @param avCover
     * @param avUri
     * @return
     */
    @RequestMapping(value = "views/uplaod")
    @ResponseBody
    public String uplaodAvForm(String av_title, String desc, String avType, String avCover, String avUri, HttpSession session) {

        int type = Integer.parseInt(avType);
        //获取当前登录用户
        User user = (User) session.getAttribute("user");
        if (null != user) {
            //新建一个视频对象
            Av av = new Av(new Date(), user.getId(), avCover, avUri, av_title, desc, type, 0, 0, 0);
            //调用serivce层添加对象
            int i = avService.insByAv(av);
            if (i > 0) {
                //数据上传成功
                return "1";
            } else {
                //服务器异常
                return "2";
            }
        } else {
            //用户未登录
            return "0";
        }

    }

    /**
     * 加载首页视频
     *
     * @return
     */
    @RequestMapping(value = "views/loadIndex")
    public String loadIndexAv(HttpServletRequest request) {

        //加载首页需要的数据
        //查询每个类型的视频
        List<Av> avList0 = avService.selByType(0);
        List<Av> avList1 = avService.selByType(1);
        List<Av> avList2 = avService.selByType(2);
        List<Av> avList3 = avService.selByType(3);


        request.getSession().setAttribute("avlist0",avList0);
        request.getSession().setAttribute("avlist1",avList1);
        request.getSession().setAttribute("avlist2",avList2);
        request.getSession().setAttribute("avlist3",avList3);


        return "forward:/views/index.jsp";
    }

    /**
     * 视频被点赞逻辑
     * @param avid
     * @param userid
     * @return
     */
    @RequestMapping(value = "views/like")
    @ResponseBody
    public String dolike(String avid,String userid,String likenum){
        int uid = 0;
        int aid = 0;
        int num = 0;
        if (null!=userid){
            uid = Integer.parseInt(userid);
        }
        if (null!=avid){
            aid = Integer.parseInt(avid);
        }
        if (null!=likenum){
            num = Integer.parseInt(likenum);
        }

        //新建一个userlike对象
        UserLike userLike = new UserLike();
        userLike.setUserid(uid);
        userLike.setAvid(aid);
        userLike.setCreate_time(new Date());

        //根据视频id修改点赞数
        int i = avService.updLikenumById(aid, num + 1);

        //修改点赞数成功
        if (i>0){
            //存储点赞记录
            int j = userLikeService.insByUserlike(userLike);

            //保存成功
            if (j>0){
                return "1";
            } else {
                //保存失败
                return "0";
            }

        } else {
            //保存失败
            return "0";
        }
    }
}
