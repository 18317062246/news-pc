$(function(){
        $(".nav-header li").mouseover(function() {
        if ($(this).children().hasClass('subnav')) {
          //$(".subnav").hide();
          //$(this).find('.subnav').show();
          $(this).addClass('on').siblings().removeClass('on');
        } else {
          $(this).addClass('on').siblings().removeClass('on');
        }
      });
      $(".nav-header li").mouseout(function() {
        //$(".subnav").hide();
        $(this).removeClass('on');
      });
      $("#J_searchtype").mouseover(function() {
          $(this).children('.search-choose').show();
        });
        $("#J_searchtype").mouseout(function() {
          $(this).children('.search-choose').hide();
        });
        $('.search-choose li').hover(function() {
          $(this).addClass('curr');
        }, function() {
          $(this).removeClass('curr');
        });
        $('.search-choose li span').click(function() {
          var val_txt = $(this).text();
          $(this).parents('#J_searchtype').find('.type-txt').text(val_txt);
        });
        if ($(".citychoosebtn").length > 0) {
          $(".citychoosebtn").facebox({
            showboxclass: ".citychoosePop",
            defaultCloseImgClass: "close"
          });
        }
    });