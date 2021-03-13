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

    <%--<meta name="language" content="sc">--%>
    <%--<meta name="keywords" content="服务概述">--%>
    <%--<meta name="description" content="服务概述">--%>
    <title> Doctors joining
    </title>


    <!-- ICO -->
    <%--<link rel="shortcut icon" href="/images/favicon.png">--%>
    <%--<link rel="apple-touch-icon" href="/images/apple-touch-icon.png">--%>
    <%--<link rel="apple-touch-icon" sizes="72x72" href="/images/apple-touch-icon-72x72.png">--%>
    <%--<link rel="apple-touch-icon" sizes="114x114" href="/images/apple-touch-icon-114x114.png">--%>

    <!-- CSS -->
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

    <link type="text/css" rel="stylesheet" href="/static/css/admin/css_v1.css?v=0.03"/>
    <link type="text/css" rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="/static/css/admin/popwindows.css"/>


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


    <script src="/static/js/jquery-1.12.0.min.js" integrity="sha256-Xxq2X+KtazgaGuA2cWR1v3jJsuMJUozyIXDB3e793L8="
            crossorigin="anonymous"></script>
    <script src="/static/js/classie.js"></script>
    <script src="/static/js/modernizr.js"></script>
    <script src="/static/js/custom.js"></script>
    <script src="/static/js/lightgallery-all.min.js"></script>
    <script src="/static/js/wphotolist.js"></script>

    <script src="/static/js/expert/JoinE.js"></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="/static/js/jquery-eiui.js?1576543722" lang="javascript"></script>
    <script src="/static/js/jquery.placeholder.js" lang="javascript"></script>
    <script src="/static/gt.js"></script>

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
<div id="top"></div>

<header>
    <div class="container clearfix">
        <div class="container-padding">
            <div id="menu-m" class="menu-btn">
                <i class="fa fa-bars pos-menu txt-green-light"></i>
            </div>
            <%--onclick="goUrl('/sc/index.html');"--%>
            <div id="logo">
                <img src="/static/img/imghomepage/timg.jpg" alt="TCMT" style="width:40%; height:60%;">
            </div>
            <div class="right-blk">
                <div class="menu-wrap">
                    <nav class="menu">
                        <ul class="clearfix">
                            <li class="top-nav">
                                <%--主页--%>
                                <a href="/jspController/homepageEnglish" class="top   current-item">Home</a>
                            </li>
                            <%--主治--%>
                            <li class="top-nav">
                                <a href="/jspController/IndicationsEnglish" class="top">Indications</a>
                            </li>
                            <li class="top-nav">
                                <%--关于TMCT--%>
                                <a href="/jspController/TCMTEnglish" class="top" target="_blank">TCMT</a>
                            </li>
                            <li class="top-nav">
                                <%--服务项目--%>
                                <a href="/jspController/ServiceEnglish" class="top ">Service</a>
                            </li>
                            <li class="top-nav">
                                <%--收费标准--%>
                                <a href="/jspController/CostEnglish" class="top">Cost</a>
                            </li>

                            <li class="top-nav">
                                <%--线上咨询--%>
                                <a href="/consultationController/Consultation" class="top ">Consultation</a>
                            </li>

                            <li class="language" style="opacity:0">
                                <a class="top" style="border-left:none; opacity:0">NUL</a>
                            </li>

                            <li class="top-language">
                                <a class="top" style="border-left:none;">

                                    <select id="langsel" onchange="switchlang6(this.value);">
                                        <option value="English">English</option>
                                        <option value="Chinese">中文</option>
                                    </select>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="clear">

            </div>
        </div>
    </div>
</header>

<!-- Site Overlay -->
<div class="site-overlay"></div>
<div class="container page-top-pos">
    <img src="/static/img/imghomepage/zyE.jpg" alt="专业医护 专心呵护" title="专业医护 专心呵护" as="1" class="img-scale">
    <div class="container-padding pg-container ">

        <div class="clear"></div>
        <div class="pg-col-l">
            <ul class="nav-left">
                <li class="level2-d" onclick="goUrl('/jspController/homepageEnglish');">
                    Medical services
                </li>

                <li class="current" onclick="goUrl('/jspController/ExpertRegisterEnglish');">
                    Doctors joining
                </li>

                <li class="level2-d" onclick="goUrl('/jspController/UserLoginEnglish');">
                    User login
                </li>

            </ul>
        </div>
        <div class="pg-col-r">
            <%--<div class="square">--%>
            <%--<img src="/static/img/imghomepage/icon-square.svg">--%>
            <%--</div>--%>
            <!-- css adjustments -->
            <style type="text/css"></style>
            <script type="text/javascript"
                    src="//api.map.baidu.com/api?v=3.0&amp;ak=wEsaARHDGkxZ8ZyTc9BcEYzrl72gp9qq"></script>
            <script type="text/javascript"
                    src="http://api.map.baidu.com/getscript?v=3.0&amp;ak=wEsaARHDGkxZ8ZyTc9BcEYzrl72gp9qq&amp;services=&amp;t=20200415105918"></script>
            <script src="/js/baidumap.js"></script>
                <script type="text/javascript">
                    function f(str) {
                        if (event.keyCode == 13) {
                            str.focus();
                        }
                    }
                </script>
                <div id="gencontent" class="general"><!--general!-->
                    <%--Todo 页面内容--%>
                    <article class="login-con">
                        <blockquote id="form">

                            <form name="ifrm" id="ifrm" method="post">
                                <blockquote id="tab1" class="">

                                    <style>
                                        input::-webkit-input-placeholder { /* WebKit browsers 适配谷歌 */
                                            color: #04092c;
                                        }

                                        input:-moz-placeholder { /* Mozilla Firefox 4 to 18 适配火狐 */
                                            color: #04092c;
                                        }

                                        input::-moz-placeholder { /* Mozilla Firefox 19+ 适配火狐 */
                                            color: #04092c;
                                        }

                                        input:-ms-input-placeholder { /* Internet Explorer 10+  适配ie*/
                                            color: #04092c;
                                        }
                                    </style>

                                    <div class="pad10B">
                                        <div class="clrfix">
                                            <div class="input-box">
                                                <input id="expertName" name="expertName" type="text" onkeydown="KeyDown()"
                                                       value=""
                                                       class="inputNumber AppCheck nocheck data" autocomplete="off"
                                                       placeholder="Please enter a name">
                                                <div class="jyts-err">
                                                    <div><span class="username-err"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="pad10B">
                                        <div class="clrfix">
                                            <div class="input-box">
                                                <input id="expertId" name="expertId" type="text" onkeydown="KeyDown()"
                                                       value=""
                                                       class="inputNumber AppCheck nocheck data" autocomplete="off"
                                                       placeholder="Please enter practice number">
                                                <div class="jyts-err">
                                                    <div><span class="username-err"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="pad10B">
                                        <div class="clrfix">
                                            <div class="input-box">
                                                <input id="expertAddress" name="expertAddress" type="text"
                                                       onkeydown="KeyDown()" value=""
                                                       class="inputNumber AppCheck nocheck data" autocomplete="off"
                                                       placeholder="Please enter the address">
                                                <div class="jyts-err">
                                                    <div><span class="username-err"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="pad10B">
                                        <div class="clrfix">
                                            <div class="input-box">
                                                <input id="expertExcel" name="expertExcel" type="text" onkeydown="KeyDown()"
                                                       value=""
                                                       class="inputNumber AppCheck nocheck data plac" autocomplete="off"
                                                       placeholder="Please input the good range">
                                                <div class="jyts-err">
                                                    <div><span class="username-err"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="pad10B">
                                        <div class="clrfix">
                                            <div class="input-box">
                                                <input id="expertTel" name="expertTel" type="text" onkeydown="KeyDown()"
                                                       value=""
                                                       class="inputNumber AppCheck nocheck data" autocomplete="off"
                                                       placeholder="Please enter contact information">
                                                <div class="jyts-err">
                                                    <div><span class="username-err"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div id="divUser" style="width: 100%;color: red;font-size:18px;text-align: center">

                                    </div>

                                    <div id="divAll" style="width: 100%;color: red;font-size:18px;text-align: center">

                                    </div>


                                    <div>
                                        <input type="reset" value="reset">
                                        <input type="button" class="but" id="user-btn1" value="submit" onclick="Join()">
                                    </div>


                                </blockquote>
                            </form>
                        </blockquote>
                    </article>
                </div><!--End general!-->
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="clear"></div>

<a href="#0" class="cd-top"></a>


</body>
</html>
