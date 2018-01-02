; (function ($, window) { 
    function init() {
        if(!window.Swiper) return;
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
        if($.fn.masonry) {
            var mas = $('.masonry-container').masonry({
                itemSelector: '.masonry-item'
            });
            mas.imagesLoaded().progress(function() {
              mas.masonry('layout');
            });
        }
    }

    $(document).ready(function () {
        init();
    });
})(jQuery, window);


