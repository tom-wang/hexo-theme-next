/* global NexT: true */

$(document).ready(function () {

  $(document).trigger('bootstrap:before');

  NexT.utils.isMobile() && window.FastClick.attach(document.body);

  NexT.utils.lazyLoadPostsImages();

  NexT.utils.registerESCKeyEvent();

  //绑定$('.back-to-top')回到顶部事件  
  NexT.utils.registerBackToTop();

  //低分辨率下的汉堡菜单切换动画 Mobile top menu bar.
  /*  
  $('.site-nav-toggle button').on('click', function () {
    var $siteNav = $('.site-nav');//菜单面板
    var ON_CLASS_NAME = 'site-nav-on'; //展开/收缩
    var isSiteNavOn = $siteNav.hasClass(ON_CLASS_NAME);
    var animateAction = isSiteNavOn ? 'slideUp' : 'slideDown';
    var animateCallback = isSiteNavOn ? 'removeClass' : 'addClass';

    $siteNav.stop()[animateAction]('fast', function () {
      $siteNav[animateCallback](ON_CLASS_NAME);
    });
  });
  */  

  /**
   * Register JS handlers by condition option.
   * Need to add config option in Front-End at 'layout/_partials/head.swig' file.
   */
  CONFIG.fancybox && NexT.utils.wrapImageWithFancyBox();//图片查看插件
  CONFIG.tabs && NexT.utils.registerTabsTag();//Tab单页切换

  NexT.utils.embeddedVideoTransformer();
  NexT.utils.addActiveClassToMenuItem();


  // Define Motion Sequence.
  // 动画顺序（定义 \source\js\src\motion.js）
  //NexT.motion.integrator
  //  .add(NexT.motion.middleWares.logo)
  //  .add(NexT.motion.middleWares.menu)
  //  .add(NexT.motion.middleWares.carousel)
  //  .add(NexT.motion.middleWares.blog)  
  //  .add(NexT.motion.middleWares.postList)
  //  .add(NexT.motion.middleWares.sidebar);

  $(document).trigger('motion:before');

  // Bootstrap Motion.
  // 触发动画  
  CONFIG.motion.enable && NexT.motion.integrator.bootstrap();

  $(document).trigger('bootstrap:after');
});
