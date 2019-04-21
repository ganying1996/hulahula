package com.hulahula.controller;

import com.hulahula.pojo.Av;
import com.hulahula.pojo.User;
import com.hulahula.service.AvService;
import com.hulahula.service.UserService;
import com.hulahula.service.impl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.controller
 *
 * @author : ganying
 * @date : 2019-03-28 19:50
 */
@Controller
public class UserController {

    @Resource
    private UserService userServiceImpl;

    @Resource
    private AvService avService;

    /**
     * 校验用户名是否重复
     * @param uname
     * @return
     */
    @RequestMapping(value="views/checkUname")
    @ResponseBody
    public String checkUserName(String uname){
        //根据用户名查询用户
        User user = userServiceImpl.selectByName(uname);
        //如果用户存在
        if (null!= user){
            return "Y";
        } else {
            return "N";
        }
    }

    /**
     * 添加一个新用户
     * @param uname
     * @param password
     * @return
     */
    @RequestMapping(value = "views/register")
    public String addAnUser(String uname,String password){
        //创建一个新用户
        User user = new User();
        user.setUsername(uname);
        user.setPassword(password);
        //获取当前时间
        user.setCreate_time(new Date());
        //调用service插入用户
        int i = userServiceImpl.insNewUser(user);
        if (i>0){
            //注册成功，跳转至登录页面
            return "redirect:/views/login.jsp";
        } else{
            return "redirect:/views/error.jsp";
        }
    }

    /**
     * 登录验证
     * @param uname
     * @param password
     * @return
     */
    @RequestMapping(value = "views/logincheck")
    @ResponseBody
    public String logincheck(String uname,String password,HttpServletRequest request){
        //新建一个用户
        User user = new User();
        user.setUsername(uname);
        user.setPassword(password);
        //调用service校验是否符合规则
        User loginUser = userServiceImpl.selByLogin(user);
        if (null != loginUser){
            //用户名密码正确
            //把用户信息存入session
            request.getSession().setAttribute("user",loginUser);
            return "Y";
        }else {
            //用户名密码不正确
            return "N";
        }
    }

    /**
     * 登录跳转
     * @return
     */
    @RequestMapping(value = "views/login")
    public String login(HttpServletRequest request,HttpSession session){
        if (null!=request.getSession().getAttribute("user")){
            //如果用户已经通过验证，跳转至首页

            return "forward:loadIndex";
        }
        //如果没有通过验证，跳转至错误页
        return "redirect:/views/error.jsp";
    }

    /**
     * 修改用户信息
     * @param uname
     * @param desc
     * @param sex
     * @param icon_uri
     * @return
     */
    @RequestMapping(value = "views/modify")
    public String modifyUser(String uname, String desc, String sex, String icon_uri, HttpSession session){

        //新建一个user对象
        User user = new User();
        //从session中获取当前user
        User currentuser = (User) session.getAttribute("user");
        if (null != currentuser){
            user.setId(currentuser.getId());
            user.setUsername(uname);
            user.setIntroduce(desc);
            user.setSex(sex);
            user.setIcon(icon_uri);

            //调用service方法
            int i = userServiceImpl.updByUser(user);
            if (i>0){
                //更新成功
                return "redirect:/views/myHomepage.jsp";
            } else {
                //更新失败
                return "redirect:/views/error.jsp";
            }

        } else {
            //用户未登录，跳转至错误页面
            return "redirect:/views/error.jsp";
        }
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping(value = "views/logout")
    public String logout(HttpSession session){
        //清除session
        session.invalidate();
        //跳转至登录界面
        return "redirect:/views/login.jsp";
    }


    /**
     * 修改密码
     * @param npwd
     * @param uid
     * @return
     */
    @RequestMapping(value = "views/changepwd")
    @ResponseBody
    public String changePwd(String npwd,String uid){

        //用户的id
        int id = -1;

        if (uid !=""){
            id = Integer.parseInt(uid);
        }

        //调用service更改密码
        int i = userServiceImpl.updPassword(id, npwd);

        //密码修改成功
        if (i>0){
            return "1";
        } else {
            return "0";
        }

    }

}
