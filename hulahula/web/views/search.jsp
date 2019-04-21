<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-04-17
  Time: 19:45
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

    <title>呼啦呼啦——搜索</title>

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
                <input class="layui-input" type="text" placeholder="搜索你想搜的" id="searchtext">
            </div>
        </div>
        <div class="nav_searchbtn">
            <div class="layui-form-item">
                <button class="layui-btn" id="search">搜索</button>
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
<div class="layui-container" style="margin-top: 50px">
    <div class="layui-row">
        <div class="layui-col-lg6 layui-col-lg-offset3">
            <div class="layui-row">
                <div class="layui-col-lg8">
                    <input type="text" name="title" required lay-verify="required" placeholder="快来搜我吧O(∩_∩)O~" autocomplete="off" class="layui-input" value="${requestScope.searchword}">
                </div>
                <div class="layui-col-lg4">
                    <button class="layui-btn"><i class="layui-icon layui-icon-search"></i>搜索</button>
                </div>
            </div>
        </div>
    </div>
    <div style="height: 50px;border-bottom: #dddddd solid 1px"></div>
    <div style="padding-top: 20px" class="layui-row">
        <div style="margin-bottom: 20px;color: #99a2aa">共查询到${requestScope.numFound}条结果</div>
        <c:forEach items="${requestScope.searchList}" var="video">
            <div style="border: #dddddd solid 1px;border-radius: 5px;width: 216px;display: inline-block;margin-right: 10px">
                <div>
                    <a href="play?id=${video.getId()}&&type=${video.getType()}&&uid=${sessionScope.user.getId()}"><img src="<%=basePath%>${video.getAvCover()}" alt="" style="height: 135px;width: 216px;border-radius: 5px"></a>
                </div>
                <div style="padding-left: 10px;padding-right: 10px">
                    <div style="margin-top: 10px">
                        <a href="play?id=${video.getId()}&&type=${video.getType()}&&uid=${sessionScope.user.getId()}">${video.getTitle()}</a>
                    </div>
                    <div style="padding-top: 15px;margin-bottom: 15px">
                        <i class="layui-icon layui-icon-play" style="color: #99a2aa">&nbsp;${video.getPlay_num()}</i>
                        <i class="layui-icon layui-icon-log" style="color: #99a2aa;float: right">&nbsp;<fmt:formatDate value="${video.getCreate_time()}" pattern="yyyy-MM-dd"/></i>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</html>
