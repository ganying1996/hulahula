<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-03-28
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%--禁止页面缩放--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%--引入layui的css文件--%>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <%--引入自定义nav.css文件--%>
    <link rel="stylesheet" href="../static/css/nav.css">
    <title>呼啦呼啦——注册</title>
</head>
<body>
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
<%--注册页面主体--%>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-lg4 layui-col-lg-offset4" style="text-align: center;margin-top: 100px">
            <h1><img src="../static/images/main_icon.png" alt="" style="width: 48px;height: 48px;margin-right: 16px;">注册</h1>
        </div>
    </div>
    <div class="layui-row" style="margin-top: 20px;">
        <div class="layui-col-lg6 layui-col-lg-offset3">
            <form class="layui-form" action="register" method="post">
                <div class="layui-form-item">
                    <div class="layui-col-lg9">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="uname" id="uname" required  lay-verify="required" placeholder="请输入昵称(4-10个字符)" autocomplete="off" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-col-lg3">
                        <span id="unameSpan" style="margin-left: 10px;"></span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-col-lg9">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" id="password" required  lay-verify="required" placeholder="密码（6至16个字符组成，区分大小写）" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-col-lg3">
                        <span id="passwordSpan" style="margin-left: 10px;"></span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-col-lg9">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="repassword" id="repassword" required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-col-lg3">
                        <span id="repasswordSpan" style="margin-left: 10px;"></span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-col-lg9">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="go">注册</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%--引入layui的js文件--%>
<script src="../layui/layui.all.js"></script>
<script src="../static/js/jquery-3.3.1.js"></script>
<script>

    //判断昵称是否重复的标志
    var nameflag=false;
    //判断密码是否正确填写的标志
    var pwdflag=false;
    //判断确认密码是否正确填写的标志
    var repwdflag=false;
    //昵称规则
    var unamepatrn=/^[A-Za-z0-9\u4e00-\u9fa5]+$/;
    //密码规则
    var pwdpatrn=/^(\w){6,18}$/;

    //校验昵称是否被使用
    $("#uname").blur(function () {
        var name = $(this)[0].value;
        var span = $("#unameSpan");
        if(name==""){
            span.css("color","red");
            span.html("请告诉我你的昵称吧");
        } else if (!unamepatrn.test(name)){
            span.css("color","red");
            span.html("昵称不符合规则");
        } else {
            //校验用户名是否重复
            $.ajax({
                type:"post",
                url:"checkUname",
                data:"uname="+name,
                success:function (msg) {
                    //返回值为“Y”时表示昵称被人使用
                    //返回值为“N”时表示昵称未被人使用

                    var fspan = $("#unameSpan");
                    if (msg == "Y"){
                        nameflag=true;
                        fspan.css("color","red");
                        fspan.html("该昵称已被他人使用");
                    } else{
                        nameflag=false;
                        fspan.html("");
                    }
                }
            });
        }
    });

    //校验密码
    $("#password").blur(function () {
        var pwd = $(this)[0].value;
        var span = $("#passwordSpan");
        if(pwd==""||!(pwdpatrn.test(pwd))){
            pwdflag=false;
            span.css("color","red");
            span.html("密码不符合格式");
        } else{
            pwdflag=true;
            span.html("");
        }
    });

    //校验确认密码
    $("#repassword").blur(function () {
        var repwd = $(this)[0].value;
        var pwd = $("#password")[0].value;
        var span = $("#repasswordSpan");
        if(repwd!=pwd || repwd==""){
            repwdflag=false;
            span.css("color","red");
            span.html("两次密码不一致");
        } else {
            repwdflag=true;
            span.html("");
        }
    });

    //如果表单没正确填写，不能提交
    layui.form.on('submit(go)',function () {
        if (!(!nameflag&&pwdflag&&repwdflag)){
            //阻止表单提交
            return false;
        }
    });
</script>
</body>
</html>
