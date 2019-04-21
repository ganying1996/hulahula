<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-03-28
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <%--禁止页面缩放--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%--引入layui的css文件--%>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <%--引入自定义nav.css文件--%>
    <link rel="stylesheet" href="../static/css/nav.css">
    <title>呼啦呼啦——登录</title>
</head>
<body style="background-color: rgb(251, 251, 251);">
<%--导航--%>
<div class="layui-header header">
    <div class="layui-main">
        <a href="loadIndex" class="layui-logo">
            <img src="../static/images/logo.png" alt="hulahula" class="main_icon">
        </a>
        <div class="nav_search">
            <div class="layui-form-item">
                <input class="layui-input" type="text" placeholder="搜索你想搜的">
            </div>
        </div>
        <div class="nav_searchbtn">
            <div class="layui-form-item">
                <button class="layui-btn">搜索</button>
            </div>
        </div>
        <ul class="layui-nav nav_ul">
            <li class="layui-nav-item"><a href="loadIndex">主站</a></li>
            <li class="layui-nav-item"><a href="">画友</a></li>
            <li class="layui-nav-item"><a href="login.jsp">登录/注册</a></li>
            <li class="layui-nav-item"><a href="">联系我们</a></li>
        </ul>
    </div>
</div>

<div class="layui-container" style="margin-top: 100px;">
    <div class="layui-row">
        <div class="layui-col-lg6">
            <img src="../static/images/login_background.png" alt="" style="height: 400px;width: 532px;">
        </div>
        <div class="layui-col-lg6" style="text-align: center;margin-top: 60px">
            <div>
                <h1>
                    <h1><img src="../static/images/main_icon.png" alt="" style="width: 48px;height: 48px;margin-right: 16px;">登录</h1>
                </h1>
            </div>
            <form class="layui-form" action="login" style="margin-top: 30px;" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-block">
                        <input type="text" name="uname" id="uname" required  lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" id="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="float: right;">
                    <div class="layui-form-mid" id="error" style="color: red"></div>
                    <div class="layui-input-block">
                        <button class="layui-btn" type="submit" id="gologin">登录</button>
                        <button type="button" class="layui-btn layui-btn-primary" id="goReg">注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%--引入layui的js文件--%>
<script src="../layui/layui.all.js"></script>
<%--引入jquery文件--%>
<script src="../static/js/jquery-3.3.1.js"></script>
<script>
    //判断是否阻止本次提交动作的标志
    var flag = true;
    //登录校验
    $("#gologin").click(function () {
        //获取表单昵称字段
        var uname = $("#uname")[0].value;
        //获取表单密码字段
        var pwd = $("#password")[0].value;
        //向后台校验用户
        $.ajax({
            type: "post",
            url: "logincheck",
            data: "uname="+uname+"&password="+pwd,
            //同步
            async: false,
            success:function (msg) {
                if("N"==msg){
                    //获取信息提示框
                    var div = $("#error");
                    div.html("用户名密码错误");
                    flag = false;
                } else {
                    flag = true;
                }
            }
        });

        return flag;
    });

    //跳转至注册页面
    $("#goReg").click(function () {
        window.location.href='register.jsp'
    });
</script>
</body>
</html>
