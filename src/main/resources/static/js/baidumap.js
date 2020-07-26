$(function() {
    $(".w8dumap").each(function() {
        var poi = ($(this).attr('poi')=="")?null:$(this).attr('poi').split(',');
        var x = (poi==null)?0:poi[0];
        var y = (poi==null)?0:poi[1];
        var map = new BMap.Map($(this).attr('id'));
        console.log('x='+x+',y='+y);
        var point = new BMap.Point(x,y);
        map.centerAndZoom(point, 18);
        //marker with icon
        //var myIcon = new BMap.Icon("/images/favicon.png", new BMap.Size(32, 32));
        //var marker = new BMap.Marker(point, {icon: myIcon});
        //default marker
        var marker = new BMap.Marker(point);
        map.addOverlay(marker);
    });
});