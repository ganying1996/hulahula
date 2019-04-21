package com.hulahula.controller;

import com.hulahula.pojo.Av;
import com.hulahula.pojo.Collect;
import com.hulahula.pojo.History;
import com.hulahula.service.AvService;
import com.hulahula.service.CollectService;
import com.hulahula.service.HistoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.controller
 *
 * @author : ganying
 * @date : 2019-04-08 20:54
 */
@Controller
public class CollectController {

    @Resource
    private HistoryService historyService;
    @Resource
    private AvService avService;
    @Resource
    private CollectService collectService;

    /**
     * 用户点击收藏动作
     * @param avid
     * @param userid
     * @param collectnum
     * @return
     */
    @RequestMapping(value = "views/collect")
    @ResponseBody
    public String doCollect(String avid,String userid,String collectnum){

        //当前视频id
        int aid = 0;
        //当前用户id
        int uid = 0;
        //视频收藏数
        int cnum = 0;

        if (null != avid){
            aid = Integer.parseInt(avid);
        }
        if (null != userid){
            uid = Integer.parseInt(userid);
        }
        if (null != collectnum){
            cnum = Integer.parseInt(collectnum);
        }

        //生成收藏记录对象
        Collect collect = new Collect();
        collect.setAvid(aid);
        collect.setUserid(uid);
        collect.setCreate_time(new Date());


        //修改视频收藏数
        int i = avService.updColnumById(aid, cnum);

        if (i>0){
            //修改视频收藏数成功
            //生成收藏记录
            int j = collectService.insByCollect(collect);

            if (j>0){
                return "1";
            } else {
                return "0";
            }

        } else {
            return "0";
        }
    }

}
