<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cyl
  Date: 2019/11/19
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no">

    <title>管理员操作</title>

    <link rel="stylesheet" type="text/css" href="/static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/pushy.css">
    <link rel="stylesheet" type="text/css" href="/static/css/back-to-top.css">
    <link rel="stylesheet" type="text/css" href="/static/css/header.css">
    <link rel="stylesheet" type="text/css" href="/static/css/footer.css">
    <link rel="stylesheet" type="text/css" href="/static/css/global.css">
    <link rel="stylesheet" type="text/css" href="/static/css/font.css">
    <link rel="stylesheet" type="text/css" href="/static/css/tab.css">
    <link rel="stylesheet" type="text/css" href="/static/css/select.css">
    <link rel="stylesheet" type="text/css" href="/static/css/enlarge-img.css">
    <link rel="stylesheet" type="text/css" href="/static/css/general.css">
    <link rel="stylesheet" type="text/css" href="/static/css/lightgallery.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/wphotolist.css">

    <style type="text/css">
        #body.cn {
            font-size: 16px;
            font-family: "robotoregular", "Lucida Grande", "Myriad Set Pro", Arial, Helvetica, "Microsoft YaHei", 微軟正黑體, sans-serif;
        }

        #body.cn .pg-container .pg-col-l, #body.cn nav.menu {
            font-size: 18px;
        }

        #body .txt-normal {
            color: #666;
        }

        #body .riche p {
            margin: 0;
            padding: 0;
        }

        #body .riche ul {
            margin: 0px;
            padding: 10px 0px;
            text-indent: 0;
        }

        #body .riche ul li {
            margin: 0px 0px 0px 30px;
            padding: 0;
            line-height: 1.8;
            list-style-type: disc;
            background-color: transparent;
            border-right: none;
        }

        #body header #logo {
            cursor: pointer;
        }

        footer .flexbox-container > div {
            width: 15%;
        }

        footer .flexbox-container ul li {
            font-size: 14px;
            padding: 2px 0;
        }

        .general .greyBox {
            margin: 0;
        }

        .content-left .lightbox-target img, .content-right .lightbox-target img {
            margin: auto;
        }

        footer .top-row {
            display: none;
        }

        .other-container {
            padding: 50px 0 0 0;
        }

        .other-container .pg-col-r {
            width: auto;
            float: none;
            margin-left: 0;
        }

        #sidebar {
            display: none;
        }

        .wmap > img.dim {
            width: 100%;
            background: yellow;
        }

        .wmap i.fa.bmapop {
            font-size: 26px;
            color: #42bec2;
            position: absolute;
            top: 0;
            right: 0;
            cursor: pointer;
            background: #fff;
            padding: 8px;
        }

        .w8dumap {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        ul.nav-left li, ul.sub li {
            cursor: pointer;
        }

        /* fix desktop tov nav mouseover */
        .menu li .sub-menu {
            z-index: 10;
            opacity: 1;
            visibility: visible;
            display: none;
        }

        .menu li:hover .sub-menu {
            z-index: 10;
            opacity: 1;
            visibility: visible;
        }

        /* qr */
        footer .qr {
            position: absolute;
            top: 40px;
            right: 10%; /*40px*/
            width: 150px;
        }

        footer .qr img {
            width: 100%;
        }

        /* left menu expand collpanse */

        @media only screen and (max-width: 950px) {
            header.smaller #logo img {
                padding-top: 10px;
            }
        }

        @media only screen and (max-width: 768px) {
            header #logo {
                width: 200px;
            }
        }

        @media only screen and (max-width: 667px) {
            #body.en .news-detail, #body.cn .news-detail {
                height: auto !important;
            }

            header #logo {
                width: 120px;
            }

            .news-blk .detail-blk > div {
                height: auto;
            }

            .other-container {
                padding: 15px 15px 0 15px;
            }

            footer {
                padding-bottom: 0;
            }

            footer .flexbox-container > div {
                width: 100%;
            }

            footer .qr {
                position: relative;
                top: 0;
                left: 0;
                width: 100%;
                text-align: center;
            }

            footer .qr img {
                width: 60%;
            }
        }

    </style>

    <%--<script src="/static/js/admin/Administration.js"></script>--%>
    <script src="/static/js/jquery-1.12.0.min.js" integrity="sha256-Xxq2X+KtazgaGuA2cWR1v3jJsuMJUozyIXDB3e793L8="
            crossorigin="anonymous"></script>
    <script src="/static/js/classie.js"></script>
    <script src="/static/js/modernizr.js"></script>
    <script src="/static/js/custom.js"></script>
    <script src="/static/js/lightgallery-all.min.js"></script>
    <script src="/static/js/wphotolist.js"></script>

    <script type="text/javascript">
        // IE 8 or older
        if ((document.all && !document.querySelector) || (document.all && document.querySelector && !document.addEventListener)) {
            window.location = "/iesupport.htm";
        }
        var isPgPrivate = false;
        var csrftname = "YII_CSRF_TOKEN";
        var csrftoken = 'b0ZNbzVEY21fOGpfX2l1MWczdWFXUWdIdzEyYkVTazQAZCMRZH5YLyWiVFzWOeZXet_d91sSIMMKHGL2dT-Dhw==';

        function loadmorejs() {
            var jsa = ["/js/back-to-top.js", "/js/pushy.js"];
            for (var i = 0; i < jsa.length; i++) {
                $.getScript(jsa[i]);
            }
        }

        function leftmenuec() {

        }

        $(function () { //pg loaded
            loadmorejs();
            leftmenuec();
        });
    </script>

</head>
<body id="body" class="cn ">

<div class="container page-top-pos" style=" margin-top: 50px">

    <div class="container-padding pg-container ">
        <div class="pg-col-l">
            <ul class="nav-left">
                <li class="level2-d " onclick="goUrl('/userController/selectUser');">
                    用户管理
                </li>

                <li class="current" onclick="goUrl('/expertController/selectExpert');">
                    医生管理
                </li>

                <li class="level2-d" onclick="goUrl('/jspController/ExpertRegisterChinese');">
                    医生加盟
                </li>

            </ul>
        </div>

        <div class="pg-col-r" style="padding: 0px 0px">
            <!-- css adjustments -->
            <style type="text/css"></style>
            <script type="text/javascript"
                    src="//api.map.baidu.com/api?v=3.0&amp;ak=wEsaARHDGkxZ8ZyTc9BcEYzrl72gp9qq"></script>
            <script type="text/javascript"
                    src="http://api.map.baidu.com/getscript?v=3.0&amp;ak=wEsaARHDGkxZ8ZyTc9BcEYzrl72gp9qq&amp;services=&amp;t=20200415105918"></script>
            <script src="/js/baidumap.js"></script>


            <div id="gencontent" class="general"><!--general!-->
                <%--Todo 页面内容--%>
                <div >
                    <input type="hidden" id="pageNumber3" name="pageNumber3" value="1">

                    <a href="/userController/selectUserByExamine">只显示未审核医师</a>

                </div>

                <br>
                <div id="cla4"></div>

                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 60px">执业编号</th>
                        <th style="width: 240px;">姓名</th>

                        <th style="width: 100px">擅长</th>
                        <th style="width: 140px;padding-left: 20px">手机号</th>
                        <th style="width: 80px;padding-left: 60px">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${experts}" var="expert">
                        <tr>
                            <td style="width: 60px">${expert.expertId}</td>
                            <td style="width: 240px;padding-left: 10px">${expert.expertName}</td>
                            <td style="width: 100px">${expert.expertExcel}</td>
                            <td style="width: 140px;padding-left: 20px">${expert.expertTelephone}</td>

                            <%--<td style="width: 80px;padding-left: 60px">--%>
                                <%--<a href="/userController/selectUser1?name=${user.name}&email=${user.email}">查看详情</a>--%>
                            <%--</td>--%>
                        </tr>

                    </c:forEach>

                    </tbody>

                </table>

                <div style="float: right;font-size: 18px;">


                    <tr>
                        <td colspan="10">
                            当前${pageNumber}/${totalPage }页&nbsp;&nbsp;

                            <c:if test="${pageNumber ne 1}">
                                <a href="/userController/selectUser?pageNumber=1">首页</a>
                                <a href="/userController/selectUser?pageNumber=${pageNumber-1}">上一页 </a>
                            </c:if>

                            <c:if test="${pageNumber ne totalPage}">
                                <a href="/userController/selectUser?pageNumber=${pageNumber+1}">下一页 </a>
                                <a href="/userController/selectUser?pageNumber=${totalPage}">末页</a>
                            </c:if>

                        </td>
                    </tr>

                </div>


            </div><!--End general!-->
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="clear"></div>

<a href="#0" class="cd-top"></a>


</body>
</html>
