{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}


{% block title %}{{ page.title }} | {{ config.title }}{% endblock %}

{% block page_class %}page-post-detail{% endblock %}


{% block content %}

  <div id="posts" class="posts-expand">
    
    <div class="row">
        {% if theme.sidebar.enable %}
        <div class="col-lg-9">
            {#渲染文章#}
            {{ post_template.render(page) }}
        </div>
        {#<div class="col-md-3 d-none d-lg-block p-0">#}
            {# 展示侧边栏 #}
            {% block sidebar %}
                {{ sidebar_template.render(true) }}
            {% endblock %}
        {#</div>#}
        {% else %}
        <div class="col-12">
            {#渲染文章#}
            {{ post_template.render(page) }}
        </div>
        {% endif %}
    </div>

    {#渲染文章#}
    {#{{ post_template.render(page) }}#}

    {#额外配置渲染#}
    <div class="post-spread">
      {% if theme.jiathis %}
        {% include '_partials/share/jiathis.swig' %}
      {% elseif theme.baidushare %}
        {% include '_partials/share/baidushare.swig' %}
      {% elseif theme.add_this_id %}
        {% include '_partials/share/add-this.swig' %}
      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}
        {% include '_partials/share/duoshuo_share.swig' %}
      {% endif %}
    </div>
  </div>

{% endblock %}

{#
{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}
#}

{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}
