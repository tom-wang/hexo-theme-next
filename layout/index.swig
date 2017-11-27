{# index.html #}

{% extends '_layout.swig' %}

{# 渲染文章post #}
{% import '_macro/post.swig' as post_template %}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{# 追加容器类名 #}
{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{# 正文外区域 #}
{% block out_content %}
  <section id="index-post">
    {% include '_partials/index/post.swig' %}
  </section>
  <section id="blog">
    {% include '_partials/index/blog.swig' %}
  </section>
{% endblock %}
