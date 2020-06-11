(function ($) {
    $.fn.facebox = function(settings) {
      
        settings = jQuery.extend({//可配置参数
                showboxclass: ".popupcon", //显示层
                defaultBgClass: ".popupbg", //背景变黑
                defaultCloseClass: ".popupclose", //关闭按钮CLASS
                defaultCloseImgClass: "",
                firstShow: false, //开始的时候就加载 
                debug: ""//调试用
            },
            settings,
            {//插件信息
                version: 001
            });

        $(this).click(function() {
           
            showThis();
        });
        function showThis() {
            var bgclass = $(settings.defaultBgClass);
            var closeclass = $(settings.showboxclass).find($(settings.defaultCloseClass));
            var windowWidth = document.documentElement.clientWidth;
            var windowHeight = document.documentElement.clientHeight;
            var popupHeight = $(settings.showboxclass).height();
            var popupWidth = $(settings.showboxclass).width();
            $(settings.showboxclass).css({
                    "top": (windowHeight - popupHeight) / 2 + $(document).scrollTop(),
                    "left": (windowWidth - popupWidth) / 2,
                    "position": "absolute",
                    "z-index": "9999"
                });
            $(bgclass).css({
                    "height": $(document).height()
                });

            $(settings.showboxclass).show();
            if (settings.defaultCloseImgClass != "") {
                $(settings.showboxclass).append("<span class='js_nclose " + settings.defaultCloseImgClass + "'></span>");
            }
            else {
                $(settings.showboxclass).append("<span class='js_close'></span>");
            }
            $(bgclass).show();
            if ($(closeclass).length > 0) {
                $(closeclass).click(function() {
                    closeWindow();
                });
            }
            $(".js_close").click(function() {
                closeWindow();
            });
            $(".js_nclose").click(function() {
                closeWindow();
            });
            function closeWindow() {
                $(settings.showboxclass).hide();
                if ($(settings.showboxclass).find("iframe").length > 0) {
                    $(settings.showboxclass).find("iframe").attr("src", "");
                }
                $(bgclass).hide();
            }
        }
        if (settings.firstShow) {
            showThis();
        }

        if (settings.debug != "") alert(settings[settings.debug]);
        return this;
    };
})(jQuery);