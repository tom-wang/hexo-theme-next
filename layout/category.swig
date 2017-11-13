{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/category-nav.swig' as category_nav_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}


{% block title %}{{ __('title.category') }}: {{ page.category }} | {{ config.title }}{% endblock %}

{% block content %}

  {######################}
  {### CATEGORY BLOCK ###}
  {######################}
  <div class="post-block category">
    <div id="posts">
        {# 分类导航 #}
        {{ category_nav_template.render(page) }}
        {# 文章渲染 #}
        <div class="row post-layout">
            {% for post in page.posts %}
                {{ post_template.render(post) }}
            {% endfor %}
		</div>
    </div>

    {#
    <div id="posts" class="posts-collapse">
      <div class="collection-title">
        <{% if theme.seo %}h2{% else %}h1{% endif %}>
        {{ page.category }}
        <small>{{  __('title.category')  }}</small>
        </{% if theme.seo %}h2{% else %}h1{% endif %}>
      </div>

      {% for post in page.posts %}
        {{ post_template.render(post) }}
      {% endfor %}
    </div>
    #}
  </div>
  {##########################}
  {### END CATEGORY BLOCK ###}
  {##########################}

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
