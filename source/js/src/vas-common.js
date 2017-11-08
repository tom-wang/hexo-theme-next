$(document).ready(function () {

    //监听顶部导航滚动
    bindMainNav();
    function bindMainNav () { 
        var $window = $(window), $mainNav = $("#mainNav");
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
    
});