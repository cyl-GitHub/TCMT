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
    <title>关于TCMT</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/static/css/page1.css">
    <script src="/static/js/custom.js"></script>
</head>
<body>
<div class="allpage">
    <select id="langsel" onchange="switchlang2(this.value);">
        <option value="Chinese">中文</option>
        <option value="English">English</option>
    </select>
    <!--页首-->
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
                <a href="/jspController/homepageChinese">
                    <li><img src="/static/img/imgpage1/ba0e849c8ed0fd17bec0920afa42b4d.jpg" alt="">首页</li>
                </a>
                <a href="/jspController/ServiceChinese">
                    <li><img src="/static/img/imgpage1/c3a5bc065df3ad2119e217ae9a8c07f.jpg" alt="">服务</li>
                </a>
                <a href="/jspController/CostChinese">
                    <li><img src="/static/img/imgpage1/8ee19c1d1c5bd2bac23faabe96415bd.jpg" alt="">收费</li>
                </a>
                <a href="#">
                    <li><img src="/static/img/imgpage1/63bbce821d42bd20717d3b21d67f42d.jpg" alt="">咨询</li>
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
                        <ins>公司简介 </ins>
                    </dt>
                    <dd>
                        你是否长期遭受着似乎无法治愈的痛苦？你想清理一下吗？
                        <br>
                        你的病没有手术切除？
                        <br>
                        我们公司是您最可靠、最有效的向导，帮助您快速了解中国传统文化

                        医疗。

                    </dd>
                </dl>
            </div>
            <div class="center_down_left_down_2">
                <dl>
                    <dt>
                        <ins>主要服务 </ins>
                    </dt>
                    <dd>

                        我们的主要目标是提供医疗代理服务，提供最高质量和

                        最正宗的中医治疗，因为我们的合作伙伴是

                        权威专业的中医医院和医生。

                        考虑到我们之间的语言和文化障碍，我们的导游会陪同您

                        在整个医疗过程中，如有必要，在住宿、交通和

                        你的日常生活。
                    </dd>
                </dl>
            </div>
        </div>
        <div class="center_down_right_up">
            <dl>
                <dt>
                    <ins>关于中医</ins>
                </dt>
                <dd>中医诞生于中国原始社会，是中国古代传统的精华

                    医学。中医学主要运用中药、针灸、按摩、气功等，

                    饮食疗法等治疗方法，使人体达到阴阳和谐

                    杨和康复。

                    针灸：针灸能促进血液循环，疏通经络，

                    消肿止痛活血化瘀

                    适当的穴位配合针灸。
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
