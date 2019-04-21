package com.hulahula.controller;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.hulahula.pojo.Danmu;
import com.hulahula.service.DanmuService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.controller
 *
 * @author : ganying
 * @date : 2019-04-10 15:03
 */
@Controller
public class DanmuController {

    @Resource
    private DanmuService danmuService;

    /**
     * 存储用户发送的弹幕
     * @param danmu
     * @param avid
     * @return
     */
    @RequestMapping("views/danmu")
    @ResponseBody
    public String doDanmu(String danmu,String avid){
        //danmu报文包含的数据:
        //{ "text":"你有只打了","color":"#ffffff","size":"1","position":"0","time":61}
        //把报文转化为json对象
        JSONObject json = JSONObject.fromObject(danmu);

        //先把object转string再转int
        int size = Integer.parseInt (json.get("size").toString());
        int position = Integer.parseInt (json.get("position").toString());
        int time = Integer.parseInt (json.get("time").toString());
        //新建一个弹幕对象
        Danmu newdanmu = new Danmu();
        //存入弹幕内容
        newdanmu.setText((String) json.get("text"));
        //存入弹幕颜色
        newdanmu.setColor((String) json.get("color"));
        //存入弹幕字体大小
        newdanmu.setSize(size);
        //存入弹幕播放位置
        newdanmu.setPosition(position);
        //存入弹幕发送的时间节点
        newdanmu.setTime(time);
        //存入弹幕相对应的视频id
        newdanmu.setVideo_id(Integer.parseInt(avid));

        //调用service层保存数据
        int i = danmuService.insByDanmu(newdanmu);


        return "111";
    }

    /**
     * 获取视频的所有弹幕
     * @param avid
     * @return
     */
    @RequestMapping(value = "views/getDanmu")
    @ResponseBody
    public String getDanmu(String avid, HttpServletResponse response) {

        //设置响应编码格式
        response.setContentType("text/plain;charset=utf-8");

        int aid = 0;
        if (null != avid){
            aid = Integer.parseInt(avid);
        }

        //调用service查询弹幕
        List<Danmu> danmus = danmuService.selAllByAvid(aid);

        //用于返回数据的字符串
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        if (null != danmus){
            for (Danmu d : danmus){
                sb.append("'{text:\""+d.getText()+"\",");
                sb.append("color:\""+d.getColor()+"\",");
                sb.append("size:"+d.getSize()+",");
                sb.append("position:"+d.getPosition()+",");
                sb.append("time:"+d.getTime()+"}',");
            }

            if (sb.length()>0){
                sb.deleteCharAt(sb.length()-1);
            }

            sb.append("]");


            return sb.toString();

        } else {

            return null;

        }



    }
}
