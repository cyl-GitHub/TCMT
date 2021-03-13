<%--
  Created by IntelliJ IDEA.
  User: cyl27
  Date: 2021/2/23
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCMT在线咨询</title>
    <script src="/static/js/xechat.js"></script>
    <link rel="stylesheet" type="text/css"
          href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<div id="login" style="display: none">
    <div><h3 class="text-center">TCMT咨询登录</h3></div>
    <div class="login_fm">
        <form>
            <div class="login_avatar dropdown">
                <img src="/static/images/avatar/0.jpeg" id="avatarList" data-toggle="dropdown"/>
                <div class="dropdown-menu avatar_list_div" aria-labelledby="avatarList">
                </div>
            </div>
            <div class="login-name"></div>
            <input type="text" id="username" placeholder="请在此处输入您的昵称！" class="form-control">

            <button type="button" class="btn btn-primary" id="joinChat" data-loading-text="连接中...">登入&nbsp;<i
                    class="glyphicon glyphicon-log-in"></i></button>

            &nbsp;<button type="button" class="btn btn-primary" id="logout" style="display: none">注销&nbsp;
            <i class="glyphicon glyphicon-log-out"></i></button>
        </form>
    </div>
</div>

<div data-role="page" id="showChat" style="display: inline;height: 100%">

    <%--todo 上部功能栏--%>
    <div class="header linear-g fixed_">

        <a href="#panel-left" data-iconpos="notext"
           class="col-xs-2 text-right"> </a> <a class="text-center col-xs-8"
                                                target="_blank">咨询服务
        （<font color="orange" id="adminId">23215</font>）
    </a>
        <div class="dropdown settings">
            <i class="glyphicon glyphicon-cog dropdown-toggle" id="settings" data-toggle="dropdown"></i>
            <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="settings" id="settings-menu">
                <li><input type="checkbox" checked id="checkNotice"/>&nbsp;<i
                        class="glyphicon glyphicon-bell"></i><span>新消息通知</span></li>
                <li><input type="checkbox" checked id="checkSound"/>&nbsp;<i
                        class="glyphicon glyphicon-volume-up"></i><span>消息提示音</span></li>
                <li class="divider"></li>
                <li style="float: right;margin-right: 10px">
                    <button type="button" class="btn btn-primary btn-xs" onclick="exit()">退出 <i
                            class="glyphicon glyphicon-log-out dropdown-toggle"></i></button>
                </li>
            </ul>
        </div>
    </div>
    <div class="header"></div>

    <%--todo 聊天内容框--%>
    <div data-role="content" class="container content" role="main">
        <div style="height: 100%">
            <ul class="content-reply-box mg10" id="show_content">
                <li class="odd">
                    <a class="user">
                        <img class="img-responsive avatar_" src="/static/images/avatar/robot.jpeg">
                        <span class="user-name">客服</span></a>
                    <div class="reply-content-box">
                        <span class="reply-time">
                            <i class="glyphicon glyphicon-time"></i> 2021/02/26 09:40</span>
                        <div class="reply-content pr">
                            <span class="arrow">&nbsp;</span>
                            欢迎来到TCMT！请问您有什么问题呢?
                        </div>
                    </div>
                </li>
                <li class="even" data-receiver="null">
                    <a class="user">
                        <img class="img-responsive avatar_" src="/static/images/avatar/0.jpeg">
                        <span class="user-name">12</span>
                    </a>
                    <div class="reply-content-box">
                        <span class="reply-time">
                            <i class="glyphicon glyphicon-time">
                            </i> 2021/02/26 09:45&nbsp;
                        </span>
                        <div class="reply-content pr" ondblclick="revokeMessage(this)"><span class="arrow">&nbsp;</span>12
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>


    <%--todo 输入文字--%>
    <div class="send_div">

        <div class="input-group div_left">

            <textarea rows="20" maxlength="200" placeholder="请在此处输入要发送的信息！" class="form-control"
                      id="content" onkeyup="changeBtn()"></textarea>

            <span id="picture_btn" onclick="selectFile()" class="input-group-addon linear-g right_btn glyphicon
             glyphicon-picture"></span>

            <span id="send_btn" onclick="sendToChatRoom()" class="input-group-addon linear-g right_btn glyphicon
             glyphicon-send" style="display: none;"></span>
        </div>
    </div>
    <input type="file" style="display: none" id="file" onchange="sendImage()"/>
</div>

<audio id="beep" src="/static/sounds/qq.mp3"></audio>

</body>
</html>
