/**
 * 文章页公共底部
 * 读取PID项目配置渲染
 */
$(document).ready(function () {
    var pid = 236993;
    var url = '//imgcache.gtimg.cn/ACT/vip_act/act_data/' + pid + '.json.js';
    $.getScript(url, function () {
      try {
        var data = window['AMD_' + pid];
        tools.renderHTML(data);
      } catch (e) {
        console.log('post-bottom.js', 'render fail', e);
      }
    });
  
    var $posts = $('#posts');
    var motionEnable = CONFIG.motion.enable;
    var tools = {
      id: 'post-bottom-wrapper',
      style: motionEnable ? 'style="opacity: 0;"' : '',
      renderHTML: function (data) {
        var cfg = data.form[1];
        var _html = ['<div ' + this.style + ' id="' + this.id + '">'];
        var _style = ['<style>'];
        $.each(cfg, function (index, item) {
          item.on && _html.push(item.html || "") && _style.push(item.style || "");
        });
        _html.push('</div>');
        _style.push('</style>');
        $posts.append('<!-- async bottom start -->' + _style.join('') + _html.join('') + '<!-- async bottom end -->');
        motionEnable && this.bootstrapMotion();
      },
      bootstrapMotion: function () {
        var $wrapper = $('#' + this.id);
        if (!$wrapper.length) {
          return;
        }
        var motionBottom = function (integrator) {
          if (CONFIG.motion.async) {
            //如果配置了同步动画，动画直接执行，瞬间一起展示
            integrator.next();
          }
          $wrapper.velocity('transition.flipBounceXIn', {
            display: null,
            duration: 600,
            complete: function () {
              integrator.next();//动画播放完毕，执行下一个动画
            }
          });
        }
        //动画添加进动画顺序队列
        NexT.motion.integrator.add(motionBottom);
        //触发动画队列的执行
        NexT.motion.integrator.bootstrap();
      }
    }
  });