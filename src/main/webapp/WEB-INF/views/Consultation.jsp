<%--
  Created by IntelliJ IDEA.
  User: cyl27
  Date: 2021/2/8
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCMT在线咨询</title>
    <link rel="stylesheet" type="text/css"
          href="./css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/style.css?v=1.2">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<div data-role="page" id="showChat" style="display: inline;height: 100%">
    <div class="header linear-g fixed_">

        <div class="dropdown user-list">
            <i class="glyphicon glyphicon-list dropdown-toggle" id="userList" data-toggle="dropdown"></i>
            <ul class="dropdown-menu" role="menu" aria-labelledby="userList" id="onlineUserList">
            </ul>
        </div>

        <a href="#panel-left" data-iconpos="notext"
           class="col-xs-2 text-right"> </a> <a class="text-center col-xs-8"
                                                target="_blank">聊天室（<font color="orange" id="online_num"><img
            src="./images/loader.gif" width="15" height="15"></font>）</a>
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
    <div data-role="content" class="container content" role="main">
        <div style="height: 100%">
            <ul class="content-reply-box mg10" id="show_content">
            </ul>
        </div>
    </div>
    <div class="send_div">
        <div class="toUserList">
            <ul>
            </ul>
        </div>
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

<audio id="beep" src="./sounds/qq.mp3"></audio>
<script type="text/javascript" src="./js/xechat.js?v=1.2"></script>
</html>