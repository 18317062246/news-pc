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
}
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
  $(".nav-header li").mouseover(function(){
    if($(this).children().hasClass('subnav'))
    {
      //$(".subnav").hide();
      //$(this).find('.subnav').show();
      $(this).addClass('on').siblings().removeClass('on');
    }else{      
      $(this).addClass('on').siblings().removeClass('on');      
    }
  });
  $(".nav-header li").mouseout(function(){   
      //$(".subnav").hide();
      $(this).removeClass('on');      
  });	

	$("#J_searchtype").mouseover(function(){
	  $(this).children('.search-choose').show();
	});
	$("#J_searchtype").mouseout(function(){
	  $(this).children('.search-choose').hide();
	});
	$('.search-choose li').hover(function(){
		$(this).addClass('curr');
	},function(){
		$(this).removeClass('curr');
	});
	$('.search-choose li span').click(function(){
		var val_txt = $(this).text();
		$(this).parents('#J_searchtype').find('.type-txt').text(val_txt);
	});
$('.section-houselists .house-item').hover(function(){
    $(this).addClass('curr');
    $(this).find('.price-tip,.price-txtB,.follow_btn').show();
  },function(){
    $(this).removeClass('curr');
    $(this).find('.price-tip,.price-txtB,.follow_btn').hide();
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
     });

	
	//label.check
	$('.check').click(function(){
		if($(this).hasClass('checkTrue')){
			$(this).removeClass('checkTrue');				
		}else{
			$(this).addClass('checkTrue');			
		}
	});
	$('.footer-tab  li').click(function(){
		var _index = $(this).index();
		$(this).addClass('curr').siblings().removeClass('curr');
		$('.footer-hotwrapper .fhot-cont').eq(_index).show().siblings().hide();
	});
/*侧栏*/
	$(".quick_links_panel li").mouseenter(function(){	 	
    $(this).children(".mp_tooltip").animate({left:-90,queue:true});
    $(this).children(".mp_tooltip").css({visibility:'visible',display:'block'}); 
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

  $('.intentTip .close_btn').click(function(){
  	$(this).parent('.intentTip').hide();
  });
  $('.tag .icons-close').click(function(){  
  		$(this).parent('label').hide();
  });
  

  $(window).load(function(){condListDd();});
if( $(".mapPop_ashbtn").length>0){$(".mapPop_ashbtn").facebox({ showboxclass: ".mappopcont", defaultCloseImgClass: "sendsmsclose" });} 

 if($('#slidesB').length > 0){
     $("#slidesB").slidesjs({
        width: 680,
        height:420,
        navigation: {
        active: true,
       effect: "slide"
       }
      });
}




});

