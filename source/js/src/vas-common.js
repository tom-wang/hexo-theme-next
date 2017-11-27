; (function ($, window) { 
    function init() {
        var swiper = new Swiper('.swiper-container', {
            effect: 'cube',
            direction: 'vertical',
            loop: true,
            autoplay: true,
            speed: 500,
            //grabCursor: true,
            cubeEffect: {
                shadow: false,
                slideShadows: false
            }
        });
    }

    $(document).ready(function () {
        init();
    });
})(jQuery, window);


