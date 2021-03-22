document.write('<script src="/static/js/config.js"></script>');

// 头像数量
var head_num = 50;
// 用户id
var uid = null;
var stompClient = null;
var onlineUserList;
var address = '未知地区';

var title = document.title;
// 是否打开通知
var openNotice = true;
// 通知权限，0不支持通知 1允许通知 2不允许通知 3未获取权限
var permission = 3;
// 最新的消息数量
var newMsgTotal = 0;
// 窗口可见
var visible = true;
// 是否打开提示音
var opendSound = true;

// 页面加载完成后
window.onload = function () {
    init();
    settings();
    $('#content').bind('keyup', showToUserList);
    // 页面加载完成监听回车事件  发送消息
    document.getElementById("content").addEventListener("keydown", function (e) {
        if (e.keyCode != 13) return;
        e.preventDefault();
        // 发送信息
        sendToChatRoom();
    });
    // 监听窗口切换
    document.addEventListener("visibilitychange", function () {
        if (document.visibilityState === "hidden") {
            // 窗口不可见
            visible = false;
        } else if (document.visibilityState === "visible") {
            // 窗口可见
            visible = true;
            newMsgTotal = 0;
            document.title = title;
        }
    });
    // 请求获取消息通知权限
    requestNoticePermission();
}

// 监听窗口关闭事件，当窗口关闭时，主动去关闭stomp连接
window.onbeforeunload = disconnect;
window.onpagehide = disconnect;


/**
 * 连接服务器，订阅相关地址
 */
function connect() {
    var socket = new SockJS('/xechat');
    stompClient = Stomp.over(socket);
    // 配置stomp
    config();
    // 订阅地址
    sub();
}

/**
 * 订阅地址
 */
function sub() {
    var user = createUser();
    stompClient.connect(user, function (frame) {
        cacheUser(user);
        uid = frame.headers['user-name'];

        if (uid === undefined) {
            alert("进入聊天室失败，请重新连接！");
            refresh();
        }

        // 聊天室订阅
        stompClient.subscribe('/topic/chatRoom', function (data) {
            handleMessage(getData(data.body));
        });

        // 本地订阅
        stompClient.subscribe('/user/' + uid + '/chat', function (data) {
            handleMessage(getData(data.body));
        });

        // 错误信息订阅
        stompClient.subscribe('/user/' + uid + '/error', function (data) {
            getData(data.body);
        });

        // 聊天室动态订阅
        stompClient.subscribe('/topic/status', function (data) {
            var obj = getData(data.body);
            handleMessage(obj);
            showOnlineNum(obj.onlineCount);
            showUserList(obj.onlineUserList);
        });

        setConnected(true);
    }, function (error) {
        alert('请重新连接！');
        refresh();
    });

}

/**
 * 解析响应数据
 * @param data
 * @returns {*}
 */
function getData(data) {
    var obj = JSON.parse(data);
    codeMapping(obj);
    return obj.data;
}

/**
 * stomp配置
 */
function config() {
    // 每隔30秒做一次心跳检测
    stompClient.heartbeat.outgoing = 30000;
    // 客户端不接收服务器的心跳检测
    stompClient.heartbeat.incoming = 0;
}

/**
 * 关闭连接
 */
function disconnect() {
    btn_exit();
    if (stompClient !== null) {
        setConnected(false);
        stompClient.disconnect();
        refresh();
    }
}


function btn_exit() {
    var content = $("#content").val();
    var userId = $("#userId").text();
    var adminId = $("#adminId").text();

    $.ajax({
        url: "/consultationController/exit", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            userId: userId,
            adminId: adminId,
            message: content,
            image: "",
            sendTime: "",
            type: true

        }),
        //处理后端返回的数据
        success: function (data) {
            window.close();

        },
        //处理失败返回的数据
        error: function (data) {

        }
    })

}


/**
 * 设置连接状态
 * @param connected true连接成功，false连接失败
 */
function setConnected(connected) {
    showChatRoom(connected);
}

/**
 * 发送信息到指定地址
 * @param pub 发布地址
 * @param header 设置请求头
 * @param data 发送的内容
 */
function sendMessage(pub, header, data) {
    stompClient.send(pub, header, data);
}

/**
 * 生成头像列表
 */
function showHeadPortrait() {
    for (var i = 0; i < head_num; i++) {
        $('.avatar_list_div').append('<img src=/static/images/avatar/' + i + '.jpeg />');
    }
    $('.avatar_list_div img').bind('click', function () {
        $('#avatarList').attr('src', $(this).attr('src'));
    });
}

/**
 * 发送信息到聊天室
 */
function sendToChatRoom() {
    // 获取发送的内容
    var content = $("#content").val();

    var userId = $("#userId").text();
    var adminId = $("#adminId").text();
    // 内容不能为空
    if (content.trim().length < 1) {
        return;
    }

    $.ajax({
        url: "/consultationController/userSend", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            userId: userId,
            adminId: adminId,
            message: content,
            image: "",
            sendTime: "",
            type: true

        }),
        //处理后端返回的数据
        success: function (data) {
            if (data.result == "发送成功") {
                uid = data.message.userId;
                $("#adminId").html(data.message.adminId);
                $("#userId").html(data.message.userId);
                //showUserMsg(data);
            } else {
                showSystemMsg(data.result);
            }
        },
        //处理失败返回的数据
        error: function (data) {

        }
    })

    $('#content').val('');
    changeBtn();
}


function flushMessage() {
    $.ajax({
        url: "/consultationController/flushMessage", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            adminId: 1
        }),
        //处理后端返回的数据
        success: function (data) {

            var messages = data.messages;

            if (data != null) {
                for (var i = 0; i < messages.length; i++) {
                    showUserMsgList(messages[i]);
                    if (opendSound) {
                        // 提示音
                        beep();
                    }
                }
            }
        },
        //处理失败返回的数据
        error: function (data) {

        }
    })
}


function adminFlushMessage() {
    var adminId = $("#adminId").text();
    $.ajax({
        url: "/consultationController/flushMessage", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            adminId: adminId
        }),
        //处理后端返回的数据
        success: function (data) {

            var messages = data.messages;

            if (data != null) {
                for (var i = 0; i < messages.length; i++) {
                    showUserMsgList(messages[i]);
                    if (opendSound) {
                        // 提示音
                        beep();
                    }
                }
            }
        },
        //处理失败返回的数据
        error: function (data) {

        }
    })
}


/**
 * 响应码映射
 * @param date
 */
function codeMapping(date) {
    switch (date.code) {
        case 200:
            break;
        case 404:
            alert("404");
            break;
        default:
            alert(date.desc);
            break;
    }
}

/**
 * 转义 防止html注入
 * @param str
 * @returns {string}
 */
function htmlEncode(str) {
    var ele = document.createElement("span");
    ele.appendChild(document.createTextNode(str));
    return ele.innerHTML;
}

/**
 * 显示在线人数
 * @param num
 */
function showOnlineNum(num) {
    $("#online_num").html(num);
}

/**
 * 聊天室界面显隐
 * @param isShow
 */
function showChatRoom(isShow) {
    if (isShow) {
        $("#login").hide();
        $("#showChat").show();
        return;
    }
    $("#login").show();
    $("#showChat").hide();
}

/**
 * 创建用户
 * @returns {string}
 */
function createUser() {
    var username = '匿名';
    var avatar = './images/avatar/1.jpeg';
    var user = getUser();

    if (user !== '') {
        username = user.username;
        avatar = user.avatar;
    } else {
        var inputName = $('#username').val();
        var inputAvatar = $('#avatarList').attr('src');
        if (inputName.trim() !== '' && inputName.trim().length < 9) {
            username = htmlEncode(inputName);
        }
        if (inputAvatar !== undefined || inputAvatar !== '') {
            avatar = inputAvatar
        }
    }

    return {
        'username': username,
        'avatar': avatar,
        'address': address
    };
}

/**
 * 显示用户消息  有用 ok
 * @param data
 */
function showUserMsg(data) {

    var user_avatar = "/static/images/avatar/0.jpeg";
    var user = data.user;
    var message = data.message;
    var isMe = data.message.type;

    var style_css = isMe ? 'even' : 'odd';
    var event = isMe ? 'ondblclick=revokeMessage(this)' : '';

    var showMessage = data.message.message;
    var showImage = data.message.image == null ? '' : '<div class="show_image"><img src="' + data.message.image + '"/></div>';

    var li = '<li class=' + style_css + ' id=' + data.messageId + ' data-receiver=' + data.receiver + '>';
    var a = '<a class="user">';
    var avatar = '<img class="img-responsive avatar_" src=' + user_avatar + '\>';
    var span = '<span class="user-name">' + message.userId + '</span></a>';

    var div_me = '<div class="reply-content-box"><span class="reply-time"><i class="glyphicon glyphicon-time"></i> '
        + data.message.sendTime + '&nbsp;' + '</span>';

    var div = '<div class="reply-content-box"><span class="reply-time">'
        + '&nbsp;<i class="glyphicon glyphicon-time"></i> ' + data.message.sendTime + '</span>';

    var div2 = '<div class="reply-content pr" ' + event + '><span class="arrow">&nbsp;</span>' + showMessage + showImage + '</div></div></li>';

    var html = li + a + avatar + span + (data.message.type ? div_me : div) + div2;
    // var html;
    //
    //
    // if (data.message.type) {
    //     html = li + a + avatar + span + div + div2;
    // } else {
    //     html = li + a + avatar + span + div_me + div2;
    // }


    $("#show_content").append(html);
    jumpToLow();
}

//供使用者调用
function trim(s) {
    return trimRight(trimLeft(s));
}

//去掉左边的空白
function trimLeft(s) {
    if (s == null) {
        return "";
    }
    var whitespace = new String(" \t\n\r");
    var str = new String(s);
    if (whitespace.indexOf(str.charAt(0)) != -1) {
        var j = 0, i = str.length;
        while (j < i && whitespace.indexOf(str.charAt(j)) != -1) {
            j++;
        }
        str = str.substring(j, i);
    }
    return str;
}

//去掉右边的空白 www.2cto.com
function trimRight(s) {
    if (s == null) return "";
    var whitespace = new String(" \t\n\r");
    var str = new String(s);
    if (whitespace.indexOf(str.charAt(str.length - 1)) != -1) {
        var i = str.length - 1;
        while (i >= 0 && whitespace.indexOf(str.charAt(i)) != -1) {
            i--;
        }
        str = str.substring(0, i + 1);
    }
    return str;
}


function showUserMsgList(message) {

    var user_avatar = "/static/images/avatar/0.jpeg";

    var isMe = message.type;

    var style_css = isMe ? 'even' : 'odd';
    var event = isMe ? 'ondblclick=revokeMessage(this)' : '';

    if (message.image == "") {
        message.image = null;
    }


    var showMessage = trim(message.message);
    var showImage = message.image == null ? '' : '<div class="show_image"><img src="' + message.image + '"/></div>';

    var li = '<li class=' + style_css + '>';
    var a = '<a class="user">';
    var avatar = '<img class="img-responsive avatar_" src=' + user_avatar + '\>';
    var span = '<span class="user-name">' + message.userId + '</span></a>';

    var div_me = '<div class="reply-content-box"><span class="reply-time"><i class="glyphicon glyphicon-time"></i> '
        + message.sendTime + '&nbsp;' + '</span>';

    var div = '<div class="reply-content-box"><span class="reply-time">'
        + '&nbsp;<i class="glyphicon glyphicon-time"></i> ' + message.sendTime + '</span>';

    var div2 = '<div class="reply-content pr" ' + event + '><span class="arrow">&nbsp;</span>' + showMessage + showImage + '</div></div></li>';
    var html = li + a + avatar + span + (message.type ? div_me : div) + div2;

    $("#show_content").append(html);
    jumpToLow();
}

/**
 * 跳到聊天界面最底下  有用
 */
function jumpToLow() {
    $("ul").scrollTop($("ul")[1].scrollHeight);
}


/**
 * 处理消息
 * @param data
 */
function handleMessage(data) {
    var msg = data.message;
    switch (data.type) {
        case 'USER':
            showUserMsg(data);
            break;
        case 'SYSTEM':
            showSystemMsg(msg);
            break;
        case 'REVOKE':
            showRevokeMsg(data);
            break;
        default:
            break;
    }

    // 消息通知
    msgNotice(data);
}

/**
 * 显示撤回消息信息
 * @param data
 */
function showRevokeMsg(data) {
    var obj = document.getElementById(data.revokeMessageId);
    if (obj) {
        obj.remove();
        showSystemMsg(data.user.username + '撤回了一条消息！');
        jumpToLow();
    }
}

/**
 * 显示系统消息
 * @param message
 */
function showSystemMsg(message) {
    var li = '<li><div class="sys_message">' + message + '</div></li>';
    $("#show_content").append(li);
    jumpToLow();
}


/**
 * 撤消消息
 * @param messageId
 */
function revokeMessage(e) {
    var dom = $(e).parents('li');
    var messageId = dom.attr('id');
    var receiver = dom.data('receiver');

    if (messageId === '' || messageId === undefined || !confirm('确定撤回这条消息吗？')) {
        return;
    }

    if (receiver === null || receiver === '' || messageId === undefined) {
        receiver = null;
    } else {
        receiver = receiver.split(',');
    }

    var data = JSON.stringify({
        'messageId': messageId,
        'receiver': receiver
    });

    sendMessage('/chatRoom/revoke', {}, data);
}

/**
 * 控制按钮显示
 */
function changeBtn() {
    // 如果输入的内容不为空，则展示发送按钮，否则展示上传图片按钮
    if ($('#content').val().trim() != '') {
        $('#send_btn').show();
        $('#picture_btn').hide();
    } else {
        $('#picture_btn').show();
        $('#send_btn').hide();
    }
}

/**
 * 发送图片
 */
function sendImage() {
    var image = $("#file").val();
    if (image === '' || image === undefined) {
        return;
    }

    var filename = image.replace(/.*(\/|\\)/, "");
    var fileExt = (/[.]/.exec(filename)) ? /[^.]+$/.exec(filename.toUpperCase()) : '';

    var file = $('#file').get(0).files[0];
    var fileSize = file.size;
    var mb = 30;
    var maxSize = mb * 1024 * 1024;

    if (fileExt != 'PNG' && fileExt != 'GIF' && fileExt != 'JPG' && fileExt != 'JPEG' && fileExt != 'BMP') {
        alert('发送失败，图片格式有误！');
        return;
    } else if (parseInt(fileSize) > parseInt(maxSize)) {
        alert('上传的图片不能超过' + mb + 'MB');
        return;
    } else {
        var data = new FormData();
        data.append('file', file);
        $.ajax({
            url: "/api/upload/image",
            type: 'POST',
            data: data,
            dataType: 'JSON',
            cache: false,
            processData: false,
            contentType: false,
            success: function (data) {
                codeMapping(data);
                var rep = data.data;
                sendImageToChatRoom(rep.path);
            }
        });
    }

    // 清空选择的文件
    $("#file").val('');
}

/**
 * 选择文件
 */
function selectFile() {
    $('#file').click();
}

/**
 * 发送图片到聊天室
 */
function sendImageToChatRoom(image) {
    var data = JSON.stringify({
        "image": image
    });
    sendMessage('/chatRoom', {}, data);
}

/**
 * 用户列表
 * @param data
 */
function showUserList(data) {
    onlineUserList = data;
    $('#onlineUserList').html('');
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        $('#onlineUserList').append(
            '<li id=' + obj.userId + '><div><img class="img-responsive avatar_list"' + 'src=' + obj.avatar + '>' +
            '<div class="name_list">' + obj.username + '</div></div></li>');
    }
}

/**
 * 退出
 */
function exit() {
    if (confirm('确定退出吗？')) {
        disconnect();
    }
}

/**
 * 缓存用户信息
 * @param data
 */
function cacheUser(data) {
    Cookies.set('user', data);
}

/**
 * 获取用户信息
 * @returns {*}
 */
function getUser() {
    var data = Cookies.get('user');
    if (data !== undefined) {
        return JSON.parse(data);
    }
    return '';
}

/**
 * 初始化登陆信息
 */
function init() {
    // 定位
    getAddress();
    var user = getUser();
    if (user !== '') {
        $('#username').hide();
        $('.avatar_list_div').remove();
        $('#avatarList').attr('src', user.avatar);
        $('.login-name').html(user.username);
        $('#logout').bind('click', logout);
        $('#logout').show();
    } else {
        // 初始化头像单选框
        showHeadPortrait();
    }
    $('#joinChat').bind('click', function () {
        $(this).button('loading');
        connect();
    });
}

/**
 * 注销
 */
function logout() {
    Cookies.remove('user');
    refresh();
}

/**
 * 刷新
 */
function refresh() {
    btn_exit();
    window.location.reload();
}

/**
 * 显示@用户列表
 * @param str
 */
function showToUserList() {
    var str = $('#content').val();
    var index = str.lastIndexOf('@');
    var name = str.substring(index + 1, str.length);
    $('.toUserList ul').html('');

    if (index != -1) {
        for (var i = 0; i < onlineUserList.length; i++) {
            var obj = onlineUserList[i];
            if (obj.userId === uid) {
                continue;
            }
            if (name === '' || obj.username.indexOf(name) != -1) {
                $('.toUserList ul').append('<li><a onclick="setToUser(this)" data-name="' + obj.username + '"' +
                    ' data-userid="' + obj.userId + '"><div><img class=\'img-responsive avatar_list\' src="' + obj.avatar + '">\n' +
                    '<div class="name_list">' + obj.username + '</div></div></a></li>');
            }
        }
    }
}

/**
 * 设置@用户
 * @param ele
 */
function setToUser(ele) {
    var str = $('#content').val();
    var name = $(ele).data('name') + ' ';
    var index = str.lastIndexOf('@') + 1;
    var substr = str.substr(index, str.length);

    if (substr === '') {
        $('#content').val(str + name);
    } else {
        $('#content').val(str.substr(0, index) + name);
    }

    $('.toUserList ul').html('');
}

/**
 * 通过name获取userid
 * @param name
 * @returns {Document.userId|string}
 */
function getUserIdByName(name) {
    if (name == '') {
        return '';
    }

    for (var i = 0; i < onlineUserList.length; i++) {
        var obj = onlineUserList[i];
        if (obj.userId !== uid && obj.username === name) {
            return obj.userId;
        }
    }
}

/**
 * 双击用户头像@用户
 * @param name
 */
function showToUser(name) {
    $('#content').val($('#content').val() + '@' + name + ' ');
}

/**
 * 定位
 */
function getAddress() {
    $.ajax({
        type: "GET",
        url: "https://api.map.baidu.com/location/ip",
        data: {ak: "mHGeNrAuzZscixVMAjfaq1PPgKPOnoPm"},
        dataType: "jsonp",
        async: false,
        success: function (data) {
            address = data.content.address;
        },
        error: function (e) {
            console.log("定位失败！", e);
        }
    });
}

var token;

/**
 * 获取聊天记录列表
 */
function listRecord(name) {
    var def_id = 'recordList';
    var id = '';
    var param = '';
    if (name != '') {
        def_id = name;
        id = name + '_';
        param = id.replace(/\_/g, '/');
    }

    $.ajax({
        type: "GET",
        url: "/api/record",
        headers: {
            "token": token
        },
        data: {
            "directoryName": param
        },
        dataType: "json",
        success: function (data) {
            codeMapping(data);
            if (data.code === 200) {
                $('#' + def_id).html('');
                $('#passwordModel').modal('hide');
                $('#record').show();
                var list = data.data.list;
                for (var i = 0; i < list.length; i++) {
                    var obj = list[i];
                    if (obj.file) {
                        $('#' + def_id).append('<li class="file" onclick="readContent(this)" data-url="' + obj.url + '">' + obj.name + '</li>');
                    } else {
                        var dir_id = id + obj.name;
                        var unit = obj.name.length === 4 ? '年' : '月';
                        $('#' + def_id).append('<li class="dire" onclick="direDisplay(this)" data-id="' + dir_id + '">' + obj.name + unit + '</li>');
                        $('#' + def_id).append('<ul id="' + dir_id + '"></ul>')
                    }
                }
            }
        }
    });
}

/**
 * 读取文件内容
 * @param url
 */
function readContent(e) {
    $.ajax({
        type: "GET",
        url: $(e).data('url'),
        headers: {
            "token": token
        },
        cache: false,
        success: function (data) {
            $('#record #content').html(marked(data));
        }
    });
}

/**
 * 校验密码
 */
function checkPassword() {
    var val = $('#record_password').val();
    if (val === '') {
        alert("请输入访问密码！！！");
    } else {
        token = btoa(val);
        listRecord('', '');
    }
}


/**
 * 目录显示
 *
 * @param id
 */
function direDisplay(e) {
    var id = $(e).data('id');
    if ($('#' + id).is(':hidden')) {
        listRecord(id);
        $('#' + id).show();
        return;
    }
    $('#' + id).hide();
}

/**
 * 不在当前窗口时，通过标题显示最新的消息数量
 */
function msgNoticeByTitle() {
    if (!openNotice || visible) {
        // 未开启通知或窗口可见，不进行提醒
        return;
    }


    // 窗口不可见显示提醒
    document.title = '[' + (++newMsgTotal) + '条新消息]' + title;
}

/**
 * 通过浏览器的消息通知来推送消息
 * 兼容性差（Safari、Chrome等浏览器对于pc端基本支持）
 * @param data
 */
function msgNoticeByBrowser(data) {
    if (permission == 3) {
        requestNoticePermission();
    }

    if (permission == 1) {
        // 创建通知
        var notice = createNotice(data);
        notice.onclick = function () {
            // 切换浏览器窗口到当前界面
            window.focus();
        }
    }
}

/**
 * 播放提示音
 */
function beep() {
    var beep = document.getElementById('beep');
    beep.play();
}

/**
 * 创建一条消息通知
 * @param data
 * @returns {Notification}
 */
function createNotice(data) {
    var t = '系统消息';
    var msg = data.message;
    var user = data.user;
    var type = data.type;
    if (type == 'USER') {
        t = user.username;
        if (msg == null) {
            msg = "[图片]";
        }
    } else if (type == 'REVOKE') {
        msg = user.username + '撤回了一条消息！';
    }

    return new Notification('新的消息！' + title, {
        body: t + '：' + msg,
        icon: user.avatar
    });
}

/**
 * 请求通知权限
 */
function requestNoticePermission() {
    var flag = window.Notification;
    if (flag) {
        Notification.requestPermission(function (perm) {
            switch (perm) {
                case "granted":
                    permission = 1;
                    break;
                case "denied":
                    permission = 2;
                    break;
                default:
                    permission = 3;
                    break;
            }
        });
    } else {
        console.log('该浏览器暂不支持通知！');
        permission = 0;
    }
}

/**
 * 消息通知
 * @param data
 */
function msgNotice(data) {
    // 已开启通知且窗口不可见才进行消息通知
    if (openNotice && !visible) {
        // 通过标题通知
        msgNoticeByTitle();
        // 通过浏览器的消息通知支持进行通知
        msgNoticeByBrowser(data);
    }
}

/**
 * 设置相关
 */
function settings() {
    var checkNotice = $('#checkNotice');
    checkNotice.on('change', function () {
        // 是否打开通知
        openNotice = checkNotice.is(':checked');
    });

    var checkSound = $('#checkSound');
    checkSound.on('change', function () {
        // 是否打开提示音
        opendSound = checkSound.is(':checked');
    });
}