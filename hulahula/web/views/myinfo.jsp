<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-04-02
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--引入jstl标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%--禁止页面缩放--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%--引入layui的css文件--%>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
    <%--引入自定义nav.css文件--%>
    <link rel="stylesheet" href="<%=basePath%>/static/css/nav.css">
    <title>呼啦呼啦——修改信息</title>
</head>
<body>
<%--顶部导航--%>
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
<%--页面主体--%>
<div class="layui-container" style="margin-top: 100px;">
    <div class="layui-row">
        <div class="layui-col-lg4 layui-col-lg-offset4" style="text-align: center;margin-bottom: 40px;margin-left: 140px">
            <h1><img src="../static/images/main_icon.png" alt="" style="width: 48px;height: 48px;margin-right: 16px;">修改个人信息</h1>
        </div>
    </div>
    <div style="margin-left: 110px;">
        <div class="layui-upload-drag" id="show">
            <i class="layui-icon layui-icon-upload-drag"></i>
            <p>点击上传头像，或将文件拖拽到此处</p>
        </div>
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="icon" style="height: 100px;width: 100px;border-radius: 50%;margin-left: 320px;margin-top: -170px;border: #0C0C0C solid 1px" src="<%=basePath%>${sessionScope.user.getIcon()}">
        </div>
    </div>
    <form class="layui-form" action="modify" method="post" style="width: 50%;position: relative;padding-top: 10px">
        <div class="layui-form-item">
            <label class="layui-form-label">昵称：</label>
            <div class="layui-input-block">
                <input type="text" name="uname" required  lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input" value="${sessionScope.user.getUsername()}">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">个性签名：</label>
            <div class="layui-input-block">
                <textarea name="desc" placeholder="请输入个性签名" class="layui-textarea" lay-verify="required" value="${sessionScope.user.getIntroduce()}"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="m" title="男">
                <input type="radio" name="sex" value="f" title="女">
            </div>
        </div>
        <input type="text" id="icon_uri" name="icon_uri" value="" style="display: none">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="go">立即保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.3.1.js"></script>
<script>
    //获取上传组件
    var upload = layui.upload;
    //获取弹出框组件
    var layer = layui.layer;
    //获取表单组件
    var form = layui.form;

    //拖拽上传
    upload.render({
        elem: '#show'
        ,url: 'uploadAimg'
        ,accept: 'images'
        ,before: function(obj){     //上传前执行的方法

            //预读本地文件，不支持ie8
            obj.preview(function(index, file, result){
                $('#icon').attr('src', result); //图片链接（base64）
            });
        }
        ,done: function(res){
            //code=1 上传成功
            //code=2 上传异常（服务器异常）
            //code=0 文件为空
            if(res.code = 0){
                return layer.msg('上传文件为空，请重新上传',{icon:5});
            }
            if (res.code = 1){
                //获取头像uri输入框,并赋值
                $("#icon_uri").val(res.data);
                return layer.msg("封面上传成功");
            }
            if (res.code = 2){
                return layer.msg('文件上传异常，请重试',{icon:5});
            }
        }
    });

    //表单提交
    form.on('submit(go)',function (data) {
        //判断是否选择了性别
        if (!data.field.sex) {
            layer.msg('未选择性别',{icon:5});
            return false;
        }
        if (!data.field.icon_uri) {
            layer.msg('未上传头像',{icon:5});
            return false;
        }
    });

</script>
</html>
