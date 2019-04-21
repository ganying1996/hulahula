package com.hulahula.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Project: finalCourse
 * Package: com.hulahula.controller
 *
 * @author : ganying
 * @date : 2019-03-30 14:48
 */
@Controller
public class FileUplaodController {


    /**
     * 视频封面上传
     * @param multipartFile
     * @param request
     * @return
     */
    @RequestMapping(value = "views/uploadImg")
    @ResponseBody
    public String uploadImg(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request){

        //返回的json数据
        JSONObject res = new JSONObject();

        if(!StringUtils.isEmpty(multipartFile)&&multipartFile.getSize()>0){
            //获取文件原名称（带后缀）
            String fileName = multipartFile.getOriginalFilename();
            //获取文件后缀
            String suffix = fileName.substring(fileName.lastIndexOf(".")+1);
            //获取项目存放视频的路径，并创建一个新文件
            String realPath = request.getServletContext().getRealPath("static/images/avCover/");
            String newfileName=new Date().getTime()+"."+suffix;
            File newfile = new File(realPath+newfileName);


            try {
                //把上传的文件写入新文件
                multipartFile.transferTo(newfile);
                //图片上传后的uri
                String imguri = "/static/images/avCover/"+newfileName;

                //上传成功
                res.put("code","1");
                res.put("data",imguri);

                return res.toString();
            } catch (IOException e) {
                //文件上传异常
                e.printStackTrace();

                res.put("code","2");
                res.put("data","");
                return res.toString();
            }
        } else {
            //文件为空
            res.put("code","2");
            res.put("data","");
            return res.toString();
        }
    }

    /**
     * 视频上传
     * @param multipartFile
     * @param request
     * @return
     */
    @RequestMapping(value = "views/uplaodAv")
    @ResponseBody
    public String uploadAv(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request){

        //用于返回数据的json对象
        JSONObject res = new JSONObject();
        if(!StringUtils.isEmpty(multipartFile)&&multipartFile.getSize()>0){
            //获取文件名称
            String filename = multipartFile.getOriginalFilename();
            //截取文件后缀
            String suffix = filename.substring(filename.lastIndexOf(".")+1);
            //获取项目路径
            String realPath = request.getServletContext().getRealPath("static/av/");
            //创建一个新文件
            String newFilename = new Date().getTime()+"."+suffix;
            File newfile = new File(realPath+newFilename);
            //将源文件写入新文件
            try {
                multipartFile.transferTo(newfile);
                //获取新文件uri
                String uri = "/static/av/"+newFilename;

                res.put("code","1");
                res.put("data",uri);

                return res.toString();
            } catch (IOException e) {
                //文件上传异常
                e.printStackTrace();
                res.put("code","2");
                res.put("data","");

                return res.toString();
            }

        } else {
            //文件为空
            res.put("code","0");
            res.put("data","");
            return res.toString();
        }
    }

    /**
     * 用户上传头像
     * @param multipartFile
     * @param request
     * @return
     */
    @RequestMapping(value = "views/uploadAimg")
    @ResponseBody
    public String uploadAccountImg(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request){
        //返回给浏览器的json数据
        JSONObject res = new JSONObject();

        if (!StringUtils.isEmpty(multipartFile)&&multipartFile.getSize()>0){
            //获取文件名称
            String filename = multipartFile.getOriginalFilename();
            //截取文件后缀
            String suffix = filename.substring(filename.lastIndexOf(".")+1);
            //获取项目路径
            String realPath = request.getServletContext().getRealPath("static/images/account_icon/");
            //创建一个新文件
            String newFilename = new Date().getTime()+"."+suffix;
            File newfile = new File(realPath+newFilename);
            //将源文件写入新文件
            try {
                //写入成功
                multipartFile.transferTo(newfile);

                String uri = "static/images/account_icon/"+newFilename;

                res.put("code","1");
                res.put("data",uri);

                return res.toString();
            } catch (IOException e) {
                //服务器异常
                e.printStackTrace();

                res.put("code","2");
                res.put("data","");

                return res.toString();
            }

        } else {
            //文件为空

            res.put("code","0");
            res.put("data","");

            return res.toString();
        }
    }
}
