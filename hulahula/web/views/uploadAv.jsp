<%--
  Created by IntelliJ IDEA.
  User: ganying
  Date: 2019-03-29
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--引入jstl标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--获取项目路径--%>
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
    <link rel="stylesheet" href="../static/css/nav.css">
    <title>呼啦呼啦——投稿</title>
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
                        <dd><a href="javascript:;">个人中心</a></dd>
                        <dd><a href="javascript:;">我的收藏</a></dd>
                        <dd><a href="javascript:;">我的喜欢</a></dd>
                        <dd><a href="javascript:;">历史记录</a></dd>
                        <dd><a href="logout">退出登录</a></dd>
                    </dl>
                </li>
            </c:if>
            <li class="layui-nav-item"><a href="uploadAv.jsp">投稿</a></li>
        </ul>
    </div>
</div>
<%--页面主体--%>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-lg4 layui-col-lg-offset4" style="text-align: center;margin-top: 100px">
            <h1><img src="../static/images/main_icon.png" alt="" style="width: 48px;height: 48px;margin-right: 16px;">投稿</h1>
        </div>
    </div>
    <div class="layui-row" style="text-align: center;margin-top: 50px">
        <div class="layui-col-lg8 layui-col-lg-offset2">
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="upAv">
                    <i class="layui-icon">&#xe67c;</i>上传视频
                </button>
                <button type="button" class="layui-btn" id="upAvImg">
                    <i class="layui-icon">&#xe67c;</i>上传视频封面
                </button>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="avImg" style="height: 200px;width: 300px">
                    <p id="avText" style="margin-top: 5px"></p>
                </div>
            </div>


            <form id="upform" action="" method="post" class="layui-form" style="margin-top: 30px">
                <div class="layui-form-item">
                    <label class="layui-form-label">视频标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="av_title" required  lay-verify="required" placeholder="在这里输入视频标题" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">视频描述</label>
                    <div class="layui-input-block">
                        <textarea name="desc" placeholder="在这里写下你对的视频描述" class="layui-textarea" lay-verify="required"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">投递类型</label>
                    <div class="layui-input-block">
                        <input type="radio" name="avType" value="0" title="动漫">
                        <input type="radio" name="avType" value="1" title="音乐">
                        <input type="radio" name="avType" value="2" title="科技">
                        <input type="radio" name="avType" value="3" title="舞蹈">
                    </div>
                </div>
                <input id="avCover" name="avCover" type="text" style="display: none" value="">
                <input id="avUri" name="avUri" type="text" style="display: none" value="">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="go" type="button">立即投递</button>
                        <button type="reset" class="layui-btn layui-btn-primary" id="reset">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%--引入layui.js文件--%>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<%--引入jquery文件--%>
<script src="../static/js/jquery-3.3.1.js"></script>
<script>
    //获取upload 对象
    var upload = layui.upload;
    //获取layer对象
    var layer = layui.layer;
    //获取表单对象
    var form = layui.form;

    //异步上传视频封面
    var uploadImg = upload.render({
        elem: '#upAvImg'
        ,url: 'uploadImg'
        ,accept:"images"    //限制上传文件类型只能为图片
        ,before: function(obj){     //上传前执行的方法
            //预读本地文件，不支持ie8
            obj.preview(function(index, file, result){
                $('#avImg').attr('src', result); //图片链接（base64）
            });
        }
        ,done: function(res){   //上传成功执行的方法
            //code=1 上传成功
            //code=2 上传异常（服务器异常）
            //code=0 文件为空
            if(res.code = 0){
                return layer.msg('上传文件为空，请重新上传');
            }
            if (res.code = 1){
                //获取视频封面uri输入框,并赋值
                $("#avCover").val(res.data);
                return layer.msg("封面上传成功");
            }
            if (res.code = 2){
                return layer.msg('文件上传异常，请重试');
            }
        }
    });

    //异步上传视频
    var uplaodAv = upload.render({
        elem:"#upAv"
        ,url:"uplaodAv"
        ,accept:"video" //只能上传视频
        ,before:function (obj) {
            //预读本地文件，不支持ie8
            obj.preview(function(index, file){
                $("#avText").html(file.name);
            });
        }
        ,done: function (res) {
            //code=1 上传成功
            //code=2 上传异常（服务器异常）
            //code=0 文件为空
            if (res.code=0){
                return layer.msg("上传文件为空，请重新上传");
            }
            if (res.code = 1){
                //获取视频uri输入框
                $("#avUri").val(res.data);
                return layer.msg("视频上传成功");
            }
            if (res.code=2){
                return layer.msg("文件上传异常，请重试");
            }
        }
    });

    //表单提交
    form.on('submit(go)',function (data) {
        if (!data.field.avType){
            layer.msg('未选择投递类型', {icon: 5});
            return false;
        }
        if (!data.field.avCover){
            layer.msg('未上传视频封面', {icon: 5});
            return false;
        }
        if (!data.field.avUri){
            layer.msg('未上传视频', {icon: 5});
            return false;
        }

        //使用ajax异步提交表单
        $.ajax({
            type:"post",
            url:"uplaod",
            data:$("#upform").serialize(),
            success:function (res) {
                console.log(res);
                //res.code = 0,表示用户未登录
                //res.code = 1,表示上传成功
                //res.code = 2,表示服务器异常
                if (res == 0){
                    layer.msg("您尚未登录",{icon:5});
                    return;
                }
                if (res == 1){
                    //询问框
                    layer.confirm("投稿成功！",{
                        btn:["查看投稿","再投一次"] //按钮
                    }, function () {
                            layer.msg('功能还在开发中',{icon:0});
                            return;
                        },function () {
                            //清空表单
                            $("#reset").click();
                            $('#avImg').attr('src', "");
                            $("#avText").html("");
                            return;
                        }
                    );
                }
                if (res == 2){
                    layer.msg("服务器异常",{icon:5});
                    return;
                }
            }
        });
        //表单恒不提交
        return false;
    });

</script>
</body>
</html>
