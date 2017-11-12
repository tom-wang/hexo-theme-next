{% macro render(page) %}
    {# 分类导航 #}
    <div class="row">
        <ul class="nav">
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle category-nav" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <{% if theme.seo %}h2{% else %}h1{% endif %} class="d-none">
                {{  __('title.category')  }} - {{ page.category or '全部' }}
                </{% if theme.seo %}h2{% else %}h1{% endif %}>
                {{  __('title.category')  }} - {{ page.category or '全部' }}
            </a>
            {% if site.categories.length>0 %}
            <div class="dropdown-menu">
                {% for cat in site.categories %}
                    <a class="dropdown-item" href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
                {% endfor %}
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="{{ url_for('posts') }}">全部</a>
            </div>
            {% endif %}
            </li>
        </ul>
    </div>
{% endmacro %}
