<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-04-03
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--引入jstl标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取视频地址
    String uri = (String)request.getAttribute("avuri");
%>
<!DOCTYPE html>
<html>
<head>
    <link href="<%=basePath%>/player/css/danmuplayer.css" rel="stylesheet">
    <script src="<%=basePath%>/static/js/jquery-3.3.1.js"></script>
    <script src="<%=basePath%>/player/js/danmuplayer.min.js"></script>
    <script src="<%=basePath%>/layui/layui.all.js"></script>
    <meta charset="utf-8">
    <%--禁止页面缩放--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%--引入layui的css文件--%>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
    <%--引入自定义nav.css文件--%>
    <link rel="stylesheet" href="<%=basePath%>/static/css/nav.css">
    <title>呼啦呼啦——视频播放</title>
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
<div class="layui-container" style="margin-top: 50px">
    <div class="layui-row">
        <div class="layui-col-lg9">
            <div style="margin-bottom: 20px">
                <h2 style="font-weight: bold">${requestScope.paly_av.getTitle()}</h2>
            </div>
            <div style="margin-bottom: 30px">
                <span>类别：动漫</span>
                <span style="margin-left: 20px">时间：${requestScope.paly_av.getCreate_time()}</span>
                <div>
                    <span>UP主：${requestScope.paly_user.getUsername()}</span>
                </div>
            </div>
            <%--播放器--%>
            <div id="danmup"></div>
            <div  style="width: 780px">
                <div style="margin-top: 20px;padding-bottom: 15px;border-bottom: #dddddd solid 1px">
                    <a style="margin-right: 20px" href="javascript:void(0);" onclick="dolike(${requestScope.paly_av.getId()},${sessionScope.user.getId()},${requestScope.paly_av.getLike_num()})"><i class="layui-icon layui-icon-praise" style="font-size: 28px;color: #757575"><span style="margin-left: 10px;font-size: 20px;">点赞</span></i></a>
                    <a style="margin-right: 20px" href="javascript:void(0);" onclick="doCollect(${requestScope.paly_av.getId()},${sessionScope.user.getId()},${requestScope.paly_av.getCollect_num()})"><i class="layui-icon layui-icon-star-fill" style="font-size: 28px;color: #757575"><span style="margin-left: 10px;font-size: 20px;">收藏</span></i></a>
                    <a href=""><i class="layui-icon layui-icon-share" style="font-size: 28px;color: #757575"><span style="margin-left: 10px;font-size: 20px;">分享</span></i></a>
                </div>
                <div style="margin-top: 20px;padding-bottom: 20px;border-bottom: #dddddd solid 1px">
                    ${requestScope.paly_av.getAvDesc()}
                </div>
                <div style="margin-left: -110px;margin-top: 20px">
                    <form action="" class="layui-form">
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <textarea placeholder="请输入评论内容" class="layui-textarea" lay-verify="required" name="content" id="con"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="go">立即评论</button>
                            </div>
                        </div>
                        <input type="text" value="${sessionScope.user.getId()}" name="userid" style="display: none">
                        <input type="text" value="${sessionScope.user.getUsername()}" name="uname" style="display: none">
                        <input type="text" value="${sessionScope.user.getIcon()}" name="uicon" style="display: none">
                        <input type="text" value="${requestScope.paly_av.getId()}" id="avid" name="avid" style="display: none">
                    </form>
                </div>
            </div>
            <div>
                <h2 style="border-bottom: #dddddd solid 1px;padding-bottom: 10px;margin-bottom: 20px;width: 780px">${requestScope.commentsnum}&nbsp;&nbsp;评论</h2>

                <%--显示刚刚评论的信息--%>
                <div  id="newCom">

                </div>
                <%--<div class="layui-row" style="margin-bottom: 20px;">
                    <div class="layui-col-lg1">
                        <img src="<%=basePath%>/${sessionScope.user.getIcon()}" alt="图片加载失败" style="height: 50px;width: 50px;border-radius: 50%" id="usericon">
                    </div>
                    <div class="layui-col-lg10" style="border-bottom: #dddddd solid 1px; padding-bottom: 20px;">
                        <div >
                            <h3 style="font-weight: bold;display: inline">${sessionScope.user.getUsername()}</h3>
                            <span style="display: inline;margin-left: 10px;color: #757575">刚刚</span>
                        </div>
                        <div style="margin-top: 10px">
                        </div>
                    </div>
                </div>--%>

                <c:forEach items="${requestScope.comments}" var="comment">
                    <div class="layui-row" style="margin-bottom: 20px">
                        <div class="layui-col-lg1">
                            <img src="<%=basePath%>/${comment.getUser_icon()}" alt="图片加载失败" style="height: 50px;width: 50px;border-radius: 50%">
                        </div>
                        <div class="layui-col-lg10" style="border-bottom: #dddddd solid 1px; padding-bottom: 20px;">
                            <div >
                                <h3 style="font-weight: bold;display: inline">${comment.getUsername()}</h3>
                                <span style="display: inline;margin-left: 10px;color: #757575">${comment.getCreate_time()}</span>
                            </div>
                            <div style="margin-top: 10px">
                                ${comment.getContent()}
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="layui-col-lg3">
            <div style="background-color: #00F7DE">这里显示推荐位</div>
        </div>
    </div>
</div>

</body>
<script>

    //获取layer对象
    var layer = layui.layer;
    //获取form对象
    var form = layui.form;
     //获取当前视频id
    var id = $("#avid").val();

    //播放视频
    $("#danmup").DanmuPlayer({
        src:"<%=basePath%><%=uri%>",
        width:780,
        height:445,
        urlToGetDanmu:"getDanmu?avid="+id,     //用来接收弹幕信息的url
        urlToPostDanmu:"danmu?avid="+id   //用来存储弹幕信息的url

    });

    //点击点赞
    function dolike(avid,userid,like) {
        $.ajax({
            type:'post',
            url:'like',
            data:{'avid':avid,"userid":userid,"likenum":like},
            success:function (res) {
                //res == 0 点赞失败
                //res == 1 点赞成功
                if (res == 0){
                    layer.msg('点赞失败',{icon:5});
                }
                if (res == 1){
                    layer.msg('感谢点赞',{icon:6});
                }
            }
        });
    }

    //点击收藏
    function doCollect(avid,userid,collectnum) {
        $.ajax({
            type:'post',
            url:'collect',
            data:{"avid":avid,"userid":userid,"collectnum":collectnum},
            success:function (res) {
                //res == 0 收藏失败
                //res == 1 收藏成功

                if (res == 0){
                    layer.msg('收藏失败了',{icon:5});
                }
                if (res == 1){
                    layer.msg('收藏成功',{icon:6});
                }
            }

        });

    }

    //点击评论
    form.on('submit(go)',function (data) {
        //ajax提交评论
        $.ajax({
            type:'post',
            url:'comment',
            data:{"userid":data.field.userid,"avid":data.field.avid,"content":data.field.content,"uname":data.field.uname,"uicon":data.field.uicon},
            success:function (res) {
                //res == 0 评论失败
                //res == 1 评论成功
                if (res.code == 0){
                    layer.msg('评论失败',{icon :5});
                }
                if (res.code == 1){
                    layer.msg('评论成功',{icon :6});

                    //清空评论框
                    $("#con").val("");
                    //生成最新评论
                    $("#newCom").prepend("<div class=\"layui-row\" style=\"margin-bottom: 20px;\">\n" +
                        "                    <div class=\"layui-col-lg1\">\n" +
                        "                        <img src=\"<%=basePath%>/${sessionScope.user.getIcon()}\" alt=\"图片加载失败\" style=\"height: 50px;width: 50px;border-radius: 50%\" id=\"usericon\">\n" +
                        "                    </div>\n" +
                        "                    <div class=\"layui-col-lg10\" style=\"border-bottom: #dddddd solid 1px; padding-bottom: 20px;\">\n" +
                        "                        <div >\n" +
                        "                            <h3 style=\"font-weight: bold;display: inline\">${sessionScope.user.getUsername()}</h3>\n" +
                        "                            <span style=\"display: inline;margin-left: 10px;color: #757575\">刚刚</span>\n" +
                        "                        </div>\n" +
                        "                        <div style=\"margin-top: 10px\">\n" +res.comment.content+
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                </div>");




                }
            }
        });

        //使表单恒不提交
        return false;
    });
</script>
</html>
