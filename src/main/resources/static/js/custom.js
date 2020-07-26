function E$(e) { return document.getElementById(e); }
function U$(u) { return "/"+u; }
function goUrl(u) { location.href=u; }
function popUrl(u) { window.open(u); }
function refresh() { window.location.reload(); }
function switchlang1(b) {
    if (b == "English") {
        goUrl("/jspController/homepageEnglish");
    } else if (b == "Chinese") {
        goUrl("/jspController/homepageChinese");
    }
}
function switchlang2(b) {
    if (b == "English") {
        goUrl("/jspController/TCMTEnglish");
    } else if (b == "Chinese") {
        goUrl("/jspController/TCMTChinese");
    }
}

function switchlang3(b) {
    if (b == "English") {
        goUrl("/jspController/ServiceEnglish");
    } else if (b == "Chinese") {
        goUrl("/jspController/ServiceChinese");
    }
}

function switchlang4(b) {
    if (b == "English") {
        goUrl("/jspController/CostEnglish");
    } else if (b == "Chinese") {
        goUrl("/jspController/CostChinese");
    }
}

function switchlang5(b) {
    if (b == "English") {
        goUrl("/jspController/IndicationsEnglish");
    } else if (b == "Chinese") {
        goUrl("/jspController/IndicationsChinese");
    }
}

function switchlang6(b) {
    if (b == "English") {
        goUrl("/jspController/ExpertRegisterEnglish");
    } else if (b == "Chinese") {
        goUrl("/jspController/ExpertRegisterChinese");
    }
}

function switchlang7(b) {
    if (b == "English") {
        goUrl("/jspController/UserLoginEnglish");
    } else if (b == "Chinese") {
        goUrl("/jspController/UserLoginChinese");
    }
}


function validemail(e) {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return filter.test(e);
}

function init() {
    window.addEventListener('scroll', function(e){
        var distanceY = window.pageYOffset || document.documentElement.scrollTop,
            shrinkOn = 300,
            header = document.querySelector("header");
        if (distanceY > shrinkOn) {
            classie.add(header,"smaller");
        } else {
            if (classie.has(header,"smaller")) {
                classie.remove(header,"smaller");
            }
        }
    });
}

function closeIfnotUnder(e) {
    var outsub=true; var outli=true;
    var sub = $(".menu li .sub-menu:visible");
    var h = $("header");
    var li = sub.closest("li");
    var x = e.pageX; var y=e.pageY;    
    //console.log('e.x='+x+' e.y='+y+' hht='+h.height()+' slen='+sub.length+' llen='+li.length);
    if (sub.length>0) { //within submenu not closed
        //console.log('has sub');
        var sp = sub.offset();
        if (x>=sp.left && x<=sp.left+sub.width() && y>=sp.top && y<=sp.top+sub.height()) {
           outsub=false;
           //console.log('insub');
        } //else console.log('outsub');
        
        if (li.length>0) { //within header li range
            //console.log('has li');
            var lp = li.offset();
            if (x>=lp.left && x<=lp.left+li.width() && y<=h.height()) {
                outli=false;
                //console.log('inli');
            } //else console.log('outli');
        }    
        if (outsub && outli) sub.hide();
    }   
}

function setDskTopNav() {
    $(".menu>ul>li").mouseenter(function() {
       $(".menu li .sub-menu").hide();
       $(this).find(".sub-menu").show();
    });    
    $(".menu>ul").mouseleave(function(e) {
       closeIfnotUnder(e);       
    });
    $(".menu>ul>li .sub-menu").mouseleave(function(e) {
       closeIfnotUnder(e);       
    });
    $(window).scroll(function(e) {
       closeIfnotUnder(e);       
    });
}

function chgTab(t) { 
    var l = $("#"+t).closest('.TabList');
    l.find('.tab-content').hide();
    l.find(".tabs-menu li.current").removeClass('current');
    l.find(".tabs-menu li."+t).addClass("current");
    l.find(".label-m select").val(t);
    $("#"+t).fadeIn();
}

function setMobTabList() {
    $(".TabList .label-m select.tab").change( function() {
       chgTab($(this).val());
    });
}
 
$(document).ready(function() {
    init();
    setDskTopNav();
    setMobTabList();    
    $("select.pgnav").change(function() {
       goUrl($(this).val()); 
    });
});