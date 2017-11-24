{# 导航头部 #}
<nav id="mainNav" class="main-nav navbar navbar-expand-lg navbar-light">
    <div class="container">
        <!-- Title && Logo -->
        <a class="navbar-brand" href="{{ config.root }}">
            {{ config.title }}
        </a>
        <!-- SEO Site Subtitle -->
        <div class="d-none">
            {% if theme.seo %}
                <h1 class="site-subtitle" itemprop="description">{{ config.subtitle }}</h1>
            {% else %}
                <p class="site-subtitle">{{ config.subtitle }}</p>
            {% endif %}
        </div>
        <!--Navbar Toggler-->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <!--Navbar Collapse-->
        
        {% if theme.menu %}
        <div id="navbar-collapse" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                {% for name, path in theme.menu %}
                    {% set itemName = name.toLowerCase() %}
                    <li class="menu-item-{{ itemName | replace(' ', '-') }} nav-item {#
                    #}{% if page.path.split('/')[0] == name %}active{% endif %}{#
                    #}{% if page.path.split('/')[0] == 'index.html' && name == 'home' %}active{% endif %}{#
                    #}{% if page.path.split('/')[0] == 'categories' && page.path.split('/')[1] == '开源' &&name == 'opensource' %}active{% endif %}{#
                    #}">
                        <a class="nav-link" href="{{ url_for(path.split('||')[0]) | trim }}" rel="section">
                            {% if theme.menu_icons.enable %}
                            <i class="menu-item-icon fa fa-fw fa-{{ path.split('||')[1] | trim | default('question-circle') }}"></i> <br />
                            {% endif %}
                            {{ __('menu.' + name) | replace('menu.', '') }}
                        </a>
                    </li>
                {% endfor %}      
            </ul>
            <!--Search-->
            {% set hasSearch = theme.swiftype_key || theme.algolia_search.enable || theme.tinysou_Key || theme.local_search.enable %}
            {% if hasSearch %}
                <div class="site-search">
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form> 
                    {% include 'search.swig' %}
                </div>
            {% endif %}
        </div>
        {% endif %}
    </div>
</nav>
{% include '../_custom/header.swig' %}
