; (function ($, window) { 
    var $window = $(window);
    var global = {
        init: function () {
            this.bindMainNav();

            /*var path = window.location.pathname;
            switch (path) {
                case "/":
                    index.init();
                    break;
            }*/
        },
        //监听顶部导航滚动
        bindMainNav: function () {
            var $mainNav = $("#mainNav");
            if ($mainNav.length == 0) {
                return;
            }
            isNavIndexScrolled();
            $(window).bind("scroll", function () {
                isNavIndexScrolled()
            });
            function isNavIndexScrolled () {
                $mainNav[$window.scrollTop() > 0 ? 'addClass' : 'removeClass']("main-nav-scrolled");
            }
        }
    };
    
    var sidebar = {
        init: function () {
            this.bindSidebar();
        },
        //固定化侧边栏
        bindSidebar: function () {
            var $sidebar = $("#sidebar"), $parent = $sidebar.parent();
            if ($sidebar.length == 0) {
                return;
            }
            var headerPadding = tool.getDomSize($('.main-nav-wrapper'), 'padding-top')[1]||0;
            var sidebarOffsetTop = $sidebar.offset().top;
            var className = 'sidebar-fixed';
            $sidebar.width($parent.width()-30).css({
                position: 'fixed'
            });

            isScrolled();
            $(window).bind("scroll", function () {
                isScrolled()
            });
            function isScrolled () {
                if ($window.scrollTop() > sidebarOffsetTop) {
                    var pW = $parent.width();
                    var sW = $sidebar.width()+30;
                    var sF = $sidebar.hasClass(className);
                    (pW != sW) && $sidebar.width(pW);//宽度修改
                    !sF && $sidebar.addClass(className);//改为fix定位
                } else {
                    //$sidebar.width('100%');
                    $sidebar.removeClass(className);
                }
            }

            
        }
    };

    var tool = {
        getDomSize: function ($dom, cssAttr) {
            var origin = $dom.css(cssAttr);
            //origin in 0, num in 1, unit in 2
            return (origin + "").match(/(\d+)(.*)/);
        }
    };

    window.vas = {
        global: global,
        sidebar : sidebar,
    }

    $(document).ready(function () {
        global.init();
        //sidebar.init();
    });
})(jQuery, window);


