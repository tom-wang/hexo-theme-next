;(function($, window) {
    function init() {
        var swiper = new Swiper('.share-container', {
            effect: 'fade',
            loop: true,
            autoplay: true,
            speed: 500,
            //grabCursor: true,
        });
    }

    $(document).ready(init);
})(jQuery, window);
