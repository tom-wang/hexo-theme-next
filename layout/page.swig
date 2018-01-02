{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/category-nav.swig' as category_nav_template %}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{% block page_class %}page-post-detail{% endblock %}

{% block content %}

  <div id="posts" class="posts-expand2">
    {##################}
    {### PAGE BLOCK ###}
    {##################}
    <div class="post-block page">

      {# 文章头：标题 #}
      {#{% include '_partials/page-header.swig' %}#}
      {# 文章头：标题 #}

      {#################}
      {### PAGE BODY ###}
      {#################}
      {#<div class="post-body{% if theme.han %} han-init-context{% endif %}{% if page.direction && page.direction.toLowerCase() === 'rtl' %} rtl{% endif %}">#}        {# tagcloud page support #}
      <div class="post-body">
        {% if page.type === "tags" %}
          <div class="tag-cloud">
            <div class="tag-cloud-title">
                {{ _p('counter.tag_cloud', site.tags.length) }}
            </div>
            <div class="tag-cloud-tags">
              {{ tagcloud({min_font: 12, max_font: 30, amount: 300, color: true, start_color: '#ccc', end_color: '#111'}) }}
            </div>
          </div>
        {% elif page.type === 'categories' %}
          <div class="category-all-page">
            <div class="category-all-title">
                {{ _p('counter.categories', site.categories.length) }}
            </div>
            <div class="category-all">
              {{ list_categories() }}
            </div>
          </div>
        {% elif page.type === 'posts' %}
          {# 所有文章分类 #}
          {{ category_nav_template.render(page) }}
          <div class="row post-layout">
            {% for post in site.posts %}
                {{ post_template.render(post) }}
            {% endfor %}
		  </div>
        {% elif page.type === 'jobs' %}
          {% include '_partials/jobs/index.swig' %}
        {% elif page.type === 'about' %}
          {% include '_partials/about/index.swig' %}
        {% else %}
          {{ page.content }}
        {% endif %}
      </div>
      {#####################}
      {### END PAGE BODY ###}
      {#####################}
    </div>
    {######################}
    {### END PAGE BLOCK ###}
    {######################}
  </div>

{% endblock %}

{#
{% block sidebar %}
  {% if page.sidebar !== false %}
  {{ sidebar_template.render(false) }}
  {% endif %}
{% endblock %}
#}
{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}
