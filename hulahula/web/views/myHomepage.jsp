<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-04-02
  Time: 10:55
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
    <title>呼啦呼啦——个人中心</title>
</head>
<body style="background-color: rgb(251, 251, 251);">
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
            <li class="layui-nav-item">
                <a href=""><img src="../static/images/account_icon/default_icon.jpg" class="layui-nav-img">我</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <dd><a href="javascript:;">个人中心</a></dd>
                    <dd><a href="javascript:;">我的收藏</a></dd>
                    <dd><a href="javascript:;">我的喜欢</a></dd>
                    <dd><a href="javascript:;">历史记录</a></dd>
                    <dd><a href="javascript:;">退出登录</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">联系我们</a></li>
        </ul>
    </div>
</div>
<%--网页主体--%>
<div>
    <img src="<%=basePath%>/static/images/myself_bar.jpg" alt="" style="height: 462px;width: 100%;margin-top: -210px">
</div>
<div class="layui-container" style="text-align: center;">
    <div style="margin-top: -50px;margin-bottom: 50px;">
        <img src="<%=basePath%>${sessionScope.user.getIcon()}" alt="" style="border-radius: 50%;width: 100px;height: 100px;">
        <div style="margin-top: 10px">${sessionScope.user.getUsername()}</div>
    </div>
</div>
<div class="layui-container">
    <div class="layui-row layui-col-space20">
        <div class="layui-col-lg9">
                <div class="layui-card">
                    <div class="layui-card-header">
                        <h3 style="font-weight: bold"><img src="../static/images/main_icon.png" alt="" style="width: 32px;height: 32px;margin-right: 16px;">我最近收藏的视频<a style="font-size: 12px;margin-left: 20px;color: #01AAED" href="">更多>></a></h3>
                    </div>
                    <div class="layui-card-body">
                        <c:forEach items="${sessionScope.likelist}" var="video">
                            <a href="play?id=${video.getId()}&&type=${video.getType()}&&uid=${sessionScope.user.getId()}" style="padding-right: 10px"><img src="<%=basePath%>${video.getAvCover()}" alt="" style="width: 192px;height: 120px;border-radius: 5px"></a>
                        </c:forEach>
                      <%--  <a href="" style="padding-right: 10px"><img src="<%=basePath%>/static/images/avCover/test2.jpg" alt="" style="width: 192px;height: 120px;border-radius: 5px"></a>
                        <a href="" style="padding-right: 10px"><img src="<%=basePath%>/static/images/avCover/test3.jpg" alt="" style="width: 192px;height: 120px;border-radius: 5px"></a>
                        <a href="" style="padding-right: 10px"><img src="<%=basePath%>/static/images/avCover/test4.jpg" alt="" style="width: 192px;height: 120px;border-radius: 5px"></a>--%>
                    </div>
                </div>
            <div class="layui-card">
                <div class="layui-card-header">
                    <h3 style="font-weight: bold"><img src="../static/images/main_icon.png" alt="" style="width: 32px;height: 32px;margin-right: 16px;">我最近观看的视频<a style="font-size: 12px;margin-left: 20px;color: #01AAED" href="">更多>></a></h3>
                </div>
                <div class="layui-card-body">
                    <c:forEach items="${sessionScope.historylist}" var="video">
                        <a href="play?id=${video.getId()}&&type=${video.getType()}&&uid=${sessionScope.user.getId()}" style="padding-right: 10px"><img src="<%=basePath%>${video.getAvCover()}" alt="" style="width: 192px;height: 120px;border-radius: 5px"></a>
                    </c:forEach>
                    <%--<a href="" style="padding-right: 10px"><img src="<%=basePath%>/static/images/avCover/test6.jpg" alt="" style="width: 192px;height: 120px;border-radius: 5px"></a>
                    <a href="" style="padding-right: 10px"><img src="<%=basePath%>/static/images/avCover/test3.jpg" alt="" style="width: 192px;height: 120px;border-radius: 5px"></a>
                    <a href="" style="padding-right: 10px"><img src="<%=basePath%>/static/images/avCover/test4.jpg" alt="" style="width: 192px;height: 120px;border-radius: 5px"></a>--%>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">
                    <h3 style="font-weight: bold"><img src="../static/images/main_icon.png" alt="" style="width: 32px;height: 32px;margin-right: 16px;">我最近发表的评论<a style="font-size: 12px;margin-left: 20px;color: #01AAED" href="">更多>></a></h3>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col width="150">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>我的发言</th>
                            <th>时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sessionScope.commentlist}" var="comment">
                            <tr>
                                <td>${comment.getContent()}</td>
                                <td>${comment.getCreate_time()}</td>
                            </tr>
                        </c:forEach>
                        <%--<tr>
                            <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                            <td>2016-11-28</td>
                        </tr>--%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="layui-col-lg3" >
            <div class="layui-card">
                <div class="layui-card-header">
                    <h3 style="font-weight: bold"><img src="../static/images/main_icon.png" alt="" style="width: 32px;height: 32px;margin-right: 16px;">我的信息<a style="font-size: 12px;margin-left: 20px;color: #01AAED" href="myinfo.jsp">修改信息>></a></h3>
                </div>
                <div class="layui-card-body">
                    <span style="font-weight: bold">昵称：</span><span>${sessionScope.user.getUsername()}</span><br>
                    <span style="font-weight: bold">个性签名：</span><span>${sessionScope.user.getIntroduce()}</span><br>
                    <c:if test="${sessionScope.user.getSex() == 'm'}">
                        <span style="font-weight: bold">性别：</span><span>男</span><br>
                    </c:if>
                    <c:if test="${sessionScope.user.getSex() == 'f'}">
                        <span style="font-weight: bold">性别：</span><span>女</span><br>
                    </c:if>
                    <span style="font-weight: bold">注册日期：</span><span>${sessionScope.user.getCreate_time()}</span><br>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.3.1.js"></script>
</html>
