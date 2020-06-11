var default_value = $("#search-keyword").val();
var storage = window.localStorage;
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)
     {
        return  unescape(r[2]);
     }
     return null;
};

var shareCity = GetQueryString("shareCity");
var fromCtiy = document.referrer.substring(8).split('.')[0];
if(shareCity!=null && shareCity.toString().length>1)
{
    
    storage["city"] = shareCity.toString();
    var city = storage["city"];
}
else if(fromCtiy == "news" || fromCtiy == "tjvplus")//用来匹配天津购房百科
{
        var shareCity = GetQueryString("shareCity");
        var fromCtiy = document.referrer.substring(-4).split('.')[1];
        var city = storage["city"];
}
else if(fromCtiy == "esf" || fromCtiy == "tjvplus")//测试地址
{
        storage["city"] = "tj";
        var city = storage["city"];
}
else if(fromCtiy!=null && fromCtiy!="" && fromCtiy.toString().length<3)
{
    storage["city"] = fromCtiy.toString();
    var city = storage["city"];
}
else if (storage["city"] != null) {
    var city = storage["city"];
}
else {
    storage["city"] = "bj";
    var city = "bj";
}
$(function () {
    var externalurl = window.location.href;
    if (externalurl.indexOf("?key") >= 0) {
        var key = externalurl.split("key=");
        var q = key[1];
        window.open("//news.centanet.com/" + city + "/search/?key=" + q);
    }
    $("#submit").live('click', function () {
        if ($(".dangqxs").text() == "资讯") {
            var tiaoj = $("#search-keyword").val();
            window.open("//news.centanet.com/" + city + "/search/?key=" + tiaoj);
        }
        else if ($(".dangqxs").text() == "门店") {
            var tiaoj = $("#search-keyword").val();
            var url = "//" + city + ".centanet.com/mendian/?key=" + tiaoj;
            window.open(url);
        }
        else if ($(".dangqxs").text() == "二手房") {
            var tiaoj = $("#search-keyword").val();
            var url = "//" + city + ".centanet.com/ershoufang/?key=" + tiaoj;
            window.open(url);
        }
        else if ($(".dangqxs").text() == "小区") {
            var tiaoj = $("#search-keyword").val();
            var url = "//" + city + ".centanet.com/xiaoqu/?key=" + tiaoj;
            window.open(url);
        }
        else if ($(".dangqxs").text() == "经纪人") {
            var tiaoj = $("#search-keyword").val();
            var url = "//" + city + ".centanet.com/jingjiren/?key=" + tiaoj;
            window.open(url);
        }
        else if ($(".dangqxs").text() == "查成交") {
            var tiaoj = $("#search-keyword").val();
            var url = "//" + city + ".centanet.com/chengjiao/contrast/?key=" + tiaoj;
            window.open(url);
        }
        else if ($(".dangqxs").text() == "成交走势") {
            var tiaoj = $("#search-keyword").val();
            var url = "//" + city + ".centanet.com/chengjiao/contrast/?key=" + tiaoj;
            window.open(url);
        }
        else if ($(".dangqxs").text() == "新房") {
            var tiaoj = $("#search-keyword").val();
            var url = "//" + city + ".centanet.com/xinfang/?key=" + tiaoj;
            window.open(url);
        }
        else if ($(".dangqxs").text() == "租房") {
            var tiaoj = $("#search-keyword").val();
            var url = "/" + city + ".centanet.com/zufang/?key=" + tiaoj;
            window.open(url);
        }
    })
    $(".search_qiehuan").live('click', function () {
        var jiegao = $(this).text();
        var dangqxs = $(".dangqxs").text();
        $(".dangqxs").html(jiegao);
        $(this).text(dangqxs);
        if (jiegao == "二手房") {
            $("#search-keyword").attr("placeholder", '请输入小区名称/学校/区域');
            default_value = "请输入小区名称/学校/区域";
        }
        if (jiegao == "门店") {
            $("#search-keyword").attr("placeholder", '请输入门店名');
            default_value = "请输入门店名";
        }
        if (jiegao == "租房") {
            $("#search-keyword").attr("placeholder", '请输入小区名称');
            default_value = "请输入小区名称";
        }
        if (jiegao == "经纪人") {
            $("#search-keyword").attr("placeholder", '请输入经纪人姓名');
            default_value = "请输入经纪人姓名";
        }
        if (jiegao == "资讯") {
            $("#search-keyword").attr("placeholder", '请输入资讯标题或内容');
            default_value = "请输入资讯标题或内容";

        }
        if (jiegao == "查成交") {
            $("#search-keyword").attr("placeholder", '请输入小区名称')
            default_value = "请输入小区名称";
        }
        if (jiegao == "新房") {
            $("#search-keyword").attr("placeholder", '请输入楼盘名/地址')
            default_value = "请输入楼盘名/地址";
        }
    })

})