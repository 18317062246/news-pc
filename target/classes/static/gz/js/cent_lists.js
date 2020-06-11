//public
function stopPropagation(e){
  e = e || window.event;
  if(e.stopPropagation){//w3c阻止冒泡方法
    e.stopPropagation();
  }else{
    e.cancelBubble = true;//IE阻止冒泡方法
  }
}
function bigimgShow(){
    $('.bigimgLayer').css({
      position: "fixed", 
      width: '100%',
      height: '100%',
      top: 0,
      left: 0,
      zIndex: 1001,
      opacity: 1,
      visibility:'visible'     
    });
    $('.bigimgLayerBg').show();
}
$(function(){ 
$("#J_city,#J_searchtype").mouseover(function(){
  $(this).children('.city-dropdown,.search_dropdown').show();
});
$("#J_city,#J_searchtype").mouseout(function(){
  $(this).children('.city-dropdown,.search_dropdown').hide();
});
$(".top-nav dd").mouseover(function(){
    if($(this).children().hasClass('sublist'))
    {
      $(".sublist").hide();
      $(this).find('.sublist').show();
      $(this).addClass('on').siblings().removeClass('on');
    }else{      
      $(this).addClass('on').siblings().removeClass('on');      
    }
  });
  $(".top-nav dd").mouseout(function(){   
      $(".sublist").hide();
      $(this).removeClass('on');      
  });

  $('.filter-text span').click(function(e){
  e ? e.stopPropagation() : event.cancelBubble = true;//阻止冒泡
 });
    $('.filter-select li').hover(function(){ 
      $('.filter-options').hide();
      $(this).find('.filter-options').show();      
    },function(){
        $(this).find('.filter-options').hide();  
    });
    $(".filter-options  a").click(function(){ 
       var thTxt=$(this).text();  
     if(thTxt != "全部"){
    $(this).parents('li').addClass("curr").find('span').html(thTxt);    
       $(this).parents('.filter-options').hide();
       return false;//阻止a默认行为
      }else{    
        $(this).parents('.filter-options').hide();
       return false;//阻止a默认行为
    }  
     $(".bigimgLayer .close-btn").click(function(e){
     e ? e.stopPropagation() : event.cancelBubble = true;//阻止冒泡
      $(this).parents('.bigimgLayer').hide();
      $(".bigimgLayerBg").hide();       
     });  
    });
if( $(".collectbtn").length>0){$(".collectbtn").facebox({showboxclass: ".collectcon",defaultCloseImgClass: "sendsmsclose" });}
if( $(".mortgagebtn").length>0){$(".mortgagebtn").facebox({ showboxclass: ".mortgagecon", defaultCloseImgClass: "sendsmsclose" });} 

$(".share_btn").click(function(e){   
  $(this).parents('.rDetail').next('.share-dropDown').show();
   stopPropagation(e);  
 });

$(".rDetail .second").hover(function(){
        $(this).parents('.rDetail').siblings(".see-dropDown").show();
      },function(){
        $(this).parents('.rDetail').siblings(".see-dropDown").hide();        
  });

$("li.weixi").hover(function(){   
  $(this).parents('.rDetail').siblings('.weixitip').show();
   },function(){
   $(this).parents('.rDetail').siblings(".weixitip").hide(); 
 });

$(document).click(function(){
  $('.share-dropDown').hide();
});
  $(".bigimgLayer .close-btn").click(function(e){
     e ? e.stopPropagation() : event.cancelBubble = true;//阻止冒泡
      $(this).parents('.bigimgLayer').hide();
      $(".bigimgLayerBg").hide();       
     });
     /* $(document).click(function(){
      $('.bigimgLayer').hide();
      $(".bigimgLayerBg").hide();
    });*/
  });

$(function () {
 if( $(".protocolbtn").length>0){$(".protocolbtn").facebox({ showboxclass: ".protocolcon", defaultCloseImgClass: "sendsmsclose" });} 
   $(".loginWay li").click(function(){
    var v_index = $(this).index();
    $(this).addClass('curr').siblings().removeClass('curr');
    $(".loginWayLayer .loginWayCont").eq(v_index).show().siblings().hide();
  }); 
    $(".protocolbtn").click();
    var $div_liB =$(".live-nav li");
        $div_liB.click(function(){
            $(this).addClass("curr").siblings().removeClass("curr");  
            var index =  $div_li.index(this);  
        //$(".peri-waper > .peri-cont").eq(index).show().siblings().hide(); 
        });
        var _height=$(window).height();
        $(".bigimgouter").css("height",(_height+'px'));
});
/*相似房源*/
$(function() {
    if ($(".rollhouse").length > 0) {
        $(".rollhouse").xslider({//.productshow是要移动对象的外框;
                unitdisplayed: 4, //可视的单位个数   必需项;
                movelength: 4, //要移动的单位个数    必需项;
                maxlength: null, //可视宽度或高度    默认查找要移动对象外层的宽或高度;
                scrollobj: null, //要移动的对象     默认查找productshow下的ul;
                unitlen: null, //移动的单位宽或高度     默认查找li的尺寸;
                nowlength: null, //移动最长宽或高（要移动对象的宽度或高度）   默认由li个数乘以unitlen所得的积;
                dir: "H", //水平移动还是垂直移动，默认H为水平移动，传入V或其他字符则表示垂直移动;
                autoscroll: null//自动移动间隔时间     默认null不自动移动;
            });
    }
});  
/*condList筛选*/
function addCur(obj){
  if($(obj).hasClass('cur')){
    $(obj).removeClass('cur');
    $(obj).text('更多小区');    
    //$(obj).closest('.termcon').css('height','22px');
    $(obj).parents('#xiaoquSwitch').css({height:'27px',overflow:'hidden'});
  }else{
    $('#xiaoquSwitch .arrorBox').removeClass('cur');
    $('#xiaoquSwitch').css({height:'27px',overflow:'hidden'});
    $(obj).addClass('cur');
    $(obj).text('收起');
    $(obj).parents('#xiaoquSwitch').css('height','auto');
  }
};


function condListDd(){ 
  var lega,wdd1 = 0; 
    var lega = $('#xiaoquSwitch').find('a').length;
    var wdd1 = 0;
    for(var j=0;j<=lega-1;j++){
      wdd1 +=  $('#xiaoquSwitch').find('a').eq(j).outerWidth(true);      
    }
    //if($('.termcon').eq(i).width()>=wdd1){
    if(wdd1>=1050){
      $('#xiaoquSwitch').css({height:'27px',overflow:'hidden'});
       $('#xiaoquSwitch').find('.arrorBox').text('更多小区');
      $('#xiaoquSwitch').find('.arrorBox').show();
    }else{
      $('#xiaoquSwitch').find('.arrorBox').hide();
    }
  }
$(function(){
  $(window).load(function(){
  condListDd();
});
  $('.house-listBox .house-item').hover(function(){
    $(this).addClass('house-item-curr');
    $(this).find('.updatetime').show();
  },function(){
    $(this).removeClass('house-item-curr');
    $(this).find('.updatetime').hide();
  });

 $(window).scroll(function(){
    if($(window).scrollTop()>150){
      $("#scrollSid").fadeIn(1000);
    }else{
      $("#scrollSid").fadeOut(1000);
    }
  });
  $("#topBtn").click(function(){
    $('body,html').animate({scrollTop:0},1000);
    return false;
   });
  $("#writeBtn").mouseover(function(){
  $(".writeTip").animate({right:40,opacity:1},500)});
  $("#writeBtn").mouseout(function(){
  $(".writeTip").animate({right:0,opacity:0},500)});
   });
/*详情页滚动效果*/
$(function(){
/* 绑定页面滚动事件 */
var tab_index = 0;
  $(".detail-tab").find("li").each(function (i) {
      if ($(this).css("display") == "list-item") {
          if (tab_index == i) {
              $(this).addClass('curr');
          }
          tab_index++;
      }
  });


 $(window).scroll(function (event) {  
     var scrollTop = $(window).scrollTop();
     if($("#detailComment").length>0){
     var enableHeight = $("#detailComment").offset().top;
     if (scrollTop >= enableHeight) {
         $(".title-top").each(function (i) {
         var thisTop=$(this).parent().offset().top-50; 
         //alert($(".title-top").get(0).top);                  
             if (thisTop >=scrollTop) { 
                       $("#detailTabBox").css({
                        position: 'fixed',
                        top: 0,
                        zIndex: 9
                        });  
                             
                 $(".detail-tab").find("li").removeClass('curr');
                // $($(".detail-tab").find("li").get(i)).addClass('curr');

                 /* 找到文章块后退出循环 */
                 return false;
             }
         });
     } else {
         $("#detailTabBox").css({position: 'relative',top: 0,zIndex:0});
     }
 }
 });

  $(".quick_links_panel li").mouseenter(function(){
    $(this).children(".mp_tooltip").animate({left:-92,queue:true});
    $(this).children(".mp_tooltip").css("visibility","visible"); 
    $(this).children(".fair_tooltip").css("display","block");  
    $(this).children(".mp_qrcode").show();
  });
  $(".quick_links_panel li").mouseleave(function(){
    $(this).children(".mp_tooltip").css("visibility","hidden");
    $(this).children(".mp_tooltip").animate({left:-121,queue:true});  
    $(this).children(".fair_tooltip").css("display","none");
    $(this).children(".mp_qrcode").hide();  
  });
  $(".intent_li,.view_li,.chat_li").click(function(){
    var loginTop = $(this).offset().top;
    $(".mui-ibar-prof").css({display:'block',top:loginTop,left:-421});
  });
  $(".mui-ibar-login-close").click(function(){
    $(this).parent('.mui-ibar-prof').hide();
  });
   if($('#slidesB').length > 0){
     $("#slidesB").slidesjs({
        width: 760,
        height:420,
        navigation: {
        active: true,
       effect: "slide"
       }
      });
}
 if($('#slidesC').length > 0){
     $("#slidesC").slidesjs({
        width: 690,
        height:402,
        navigation: {
        active: true,
       effect: "slide"
       }
      });
}
 if( $(".comparePopbtn").length>0){$(".comparePopbtn").facebox({ showboxclass: ".comparedPopcont", defaultCloseImgClass: "sendsmsclose" });} 
 if( $(".choosebrokerBtn").length>0){$(".choosebrokerBtn").facebox({ showboxclass: ".choosebrokercont", defaultCloseImgClass: "sendsmsclose" });} 
 if( $(".succssBtn").length>0){$(".succssBtn").facebox({ showboxclass: ".succsscont", defaultCloseImgClass: "sendsmsclose" });
     $(".succssBtn").click(function(){
        $(".choosebrokercont").hide();
       });
} 
 

  $('.tab-record li').click(function(){
      $(this).addClass('curr').siblings().removeClass('curr');
      var _index = $(this).index();
      $('.recordmain').find('.recordlayer').eq(_index).show().siblings().hide();
  });

  $(".baseinfo-top .weixi").hover(function(){
        $(this).parent().next(".weixitip").show();
      },function(){
        $(this).parent().next(".weixitip").hide();
  });




  function showSiderLayerA(){
    $("#quick_links li.view_li").find('a').trigger("click");
  }
  function showSiderLayerB(){
    $("#quick_links li.mpbtn_histroy").find('a').trigger("click");
  }

  
  if($("#lookAroundBtn").length>0){
    $("#lookAroundBtn").click(function(){
      showSiderLayerA();
      return false;        
   });
  }  
if($("#saveIntenBtn").length > 0){
    $("#saveIntenBtn").click(function(){
      showSiderLayerB();
      return false;        
   });
  }

  $('input.search_ipt').click(function(e){
      e.stopPropagation();  
     $(this).parents('.t-search').children('.history-sug').show();     
    });
$(document).click(function(){
  $('.history-sug').hide();
})

  if($.browser.msie){
        $('.big_video').click(function() {
          $(this).parent().hide();          
        });
        $('.firstMiniVideo').click(function(){
          $('.playPic').hide();         
            });
      }else{
        $('.big_video').click(function() {
          $(this).parent().hide();
          $(this).parent().next('video')[0].play();
        });
        $('.firstMiniVideo').click(function(){
          $('.playPic').hide();
         $('.picBox video')[0].play();
            });
      }

      $(".last_succinfo .weixi").hover(function(){
        $(this).parent().find(".weixitip").show();
      },function(){
        $(this).parent().find(".weixitip").hide();
  });
if( $(".mapPop_btn").length>0){$(".mapPop_btn").facebox({ showboxclass: ".mappopcont", defaultCloseImgClass: "sendsmsclose" });} 
if( $(".jqpop_btn").length>0){$(".jqpop_btn").facebox({ showboxclass: ".jqpopcont", defaultCloseImgClass: "sendsmsclose" });} 

});


