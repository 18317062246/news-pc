jQuery(function($){
	//创建DOM
	var 
	quickHTML = document.querySelector("div.quick_link_mian"),
	quickShell = $(document.createElement('div')).html(quickHTML).addClass('quick_links_wrap'),
	quickLinks = quickShell.find('.quick_links');
	quickPanel = quickLinks.next();
	quickShell.appendTo('.mui-mbar-tabs');
	
	//具体数据操作 
	var 
	quickPopXHR,
	loadingTmpl = '<div class="loading" style="padding:30px 80px"><i></i><span>Loading...</span></div>',
	popTmpl = '<div class="ibar_plugin_title"><h3><%=title%></h3></div> <div class="pop_panel"><%=content%></div>', 
	historyListTmpl = '<ul><%for(var i=0,len=items.length; i<5&&i<len; i++){%> <li><a href="<%=items[i].productUrl%>" target="_blank" class="pic"> <img alt="<%=items[i].productName%>" src="<%=items[i].productImage%>" width="60" height="60"/></a> <a href="<%=items[i].productUrl%>" title="<%=items[i].productName%>" target="_blank" class="tit"> <%=items[i].productName%></a> <div class="price" title="单价"><em>&yen;<%=items[i].productPrice%></em></div></li><%}%></ul>', 
	newMsgTmpl = '<ul><li><a href="#"><span class="tips">新回复<em class="num"><b><%=items.commentNewReply%></b></em></span>商品评价/晒单</a></li><li><a href="#"><span class="tips">新回复<em class="num"><b><%=items.consultNewReply%></b></em></span>商品咨询</a></li><li><a href="#"><span class="tips">新回复<em class="num"><b><%=items.messageNewReply%></b></em></span>我的留言</a></li><li><a href="#"><span class="tips">新通知<em class="num"><b><%=items.arrivalNewNotice%></b></em></span>到货通知</a></li><li><a href="#"><span class="tips">新通知<em class="num"><b><%=items.reduceNewNotice%></b></em></span>降价提醒</a></li></ul>',
	quickPop = quickShell.find('#quick_links_pop'),
	quickDataFns = {
		//我的意向
		my_intent: {
			title: '我的意向',
			//content:'<div class="ibar_plugin_content"><div class="ibar_pluginInner"><dl class="notext "><dt><img src="sidebar/img/nodisplay.png" alt="" /></dt><dd><h5 >暂无意向</h5><p class="f999 f14">保存找房意向后，就能一键查看房源啦!</p> </dd> </dl></div></div>', init: $.noop
		
			content: '<div class="ibar_plugin_content"><div class="ibar_pluginInner"><ul class="sider_indents_list"><li><a href="#"><span >长宁</span><span >新华路</span><span >100-120平米</span><span >3室</span></a></li><li><a href=""><span >长宁</span><span >新华路</span><span >100-120平米</span><span >3室</span></a></li></ul> <a  class="sideRed_btn" href="#">更多意向</a></div></div>', init:$.noop
		},
		//我的约看单
		view_list: {
			title: '未约看',
			//content:'<div class="ibar_plugin_content"><div class="ibar_pluginInner"><dl class="notext "><dt><img src="sidebar/img/nodisplay.png" alt="" /></dt><dd><h5 >暂无约看</h5><p class="f999 f14">看中的房源，赶紧添加约看哦!</p> </dd> </dl></div></div>', init: $.noop
		
			content: '<div class="ibar_plugin_content"><div class="ibar_pluginInner"><a class="seeBluebtn cBlue" href="">查看约看清单</a> <div class="ibar-moudle-product"> <div class="imp_item"><p class="tip_iconA"></p><p class="check"><input type="checkbox" name="1" /></p><p class="pic"><a href="#"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></a></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span><span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span><span class="dele_btn"></span></p></div> <div class="imp_item"><p class="tip_iconB"></p><p class="check"><input type="checkbox" name="1" /></p> <p class="pic"><a href="#"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></a></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span><span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span> <span class="dele_btn"></span></p></div></div> <a  class="sideRed_btn" href="#">更多意向</a></div></div>', init: $.noop },
	
		mpbtn_histroy:{
			title: '我的足迹',
			//content:'<div class="ibar_plugin_content"><div class="ibar_pluginInner"><dl class="notext "><dt><img src="sidebar/img/nodisplay.png" alt="" /></dt><dd><h5 >暂无足迹</h5><p class="f999 f14"></p> </dd> </dl></div></div>', init: $.noop
			content:'<div class="ibar_plugin_content"><div class="ibar_pluginInner"><div class="ibar-moudle-product"><div class="imp_item"> <p class="pic"><a href="#"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></a></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span> <span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span> </p></div><div class="imp_item"> <a href="#"><p class="pic"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span> <span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span> </p></a></div> <div class="imp_item"> <a href="#"><p class="pic"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span> <span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span> </p></a></div> <div class="imp_item"> <a href="#"><p class="pic"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span><span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span> </p></a></div></div></div><div class="fixbotlayer"><a  class="sideRed_btn" href="#">更多足迹</a></div></div>', init: $.noop
		},
		//我的关注	
		mpbtn_follow:{
			title: '关注',
			content:'<div class="ibar_plugin_content"><div class="ibar_pluginInner"><dl class="notext "><dt><img src="sidebar/img/nodisplay.png" alt="" /></dt><dd><h5 >暂无足迹</h5><p class="f999 f14"></p> </dd> </dl></div></div>', init: $.noop
			//content:'<div class="ibar_plugin_content"><div class="ibar_pluginInner"><div class="ibar-moudle-product"><div class="imp_item"> <p class="pic"><a href="#"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></a></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span> <span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span> </p></div><div class="imp_item"> <a href="#"><p class="pic"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span> <span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span> </p></a></div> <div class="imp_item"> <a href="#"><p class="pic"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span> <span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span> </p></a></div> <div class="imp_item"> <a href="#"><p class="pic"><img src="../images/p2/ps_1.jpg" width="67" height="50" /></p> <p class="mid"><span class="tit">旭辉御景园</span> <span class="txt">3室2厅</span><span class="txt">120平米</span> </p> <p class="side"><span class="price">295万</span><span class="f000">22015元/平米</span> </p></a></div></div></div><div class="fixbotlayer"><a  class="sideRed_btn" href="#">更多足迹</a></div></div>', init: $.noop
		}	
	};
	
	//showQuickPop
	var 
	prevPopType,
	prevTrigger,
	doc = $(document),
	popDisplayed = false,
	hideQuickPop = function(){
		if(prevTrigger){
			prevTrigger.removeClass('current');
		}
		popDisplayed = false;
		prevPopType = '';
		quickPop.hide();
		//quickPop.animate({right:-280,queue:true});

		$('.quick_link_mian').animate({right:-290,queue:true,visibility:'visible',width:330});
	},
	showQuickPop = function(type){
		if(quickPopXHR && quickPopXHR.abort){
			quickPopXHR.abort();
		}
		if(type !== prevPopType){
			var fn = quickDataFns[type];
			quickPop.html(ds.tmpl(popTmpl, fn));
			fn.init.call(this, fn);
		}
		if(type =='my_intent'){
			$('.sider_indents_list li:odd').css({'background':'#f5f5f5'});
		}
		if(type!=='view_list' && ($('.choosebrokercont:visible'))){
		doc.unbind('click.quick_links').one('click.quick_links', hideQuickPop);}
		quickPop[0].className = 'quick_links_pop quick_' + type;
		var flag=1;
		if(flag==0){
		   popDisplayed = false;
		   prevPopType = '';
		   quickPop.hide();
		}else{
			popDisplayed = true;
			prevPopType = type;
			quickPop.show();		
		  $('.quick_link_mian').animate({right:0,queue:true,visibility:'visible',width:330});
		}
		
		
	};
	quickShell.bind('click.quick_links', function(e){
		e.stopPropagation();
	});
	quickPop.delegate('a.ibar_closebtn','click',function(){
		quickPop.hide();
		//quickPop.animate({right:-280,queue:true});
		$('.quick_link_mian').animate({right:0,queue:true,visibility:'visible',width:330});
		if(prevTrigger){
			prevTrigger.removeClass('current');
		}

	});

	//通用事件处理
	var 
	view = $(window),
	quickLinkCollapsed = !!ds.getCookie('ql_collapse'),
	getHandlerType = function(className){
		return className.replace(/current/g, '').replace(/\s+/, '');
	},
	showPopFn = function(){
		var type = getHandlerType(this.className);
		if(popDisplayed && type === prevPopType){
			return hideQuickPop();
		}
		showQuickPop(this.className);
		resize();
		if(prevTrigger){
			prevTrigger.removeClass('current');
		}
		prevTrigger = $(this).addClass('current');
	},
	quickHandlers = {
		//我的意向，约看单，足迹
		my_intent: showPopFn,
		//message_list: showPopFn,
		view_list: showPopFn,
		//leave_message: showPopFn,
		mpbtn_histroy:showPopFn,		
		//返回顶部
		return_top: function(){
			ds.scrollTo(0, 0);
			hideReturnTop();
		}
	};
	quickShell.delegate('a', 'click', function(e){
		var type = getHandlerType(this.className);

		if(type && quickHandlers[type]){
			quickHandlers[type].call(this);
			e.preventDefault();
		}
		if(type=='view_list'){
			quickPop.delegate('span.dele_btn','click',function(){
			$(this).parents('.imp_item').hide();
			
		});
		quickPop.delegate('a.sideRed_btn','click',function(){
			$('.choosebrokerBtn').click();

		});
		}
	});
	
	//Return top
	var scrollTimer, resizeTimer, minWidth = 1350;

	function resizeHandler(){
		clearTimeout(scrollTimer);
		scrollTimer = setTimeout(checkScroll, 160);
	}
	
	function checkResize(){
		quickShell[view.width() > 1340 ? 'removeClass' : 'addClass']('quick_links_dockright');
	}
	function scrollHandler(){
		clearTimeout(resizeTimer);
		resizeTimer = setTimeout(checkResize, 160);
	}
	function checkScroll(){
		view.scrollTop()>100 ? showReturnTop() : hideReturnTop();
	}
	function showReturnTop(){
		quickPanel.addClass('quick_links_allow_gotop');
	}
	function hideReturnTop(){
		quickPanel.removeClass('quick_links_allow_gotop');
	}
	view.bind('scroll.go_top', resizeHandler).bind('resize.quick_links', scrollHandler);
	quickLinkCollapsed && quickShell.addClass('quick_links_min');
	resizeHandler();
	scrollHandler();


$(window).resize(function(event) {resize(); });
function resize(){   
        var header_h =108;
        var tip_h =150;
        if($('.ibar-moudle-product').length>0){
            
            var tmp = ($(window).height() - 198); 
            $('.ibar_pluginInner,.ibar-moudle-product').css({
                height: tmp+"px"
            });
           $('.ibar_plugin_content').css({
              height: tmp+"px"
            });
        }else{
        	var tmp = ($(window).height() - 198); 
            $('.ibar_pluginInner,.ibar_plugin_content').css({
                height: tmp+"px"
            });          
        }   
}
});