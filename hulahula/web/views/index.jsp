<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-04-04
  Time: 12:13
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

    <title>呼啦呼啦——主站</title>
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
<%--副导航--%>
<div class="layui-fluid">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title" style="text-align: center">
            <li class="layui-this">首页</li>
            <li>教育</li>
            <li>财经</li>
            <li>体育</li>
            <li>娱乐</li>
        </ul>
        <div class="layui-tab-content"></div>
    </div>
</div>
<%--网站主体--%>
<div class="layui-container">
    <%--轮播位--%>
    <div class="layui-row">
        <div class="layui-col-lg4">
            <div class="layui-carousel" id="index_carousel">
                <div carousel-item="">
                    <div><img src="<%=basePath%>/static/images/avCover/test1.jpg" width="480px" height="300px"></div>
                    <div><img src="<%=basePath%>/static/images/avCover/test2.jpg" width="480px" height="300px"></div>
                    <div><img src="<%=basePath%>/static/images/avCover/test3.jpg" width="480px" height="300px"></div>
                    <div><img src="<%=basePath%>/static/images/avCover/test4.jpg" width="480px" height="300px"></div>
                    <div><img src="<%=basePath%>/static/images/avCover/test5.jpg" width="480px" height="300px"></div>
                    <div><img src="<%=basePath%>/static/images/avCover/test6.jpg" width="480px" height="300px"></div>
                </div>
            </div>
        </div>
        <%--推荐位--%>
        <div class="layui-col-lg8">
            <div class="layui-row layui-col-space5" style="margin-left: 125px;margin-bottom: 38px">
                <div class="layui-col-lg4">
                    <img src="../static/images/avCover/test1.jpg" alt="" style="width: 208px;height: 130px;border-radius: 5px">
                </div>
                <div class="layui-col-lg4">
                    <img src="../static/images/avCover/test2.jpg" alt="" style="width: 208px;height: 130px;border-radius: 5px">
                </div>
                <div class="layui-col-lg4">
                    <img src="../static/images/avCover/test3.jpg" alt="" style="width: 208px;height: 130px;border-radius: 5px">
                </div>
            </div>
            <div class="layui-row layui-col-space5" style="margin-left: 125px">
                <div class="layui-col-lg4">
                    <img src="../static/images/avCover/test4.jpg" alt="" style="width: 208px;height: 130px;border-radius: 5px">
                </div>
                <div class="layui-col-lg4">
                    <img src="../static/images/avCover/test5.jpg" alt="" style="width: 208px;height: 130px;border-radius: 5px">
                </div>
                <div class="layui-col-lg4">
                    <img src="../static/images/avCover/test6.jpg" alt="" style="width: 208px;height: 130px;border-radius: 5px">
                </div>
            </div>
        </div>
    </div>
    <%--视频展示区--%>
    <div class="layui-row" style="margin-top: 50px">
        <%--视频列表--%>
        <div class="layui-col-lg9">
            <div class="layui-row" style="margin-bottom: 20px">
                <div>
                    <h1><img src="../static/images/main_icon.png" alt="" style="width: 48px;height: 48px;margin-right: 16px;">动漫</h1><a href="" style="color: #01AAED;float: right;margin-top: -30px">更多>></a>
                </div>
            </div>

            <div class="layui-row" style="margin-bottom: 10px">
                <c:forEach items="${sessionScope.avlist0}" var="video">
                    <div class="layui-col-lg3" style="margin-bottom: 15px">
                        <a href="play?id=${video.getId()}&&type=${video.getType()}&&uid=${sessionScope.user.getId()}"><img src="<%=basePath%>${video.getAvCover()}" alt="图片加载失败" style="width: 208px;height: 130px;border-radius: 5px"></a>
                        <p style="margin-top: 10px;">${video.getTitle()}</p>
                        <span style="font-size: 12px">播放次数：${video.getPlay_num()}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%--排行榜--%>
        <div class="layui-col-lg3">
            <div>
                <h1>排行榜</h1>
            </div>
        </div>
    </div>
    <%--视频展示区--%>
    <div class="layui-row" style="margin-top: 50px">
        <%--视频列表--%>
        <div class="layui-col-lg9">
            <div class="layui-row" style="margin-bottom: 20px">
                <div>
                    <h1><img src="../static/images/main_icon.png" alt="" style="width: 48px;height: 48px;margin-right: 16px;">音乐</h1><a href="" style="color: #01AAED;float: right;margin-top: -30px">更多>></a>
                </div>
            </div>
            <div class="layui-row" style="margin-bottom: 10px">
                <c:forEach items="${sessionScope.avlist1}" var="video">
                    <div class="layui-col-lg3" style="margin-bottom: 15px">
                        <a href="play?id=${video.getId()}&&type=${video.getType()}&&uid=${sessionScope.user.getId()}"><img src="<%=basePath%>${video.getAvCover()}" alt="图片加载失败" style="width: 208px;height: 130px;border-radius: 5px;"></a>
                        <p style="margin-top: 10px;">${video.getTitle()}</p>
                        <span style="font-size: 12px">播放次数：${video.getPlay_num()}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%--排行榜--%>
        <div class="layui-col-lg3">
            <div>
                <h1>排行榜</h1>
            </div>
        </div>
    </div>
    <%--视频展示区--%>
    <div class="layui-row" style="margin-top: 50px">
        <%--视频列表--%>
        <div class="layui-col-lg9">
            <div class="layui-row" style="margin-bottom: 20px">
                <div>
                    <h1><img src="../static/images/main_icon.png" alt="" style="width: 48px;height: 48px;margin-right: 16px;">科技</h1><a href="" style="color: #01AAED;float: right;margin-top: -30px">更多>></a>
                </div>
            </div>
            <div class="layui-row" style="margin-bottom: 10px">
                <c:forEach items="${sessionScope.avlist2}" var="video">
                    <div class="layui-col-lg3"  style="margin-bottom: 15px">
                        <a href="play?id=${video.getId()}&&type=${video.getType()}&&uid=${sessionScope.user.getId()}"><img src="<%=basePath%>${video.getAvCover()}" alt="图片加载失败" style="width: 208px;height: 130px;border-radius: 5px"></a>
                        <p style="margin-top: 10px;">${video.getTitle()}</p>
                        <span style="font-size: 12px">播放次数：${video.getPlay_num()}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%--排行榜--%>
        <div class="layui-col-lg3">
            <div>
                <h1>排行榜</h1>
            </div>
        </div>
    </div>
    <%--视频展示区--%>
    <div class="layui-row" style="margin-top: 50px">
        <%--视频列表--%>
        <div class="layui-col-lg9">
            <div class="layui-row" style="margin-bottom: 20px">
                <div>
                    <h1><img src="../static/images/main_icon.png" alt="" style="width: 48px;height: 48px;margin-right: 16px;">科技</h1><a href="" style="color: #01AAED;float: right;margin-top: -30px">更多>></a>
                </div>
            </div>
            <div class="layui-row" style="margin-bottom: 10px">
                <c:forEach items="${sessionScope.avlist3}" var="video">
                    <div class="layui-col-lg3" style="margin-bottom: 15px">
                        <a href="play?id=${video.getId()}&&type=${video.getType()}&&uid=${sessionScope.user.getId()}"><img src="<%=basePath%>${video.getAvCover()}" alt="图片加载失败" style="width: 208px;height: 130px;border-radius: 5px"></a>
                        <p style="margin-top: 10px;">${video.getTitle()}</p>
                        <span style="font-size: 12px">播放次数：${video.getPlay_num()}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%--排行榜--%>
        <div class="layui-col-lg3">
            <div>
                <h1>排行榜</h1>
            </div>
        </div>
    </div>

</div>
</body>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.3.1.js"></script>
<script>

    //获取轮播对象
    var carousel = layui.carousel;

    //初始化轮播
    carousel.render({
        elem:"#index_carousel",
        width:'480px',
        height:'300px',
        arrow:'always'
    });

</script>
</html>
