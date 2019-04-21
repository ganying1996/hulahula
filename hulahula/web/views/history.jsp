<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-04-18
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--引入jstl标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <title>呼啦呼啦——历史记录</title>
</head>
<body>
<%--导航--%>
<div class="layui-header header">
    <div class="layui-main">
        <a href="loadIndex" class="layui-logo">
            <img src="../static/images/logo.png" alt="hulahula" class="main_icon">
        </a>
        <form action="search">
            <div class="nav_search">
                <div class="layui-form-item">
                    <input class="layui-input" type="text" placeholder="搜索你想搜的" name="keyword">
                </div>
            </div>
            <div class="nav_searchbtn">
                <div class="layui-form-item">
                    <button class="layui-btn" type="submit">搜索</button>
                </div>
            </div>
        </form>
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
                    <a href="myHomepage.jsp"><img src="<%=basePath%>${sessionScope.user.getIcon()}" class="layui-nav-img">${sessionScope.user.getUsername()}</a>
                    <dl class="layui-nav-child">
                        <dd><a href="changePwd.jsp">修改密码</a></dd>
                        <dd><a href="mypage?userid=${sessionScope.user.getId()}">个人中心</a></dd>
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
<div>
    <img src="<%=basePath%>/static/images/index-header.png" alt="">
</div>
<div class="layui-container" style="margin-top: 50px">
    <div class="layui-row">
        <div class="layui-col-lg6 layui-col-lg-offset3" style="text-align: center">
            <h1><img src="<%=basePath%>/static/images/main_icon.png" style="height: 48px;width: 48px;margin-right: 20px" />播放历史</h1>
        </div>
    </div>
    <hr style="margin-top: 50px">
    <div class="layui-row" style="margin-top: 30px;padding-bottom: 30px;border-bottom: #dddddd solid 1px">
        <div class="layui-col-lg3">
            <div>
                <a href=""><img src="<%=basePath%>/static/images/avCover/test2.jpg" alt="" style="height: 120px;width: 192px;border-radius: 5px"></a>
            </div>
        </div>
        <div class="layui-col-lg7" style="height: 120px;margin-left: -50px">
            <div>
                <a href=""><h3 style="font-weight: bold">这里显示视频标题</h3></a>
            </div>
            <div class="layui-row" style="padding-top: 80px">
                <div style="display: inline;color: #99a2aa">播放于：2019-04-18</div>
                <div style="display: inline;padding-left: 100px;color: #99a2aa">up主：王五&nbsp;|&nbsp;动漫 </div>
            </div>
        </div>
        <div class="layui-col-lg2" style="padding-top: 36px;text-align: center;">
            <a href=""><i class="layui-icon layui-icon-delete" style="font-size: 30px;color: #99a2aa"></i></a>
        </div>
    </div>
</div>
</body>
</html>
