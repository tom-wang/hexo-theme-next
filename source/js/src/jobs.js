;(function() {
    $.fn.extend({
        animateCSS: function (animationName, timeout) {
            var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
            var _resolve, _reject;
            var p = new Promise(function(resolve, reject) {
                _resolve = resolve;
                _reject = reject;
            });
            this.addClass('animated ' + animationName);
            var $ele = $(this);
            if(timeout) {
                setTimeout(function() {
                    $ele.removeClass('animated ' + animationName);
                    _resolve($ele);
                }, timeout);
            } else {
                this.one(animationEnd, function() {
                    console.log(animationName + ' happen', this, Date.now());
                    $ele.removeClass('animated ' + animationName);
                    _resolve($ele);
                });
            }
            return p;
        }
    });

    function qqgameAnimate() {
        $('.qqgame-tapdot-1').show().animateCSS('slideInUp infinite', 3000).then(function($ele) {
            $ele.hide();
            return $('.qqgame-jobs-img-1').animateCSS('zoomOut');
        }).then(function($ele) {
            $ele.hide();
            return $('.qqgame-jobs-img-2').show().animateCSS('zoomIn');
        }).then(function() {
            return $('.qqgame-tapdot-2').show().animateCSS('slideInUp infinite', 3000);
        }).then(function($ele) {
            $ele.hide();
            return $('.qqgame-jobs-img-2').animateCSS('zoomOut');
        }).then(function($ele) {
            $ele.hide();
            return $('.qqgame-jobs-img-3').show().animateCSS('zoomIn');
        }).then(function() {
            return $('.qqgame-tapdot-3').show().animateCSS('slideInUp infinite', 3000);
        }).then(function($ele) {
            $ele.hide();
            return $('.qqgame-jobs-img-3').animateCSS('zoomOut');
        }).then(function($ele) {
            $ele.hide();
            return $('.qqgame-jobs-img-4').show().animateCSS('zoomIn');
        }).then(function() {
            return $('.qqgame-tapdot-4').show().animateCSS('slideInUp infinite', 3000);
        }).then(function($ele) {
            $ele.hide();
            return $('.qqgame-jobs-img-4').animateCSS('zoomOut');
        }).then(function($ele) {
            $ele.hide();
            return $('.qqgame-jobs-img-1').show().animateCSS('zoomIn');
        }).then(qqgameAnimate);
    }

    function egameAnimate() {
        $('.egame-tapdot-1').show().animateCSS('slideInUp infinite', 2300).then(function($ele) {
            $ele.hide();
            return $('.egame-jobs-img-1').animateCSS('flipOutY');
        }).then(function($ele) {
            $ele.hide();
            return $('.egame-jobs-img-2').show().animateCSS('flipInY');
        }).then(function() {
            return $('.egame-tapdot-2').show().animateCSS('slideInUp infinite', 2300);
        }).then(function($ele) {
            $ele.hide();
            return $('.egame-jobs-img-2').animateCSS('flipOutY');
        }).then(function($ele) {
            $ele.hide();
            return $('.egame-jobs-img-3').show().animateCSS('flipInY');
        }).then(function() {
            return $('.egame-tapdot-3').show().animateCSS('slideInUp infinite', 2300);
        }).then(function($ele) {
            $ele.hide();
            return $('.egame-jobs-img-3').animateCSS('flipOutY');
        }).then(function($ele) {
            $ele.hide();
            return $('.egame-jobs-img-4').show().animateCSS('flipInY');
        }).then(function() {
            return $('.egame-tapdot-4').show().animateCSS('slideInUp infinite', 2300);
        }).then(function($ele) {
            $ele.hide();
            return $('.egame-jobs-img-4').animateCSS('flipOutY');
        }).then(function($ele) {
            $ele.hide();
            return $('.egame-jobs-img-1').show().animateCSS('flipInY');
        }).then(egameAnimate);
    }
    function upinAnimate() {
        $('.upin-tapdot-1').show().animateCSS('slideInUp infinite', 2500).then(function($ele) {
            $ele.hide();
            return $('.upin-jobs-img-1').animateCSS('fadeOutRight');
        }).then(function($ele) {
            $ele.hide();
            return $('.upin-jobs-img-2').show().animateCSS('fadeInLeft');
        }).then(function() {
            return $('.upin-tapdot-2').show().animateCSS('slideInUp infinite', 2500);
        }).then(function($ele) {
            $ele.hide();
            return $('.upin-jobs-img-2').animateCSS('fadeOutRight');
        }).then(function($ele) {
            $ele.hide();
            return $('.upin-jobs-img-3').show().animateCSS('fadeInLeft');
        }).then(function() {
            return $('.upin-tapdot-3').show().animateCSS('slideInUp infinite', 2500);
        }).then(function($ele) {
            $ele.hide();
            return $('.upin-jobs-img-3').animateCSS('fadeOutRight');
        }).then(function($ele) {
            $ele.hide();
            return $('.upin-jobs-img-4').show().animateCSS('fadeInLeft');
        }).then(function() {
            return $('.upin-tapdot-4').show().animateCSS('slideInUp infinite', 2500);
        }).then(function($ele) {
            $ele.hide();
            return $('.upin-jobs-img-4').animateCSS('fadeOutRight');
        }).then(function($ele) {
            $ele.hide();
            return $('.upin-jobs-img-1').show().animateCSS('fadeInLeft');
        }).then(upinAnimate);
    }
    qqgameAnimate();
    egameAnimate();
    upinAnimate();
})();
