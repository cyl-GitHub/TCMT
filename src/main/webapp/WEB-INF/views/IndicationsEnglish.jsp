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
    <title>Indications</title>


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
                                <%--主页--%>
                                <a href="/jspController/homepageEnglish" class="top">Home</a>
                            </li>
                            <%--主治--%>
                            <li class="top-nav">
                                <a href="/jspController/IndicationsChinese" class="top    current-item">Indications</a>
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
                                <a href="#" class="top ">Consultation</a>
                            </li>

                            <li class="language" style="opacity:0">
                                <a class="top" style="border-left:none; opacity:0">NUL</a>
                            </li>

                            <li class="top-language">
                                <a class="top" style="border-left:none;">

                                    <select id="langsel" onchange="switchlang5(this.value);">
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
                <h2>Main treatment</h2>
                <div id="">
                    <div class="widget riche">


                        Traditional Chinese medicine can be divided into external treatment and internal treatment.
                        According to the methods adopted, it can be divided into five categories: physical, chemical,
                        biological, spiritual and comprehensive. In the external treatment, acupuncture therapy, massage
                        therapy and cupping therapy are the most characteristic. In the internal treatment, the most
                        distinctive is the treatment of various Chinese herbal medicines. Among them, the most famous
                        eight methods are sweating, vomiting and warming, clearing and nourishing.


                        In addition to various specific therapies, traditional Chinese medicine has its own unique and
                        extremely important therapeutic ideas. For example, in the treatment, nutrition, spirit,
                        prevention and integration are emphasized. In recent years, in the process of the integration of
                        traditional Chinese and Western medicine, the treatment of traditional Chinese medicine has made
                        a lot of achievements in prescription analysis, disease research and ideological discussion.
                        <br>&nbsp;<br>
                        <div class="clear hwsep"></div>
                        <div class="widget clear" style="height:30px;"></div>
                        <div class="clear hwsep"></div>
                        <div class="widget riche">
                            <h3>
                                Acupuncture
                            </h3>

                            Acupuncture is the general name of acupuncture and moxibustion.

                            Acupuncture means that under the guidance of the theory of traditional Chinese medicine, the
                            needle (usually refers to filiform needle) is inserted into the patient's body at a certain
                            angle, and the specific parts of the human body are stimulated by the acupuncture techniques
                            such as twirling and lifting to achieve the purpose of treating diseases. The point of
                            penetration is called human acupoint, which is called acupoint for short. According to the
                            statistics of the latest acupuncture teaching materials, there are 361 meridians in the
                            human body.

                            Moxibustion is to prevent and treat diseases by burning and ironing prefabricated
                            moxibustion sticks or moxibustion grass on certain acupoints on the body surface. Generally,
                            moxa grass is the most commonly used, so it is called moxibustion. There are other
                            moxibustion methods such as medicine separated moxibustion, wicker moxibustion, wicker
                            moxibustion, mulberry branch moxibustion, etc. Nowadays, moxibustion is often used in
                            people's life.

                            Acupuncture consists of "acupuncture" and "Moxibustion", which is one of the important parts
                            of Oriental medicine. Its content includes acupuncture theory, acupoints, acupuncture
                            technology and related instruments. In the process of formation, application and
                            development, it has distinct cultural and regional characteristics of the Chinese nation,
                            and it is a precious heritage based on the cultural and scientific traditions of the Chinese
                            nation.

                            In 2006, the Chinese Academy of traditional Chinese medicine declared that acupuncture was
                            listed in the first batch of national intangible cultural heritage list by the State
                            Council.


                            <br>&nbsp;<br>
                            <h4>Indications :</h4>
                            <br>Dredge meridians : <br>
                            The function of dredging meridians and collaterals is to make the blocked meridians and
                            collaterals unblocked and play their normal physiological role, which is the most basic and
                            direct treatment of acupuncture. Meridians and collaterals "belong to internal organs and
                            external collaterals to limb nodes", and the movement of Qi and blood is one of its main
                            physiological functions. The clinical manifestations are pain, numbness, swelling,
                            ecchymosis and so on. Acupuncture and moxibustion select the corresponding acupoints and
                            acupuncture techniques, as well as the three edged needle points to make the meridians
                            unobstructed and the Qi and blood run normally.
                            <br><br>Balance Yin and Yang:<br>
                            The role of acupuncture in regulating yin and Yang is to transform the body from the state
                            of imbalance of yin and yang to the state of balance, which is the ultimate goal of
                            acupuncture treatment. The pathogenesis of the disease is complex, but it can be summed up
                            as the imbalance of yin and Yang. The role of acupuncture in regulating yin and Yang is
                            achieved through the properties of yin and Yang in meridians, the compatibility of meridians
                            and acupoints, and acupuncture techniques.
                            <br><br>Strengthening the body resistance to eliminate pathogenic factors :<br>
                            The function of acupuncture and moxibustion is to help the healthy qi of the body and expel
                            pathogenic factors. The process of the occurrence, development and prognosis of diseases is
                            essentially the process of the struggle between the good and the evil. Acupuncture and
                            moxibustion is to play its role in strengthening the body and removing pathogenic factors.
                            <br>&nbsp;<br>

                            <h3>Cupping</h3>
                            Cupping is a kind of therapy with cupping as a tool, which produces negative pressure by
                            means of burning fire, drawing air and so on, so as to make it adsorb on the body surface
                            and cause local blood stasis, so as to achieve the functions of Tongjing Huoluo, Xingqi
                            Huoxue, detumescence and pain relief, dispelling wind and cold, etc. Cupping therapy has a
                            long history in China. As early as the Western Han Dynasty, there was a record of "Jiao
                            method" in the silk book "52 disease Prescriptions". Jiao method is similar to the later
                            cupping therapy. The cupping therapy was also popular in ancient Greece and Rome.
                            <br>&nbsp;<br>
                            <h4>Indications:</h4>
                            <br>Wind cold, dampness, neck, shoulder, waist and leg pain: <br>
                            After the jar is adsorbed on the body surface, the jar can be sucked and placed on the
                            operation site for 5-10 minutes
                            <br><br>
                            Cold, cough and other diseases :<br>
                            Apply 10000 flower oil to the opening of the can, after sucking the can, hold the bottom of
                            the can, push and pull it up and down for several times, until the skin is flushed; it is
                            used for parts with large area and rich muscles, such as the back of the waist.
                            <br><br>Facial paralysis :<br>
                            After the flash can is pulled out, it is immediately pulled up and down, repeatedly sucked and pulled out for many times, until the skin is flushed;
                            <br><br>Skin diseases such as acne:<br>
                            First, use plum blossom needle or triangular needle to knock or prick in the local area, then pull out the cupping to make the cupping bleeding 3-5ml;
                            <br>&nbsp;<br>

                            <h3>Scraping</h3>
                            Scraping is guided by the theory of meridians and acupoints in traditional Chinese medicine. Through special scraping instruments and corresponding techniques, dip in certain medium, repeatedly scraping and rubbing on the body surface, so that the local skin appears red millet granules, or dark red bleeding points and other "Sha" changes, so as to achieve the role of promoting blood circulation and promoting Sha. Because of its simplicity, convenience, low cost and efficiency, it is widely used in clinical practice and is suitable for medical treatment and family health care. It can also be used in combination with acupuncture, cupping, blood letting and so on to strengthen the effect of promoting blood circulation and removing blood stasis, expelling pathogenic factors and expelling toxin.
                            <br>&nbsp;<br>
                            <h4>Indications :</h4>
                            <br>Guasha has the functions of regulating qi and blood circulation, promoting blood circulation and removing blood stasis, relaxing tendons and collaterals, expelling pathogenic factors and expelling toxins. It has been widely used in various diseases, beauty and health care fields of internal, external, gynecology and pediatrics. It is especially suitable for the rehabilitation of pain diseases, bone and joint degenerative diseases such as cervical spondylosis and scapulohumeral periarthritis; it can be used with cupping in the clinical treatment of respiratory diseases such as cold, fever, cough, etc.; it can be used with acupuncture, blood letting and other therapies in the treatment of acne, chloasma, etc.; it is also suitable for the prevention and treatment of sub-health, chronic fatigue syndrome and other diseases.
                            <br>&nbsp;<br>

                            <h3>Massage</h3>
                            Massage: Chinese medicine uses hands to press meridians and acupoints on human body
                            Use push, take, lift, knead, knead and other methods for treatment. Tuina also has the titles of "press Qiao", "guide Qiao" and "case Wu". Massage is a kind of non drug natural therapy and physical therapy. It usually refers to that the doctor uses his own hands to act on the patient's body surface, injured parts, discomfort, specific acupoints, pain places, and specifically uses a variety of techniques and strength in the form of pushing, holding, pressing, rubbing, kneading, point, clapping, so as to achieve the effect of dredging meridians, promoting qi and blood, supporting injury and pain, removing pathogenic factors and strengthening, harmonizing Yin and Yang, and prolonging life.
                            <br>&nbsp;<br>
                            <h4>Indications:</h4>
                            <br>Dredge meridians : <br>
                            "Huangdi's Internal Classic" said: "channels and collaterals are blocked; disease is born in inhumanity, which is treated by massage", indicating that massage can dredge channels and collaterals. For example, pressing Zusanli and pushing the spleen meridian can increase the secretion function of digestive fluid. From the perspective of modern medicine, massage is mainly to stimulate the peripheral nerves, promote the metabolism process of blood, lymph circulation and tissue to coordinate the functions of various tissues and organs, so as to improve the metabolism level of new and old functions.
                            <br><br>Harmonizing Qi and blood :<br>
                            Luo Hong, a health preservation expert in the Ming Dynasty, said in the book of longevity Immortals: "massage can dredge the Maoqiao and move the Rongwei". Here's Yunxuan Rongwei, which is to reconcile Qi and blood. Because massage is to apply to human body by soft, light and peaceful force, following meridians and acupoints, regulating the whole body through the conduction of meridians and collaterals, so as to reconcile Ying Wei Qi and blood, and enhance the health of the body. According to modern medicine, the mechanical stimulation of massage can improve the temperature of local tissues, promote the expansion of capillaries, improve the circulation of blood and lymph, reduce the viscosity of blood, reduce the resistance of peripheral blood vessels and reduce the burden of heart, so it can prevent and treat cardiovascular diseases.
                            <br><br>Strengthen immunity:<br>
                            If children have dysentery, the symptoms will be relieved or disappear after massage; when children have dry and wet rales in their lungs, press and rub small striae. The palmprint is effective. Some people used to be in the same age group as children in the control group for health massage. The incidence rate of children in massage group was lower, height, weight and appetite were all higher than those in control group. The above clinical practice and other animal experiments have proved that massage has the function of anti-inflammatory, antipyretic and improving immunity, and can enhance the body's disease resistance.

                            It is precisely because massage can dredge the meridians. It can make Qi and blood flow around and maintain the balance of yin and Yang of the body, so after massage, you can feel muscle relaxation, flexible joints, invigorating people and eliminating fatigue, which plays an important role in ensuring your health.
                            <br>&nbsp;<br>


                            <h3>traditional Chinese medicine</h3>
                            According to the therapeutic effect, it can be divided into: tonifying deficiency medicine, relieving superficiality medicine, clearing heat medicine, warming internal medicine, regulating qi medicine, relieving food medicine, astringent medicine, eliminating wind dampness medicine, aromatizing dampness medicine, promoting water and seeping dampness medicine, resolving phlegm, relieving cough and asthma medicine, tranquilizing spirit medicine, calming liver and calming wind medicine, activating blood and removing stasis medicine, hemostatic medicine, purgative medicine, insect repellent medicine and fragrant resuscitation medicine.
                            <br>&nbsp;<br>


                        </div>
                        <div class="clear hwsep"></div>
                    </div>
                </div><!--End general!-->
            </div><!--End general!-->
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="clear"></div>

<a href="#0" class="cd-top"></a>


</body>
</html>
