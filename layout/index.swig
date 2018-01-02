{# index.html #}

{% extends '_layout.swig' %}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{# 追加容器类名 #}
{% block page_class %}
  {% if true %}page-home{% endif -%}
{% endblock %}

{% block script_extra %}
<script type="text/javascript" src="{{ url_for(theme.vendors._internal) + '/imagesloaded/imagesloaded.pkgd.min.js?v=2.1.3' }}"></script>
<script type="text/javascript" src="{{ url_for(theme.vendors._internal) + '/masonry/masonry.pkgd.min.js?v=2.1.3' }}"></script>
<script type="text/javascript" src="{{ url_for(theme.vendors._internal) + '/swiper/swiper.min.js?v=2.1.3' }}"></script>
{#
<script type="text/javascript" src="{{ url_for(theme.vendors._internal) + '/anime/anime.min.js?v=2.1.3' }}"></script>
<script type="text/javascript" src="{{ url_for(theme.js) + '/src/schemes/fireworks.js?v=2.1.3' }}"></script>
<script type="text/javascript" src="{{ url_for(theme.js) + '/src/schemes/index.js?v=2.1.3' }}"></script>
#}
{% endblock %}

{# 正文外区域 #}
{% block out_content %}
  <section id="blog">
    {% include '_partials/index/blog.swig' %}
  </section>
{% endblock %}
