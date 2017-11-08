{% extends '_layout.swig' %}
{# 渲染文章post #}
{% import '_macro/post.swig' as post_template %}
{# 渲染侧边栏sidebar #}
{#{% import '_macro/sidebar.swig' as sidebar_template %}#}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{# 追加容器类名 #}
{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{# 正文外区域 #}
{% block out_content %}
  <section id="carousel">
    {% include '_partials/index/carousel.swig' %}
  </section>
{% endblock %}

{# 正文内区域 #}
{% block content %}
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
      {{ post_template.render(post, true) }}
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}
{#
{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
#}
