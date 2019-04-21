<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-04-11
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--引入jstl标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
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

    <title>呼啦呼啦——修改密码</title>
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
            <%--用户未登录--%>
            <c:if test="${sessionScope.user == null}">
                <li class="layui-nav-item"><a href="login.jsp">登录/注册</a></li>
            </c:if>
            <%--用户已登录--%>
            <c:if test="${sessionScope.user != null}">
                <li class="layui-nav-item">
                    <a href=""><img src="<%=basePath%>${sessionScope.user.getIcon()}" class="layui-nav-img">${sessionScope.user.getUsername()}</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">修改密码</a></dd>
                        <dd><a href="myHomepage.jsp">个人中心</a></dd>
                        <dd><a href="javascript:;">我的收藏</a></dd>
                        <dd><a href="javascript:;">我的喜欢</a></dd>
                        <dd><a href="javascript:;">历史记录</a></dd>
                        <dd><a href="logout">退出登录</a></dd>
                    </dl>
                </li>
            </c:if>
            <li class="layui-nav-item"><a href="uploadAv.jsp"><i class="layui-icon layui-icon-upload-drag" style="font-size: 18px;margin-right: 5px"></i>投稿</a></li>
        </ul>
    </div>
</div>
<div class="layui-container" style="text-align: center;margin-top: 20px;width: 600px">
    <div class="layui-row">
        <div class="layui-col-lg4 layui-col-lg-offset4" style="text-align: center;margin-top: 100px">
            <h1><img src="../static/images/main_icon.png" alt="" style="width: 48px;height: 48px;margin-right: 16px;">修改密码</h1>
        </div>
    </div>
    <form action="" class="layui-form" style="margin-top: 30px;">
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码：</label>
            <div class="layui-input-block">
                <input type="password" name="oldpwd" id="oldpwd" required  lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码：</label>
            <div class="layui-input-block">
                <input type="password" name="npwd" id="npwd" required  lay-verify="required" placeholder="请输入新密码（6至16个字符组成，区分大小写）" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码：</label>
            <div class="layui-input-block">
                <input type="password" name="rpwd" id="rpwd" required  lay-verify="required" placeholder="请确认新密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="go">立即更改</button>
                <button type="reset" id="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
        <input type="text" id="opwd" value="${sessionScope.user.getPassword()}" style="display: none">
        <input type="text" id="uid" name="uid" value="${sessionScope.user.getId()}" style="display: none">
    </form>
</div>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.3.1.js"></script>
</body>
<script>
    //加载form组件
    var form = layui.form;
    //加载layer组件
    var layer = layui.layer;
    //密码规则
    var pwdpatrn=/^(\w){6,18}$/;

    
    //判断是否提交表单的标志
    var oflag = true;
    var nflag = true;
    var rflag = true;

    //校验旧密码是否正确
    $("#oldpwd").blur(function () {
        //获取当前用户的密码
        var opwd = $("#opwd")[0].value;
        //获取当前表单的值
        var value = $(this)[0].value;
        if (value != opwd){
            layer.msg('旧密码错误',{icon:5});
            oflag=false;
        }else {
            oflag = true;
        }
    });

    //校验新密码是否符合规则
    $("#npwd").blur(function () {
        //获取当前表单的值
        var npwd = $(this)[0].value;
        if (!pwdpatrn.test(npwd)){
            layer.msg('新密码不符合规则',{icon:5});
            nflag=false;
        } else {
            nflag =true;
        }
    });

    //校验确认密码是否正确
    $("#rpwd").blur(function () {
        //获取新密码框的值
        var npwd = $("#npwd")[0].value;
        //获取当前表单的值
        if (npwd != $(this)[0].value ) {
            layer.msg('两次密码不一致',{icon:5});
            rflag=false;
        } else {
            rflag = true;
        }
    });

    form.on('submit(go)',function (data) {
        //判断表单是否正确填写
        if (!(oflag&&nflag&&rflag)){
            //填写不正确，不提交表单
            return false;
        } else {
            $.ajax({
                type:'post',
                url:'changepwd',
                data:{"npwd":data.field.npwd,"uid":data.field.uid},
                success:function (res) {
                    //res == 1 修改密码成功
                    //res == 0 修改密码失败

                    if (res == 0){
                        layer.confirm('密码修改失败，请重试',{
                            btn:['确定']  //按钮
                        },function () {
                            //清空表单
                            $("#reset").click();
                        });
                    }
                    if (res == 1){
                        layer.confirm('修改成功！',{
                            btn:['确定']  //按钮
                        },function () {
                            //退出当前登录
                            window.open("logout","_self");
                        });
                    }

                }
            });
        }
        //表单恒不提交
        return false;
    })

</script>
</html>
