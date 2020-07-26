<%--
  Created by IntelliJ IDEA.
  User: cyl27
  Date: 2020/3/14
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>About TCMT</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/static/css/page1.css">
    <script src="/static/js/custom.js"></script>
</head>
<body>
<div class="allpage">
    <!--页首-->
    <div>
        <select id="langsel" onchange="switchlang2(this.value);">
            <option value="English">English</option>
            <option value="Chinese">中文</option>
        </select>
    </div>
    <div class="header">
        <dl>
            <dt>TCMT</dt>
        </dl>

    </div>


    <!--中上-->
    <div class="center_up">
        <div class="center_up_left"></div>
        <div class="center_up_right">
            <ul>
                <a href="/jspController/homepageEnglish">
                    <li><img src="/static/img/imgpage1/ba0e849c8ed0fd17bec0920afa42b4d.jpg" alt="">Home</li>
                </a>
                <a href="/jspController/ServiceEnglish">
                    <li><img src="/static/img/imgpage1/c3a5bc065df3ad2119e217ae9a8c07f.jpg" alt="">Service</li>
                </a>
                <a href="/jspController/CostEnglish">
                    <li><img src="/static/img/imgpage1/8ee19c1d1c5bd2bac23faabe96415bd.jpg" alt="">Cost</li>
                </a>
                <a href="#">
                    <li><img src="/static/img/imgpage1/63bbce821d42bd20717d3b21d67f42d.jpg" alt="">Consultation</li>
                </a>

            </ul>
        </div>
    </div>

    <!--分割条-->
    <div class="divide">

    </div>

    <!--中下-->
    <div class="center_down">
        <div class="center_down_left_up"></div>
        <div class="center_down_center_up"></div>
        <div class="center_down_left_down">
            <div class="center_down_left_down_1">
                <dl>
                    <dt>
                        <ins>COMPANY PROFILE</ins>
                    </dt>
                    <dd>Have you long been suffering from the pains that seem to be incurable? Would you like to clear
                        up you disease without any surgical remove? <br>
                        Our company is your most reliable and efficient guide to fast track the traditional Chinese
                        medical treatment.

                    </dd>
                </dl>
            </div>
            <div class="center_down_left_down_2">
                <dl>
                    <dt>
                        <ins>MAIN SERVICES</ins>
                    </dt>
                    <dd>Our primary aim is to offer medical treatment agency service, rendering the highest quality and
                        the most authentic traditional Chinese medical treatment to you, in that our partner is the most
                        authoritative and professional TCM hospitals and doctors.
                        Considering the language and cultural barriers between us, our guides would accompany you
                        through the whole medical process, and if necessary, assisting you in accommodation, traffic and
                        your daily life.
                    </dd>
                </dl>
            </div>
        </div>
        <div class="center_down_right_up">
            <dl>
                <dt>
                    <ins>ABOUT TCM</ins>
                </dt>
                <dd>TCM was born in the primitive society of China and is the essence of ancient Chinese traditional
                    medicine. Traditional Chinese medicine mainly uses Chinese medicine, acupuncture, massage, Qigong,
                    diet therapy and other treatment methods, so that the human body can achieve the harmony of Yin and
                    Yang and rehabilitation.
                    Acupuncture：Chinese acupuncture can promote blood circulation, dredge meridians and collaterals,
                    relieve swelling and pain, promote blood circulation and dissipate blood stasis by treating
                    appropriate acupoints with acupuncture and moxibustion.
                    <br> massage
                </dd>
            </dl>
        </div>
        <div class="center_down_right_down">FAQ</div>
    </div>

    <!--页尾-->
    <div class="footer">

    </div>

</div>
</body>
</html>
