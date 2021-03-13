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
    <title>主治</title>


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
                <img src="/static/img/imghomepage/timg.jpg" alt="TCMT" style="width:50%; height:60%;">
            </div>
            <div class="right-blk">
                <div class="menu-wrap">
                    <nav class="menu">
                        <ul class="clearfix">
                            <li class="top-nav">
                                <a href="/jspController/homepageChinese" class="top">首页</a>
                            </li>

                            <li class="top-nav">
                                <a href="/jspController/IndicationsChinese" class="top    current-item">主治</a>
                            </li>

                            <li class="top-nav">
                                <a href="/jspController/TCMTChinese" class="top" target="_blank">关于TCMT</a>
                            </li>
                            <li class="top-nav"><a href="/jspController/ServiceChinese" class="top ">服务项目</a>
                            </li>
                            <li class="top-nav">
                                <a href="/jspController/CostChinese" class="top">收费标准</a>
                            </li>

                            <li class="top-nav">
                                <a href="#" class="top ">线上咨询</a>
                            </li>

                            <li class="language" style="opacity:0">
                                <a class="top" style="border-left:none; opacity:0">NUL</a>
                            </li>

                            <li class="top-language">
                                <a class="top" style="border-left:none;">
                                    <select id="langsel" onchange="switchlang5(this.value);">
                                        <option value="Chinese">中文</option>
                                        <option value="English">English</option>
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
    <img src="/static/img/imghomepage/zyC.jpg" alt="专业医护 专心呵护" title="专业医护 专心呵护" as="1" class="img-scale">
    <div class="container-padding pg-container ">

        <div class="clear"></div>
        <div class="pg-col-l">

        </div>
        <div class="pg-col-r">


            <div class="square">
                <img src="/static/img/imghomepage/icon-square.svg">
            </div>
            <!-- css adjustments -->
            <style type="text/css"></style>
            <script type="text/javascript"
                    src="//api.map.baidu.com/api?v=3.0&amp;ak=wEsaARHDGkxZ8ZyTc9BcEYzrl72gp9qq"></script>
            <script type="text/javascript"
                    src="http://api.map.baidu.com/getscript?v=3.0&amp;ak=wEsaARHDGkxZ8ZyTc9BcEYzrl72gp9qq&amp;services=&amp;t=20200415105918"></script>
            <script src="/js/baidumap.js"></script>
            <div id="gencontent" class="general"><!--general!-->
                <%--Todo 页面内容--%>
                <h2>主要疗法</h2>
                <div id="">
                    <div class="widget riche">
                        中医治疗方法是按治疗途径可分为外治、内治两大类。按采用的手段可分为物理的、化学的、生物的、精神的、综合的五大类。在外治中最具特色的有针灸疗法、推拿疗法、拔火罐疗法等。在内治中最具特色的是各种中草药疗法。其中最著名的有汗吐下和温清消补八法。

                        除了各种具体疗法以外，中医还有颇具特色的极其重要的治疗思想。例如在治疗中强调营养为主、精神为主、预防为主、整体为主等。近年来在中西医结合的过程中，中医治疗方法大放异彩在方药分析、病症研究和思想探讨等方面都取得很多成果。
                        <br>&nbsp;<br>
                        <div class="clear hwsep"></div>
                        <div class="widget clear" style="height:30px;"></div>
                        <div class="clear hwsep"></div>
                        <div class="widget riche">
                            <h3>针灸</h3>

                            针灸是针法和灸法的总称。
                            针法是指在中医理论的指导下把针具（通常指毫针）按照一定的角度刺入患者体内，运用捻转与提插等针刺手法来对人体特定部位进行刺激从而达到治疗疾病的目的。刺入点称为人体腧穴，简称穴位。根据最新针灸学教材统计，人体共有361个正经穴位。
                            灸法是以预制的灸炷或灸草在体表一定的穴位上烧灼、熏熨，利用热的刺激来预防和治疗疾病。通常以艾草最为常用，故而称为艾灸，另有隔药灸、柳条灸、灯芯灸、桑枝灸等方法。如今人们生活中也经常用到的多是艾条灸。
                            针灸由“针”和“灸”构成，是东方医学的重要组成部分之一，其内容包括针灸理论、腧穴、针灸技术以及相关器具，在形成、应用和发展的过程中，具有鲜明的中华民族文化与地域特征，是基于中华民族文化和科学传统产生的宝贵遗产。
                            2006年中国中医科学院申报针灸经国务院列入第一批国家级非物质文化遗产名录。

                            <br>&nbsp;<br>
                            <h4>主治:</h4>
                            <br>疏通经络: <br>
                            疏通经络的作用就是可使淤阻的经络通畅而发挥其正常的生理作用，是针灸最基本最直接的治疗的作用。经络“内属于脏腑，外络于肢节”，运行气血是其主要的生理功能之一。经络不通，气血运行受阻，临床表现为疼痛、麻木、肿胀、瘀斑等症状。针灸选择相应的腧穴和针刺手法及三棱针点刺出血等使经络通畅，气血运行正常。
                            <br><br>调和阴阳:<br>
                            针灸调和阴阳的作用就是可使机体从阴阳失衡的状态向平衡状态转化，是针灸治疗最终要达到的目的。疾病发生的机理是复杂的，但从总体上可归纳为阴阳失衡。针灸调和阴阳的作用是通过经络阴阳属性、经穴配伍和针刺手法完成的。
                            <br><br>扶正祛邪:<br>
                            针灸扶正祛邪的作用就是可以扶助机体正气及驱除病邪。疾病的发生发展及转归的过程，实质上就是正邪相争的过程。针灸治病，就是在于能发挥其扶正祛邪的作用。
                            <br>&nbsp;<br>

                            <h3>拔火罐</h3>
                            拔罐是以罐为工具，利用燃火、抽气等方法产生负压，使之吸附于体表，造成局部瘀血，以达到通经活络、行气活血、消肿止痛、祛风散寒等作用的疗法。拔罐疗法在中国有着悠久的历史，早在成书于西汉时期的帛书《五十二病方》中就有关于“角法”的记载，角法就类似于后世的火罐疗法。而国外古希腊、古罗马时代也曾经盛行拔罐疗法。
                            <br>&nbsp;<br>
                            <h4>主治:</h4>
                            <br>风寒湿痹、颈肩腰腿疼痛: <br>
                            留罐将罐吸附在体表后，使罐子吸拔留置于施术部位，一般留置5～10分钟
                            <br><br>感冒、咳嗽等病症:<br>
                            走罐罐口涂万花油，将罐吸住后，手握罐底，上下来回推拉移动数次，至皮肤潮红；用于面积较大、肌肉丰厚的部位，如腰背。
                            <br><br>面瘫:<br>
                            闪罐罐子拔住后，立即起下，反复吸拔多次，至皮肤潮红；
                            <br><br>痤疮等皮肤疾患:<br>
                            刺络拔罐先用梅花针或三棱针在局部叩刺或点刺出血；再拔罐使罐内出血3~5毫升；
                            <br>&nbsp;<br>

                            <h3>刮痧</h3>
                            刮痧是以中医经络腧穴理论为指导，通过特制的刮痧器具和相应的手法，蘸取一定的介质，在体表进行反复刮动、摩擦，使皮肤局部出现红色粟粒状，或暗红色出血点等“出痧”变化，从而达到活血透痧的作用。因其简、便、廉、效的特点，临床应用广泛，适合医疗及家庭保健。还可配合针灸、拔罐、刺络放血等疗法使用，加强活血化瘀、驱邪排毒的效果。
                            <br>&nbsp;<br>
                            <h4>主治:</h4>
                            <br>刮痧具有调气行血、活血化瘀、舒筋通络、驱邪排毒等功效，已广泛应用于内、外、妇、儿科的多种病症及美容、保健领域。尤其适宜于疼痛性疾病、骨关节退行性疾病如颈椎病、肩周炎的康复；对于感冒发热、咳嗽等呼吸系统病证临床可配合拔罐应用；对于痤疮、黄褐斑等损容性疾病可配合针灸、刺络放血等疗法；还适用于亚健康、慢性疲劳综合征等疾病的防治。
                            <br>&nbsp;<br>

                            <h3>推拿</h3>
                            推拿(Tuina)，中医用手在人体上按经络、穴位
                            用推、拿、提、捏、揉等手法进行治疗。推拿又有“按跷”、“跷引”、“案杌”诸称号。推拿，为一种非药物的自然疗法、物理疗法。通常是指医者运用自己的双手作用于病患的体表、受伤的部位、不适的所在、特定的腧穴、疼痛的地方，具体运用推、拿、按、摩、揉、捏、点、拍等形式多样的手法和力道，以期达到疏通经络、推行气血、扶伤止痛、祛邪扶正、调和阴阳、延长寿命的疗效。
                            <br>&nbsp;<br>
                            <h4>主治:</h4>
                            <br>疏通经络: <br>
                            《黄帝内经》里说：“经络不通；病生于不仁，治之以按摩”，说明按摩有疏通经络的作用。如按揉足三里，推脾经可增加消化液的分泌功能等，从现代医学角度来看，按摩主要是通过刺激末梢神经，促进血液、淋巴循环及组织间的代谢过程，以协调各组织、器官间的功能，使机能的新陈代谢水平有所提高。
                            <br><br>调和气血:<br>
                            明代养生家罗洪在《万寿仙书》里说：“按摩法能疏通毛窍，能运旋荣卫”。这里的运旋荣卫，就是调和气血之意。因为按摩就是以柔软、轻和之力，循经络、按穴位，施术于人体，通过经络的传导来调节全身，借以调和营卫气血，增强机体健康。现代医学认为，推拿手法的机械刺激，通过将机械能转化为热能的综合作用，以提高局部组织的温度，促使毛细血管扩张，改善血液和淋巴循环，使血液粘滞性减低，降低周围血管阻力，减轻心脏负担，故可防治心血管疾病。
                            <br><br>提高免疫力:<br>
                            如小儿痢疾，经推拿时症状减轻或消失；小儿肺部有干湿性罗音时，按揉小横纹。掌心横纹有效。有人曾在同龄组儿童中并列对照组进行保健推拿，经推拿的儿童组，发病率下降，身高、体重、食欲等皆高于对照组。以上临床实践及其他动物实验皆证明，推拿按摩具有抗炎、退热、提高免疫力的作用，可增强人体的抗病能力。
                            也正是由于按摩能够疏通经络。使气血周流、保持机体的阴阳平衡，所以按摩后可感到肌肉放松、关节灵活，使人精神振奋，消除疲劳，对保证身体健康有重要作用。
                            <br>&nbsp;<br>


                            <h3>中药</h3>
                            按治疗作用分为：补虚药、解表药、清热药、温里药、理气药、消食药、收涩药、祛风湿药、芳香化湿药、利水渗湿药、化痰止咳平喘药、安神药、平肝息风药、活血祛淤药、止血药、泻下药、驱虫药、芳香开窍药。
                            <br>&nbsp;<br>


                        </div>
                        <div class="clear hwsep"></div>
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
