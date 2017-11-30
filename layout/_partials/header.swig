{# 导航头部 #}
<nav id="mainNav" class="main-nav navbar navbar-expand-lg navbar-light">
    <div class="container">
        <!-- Title && Logo -->
        <a class="navbar-brand" href="{{ config.root }}">
            {{ config.title }}
        </a>
        <!--Navbar Collapse-->
        {% if theme.menu %}
        <div id="navbar-collapse" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                {% for name, path in theme.menu %}
                    {% set itemName = name.toLowerCase() %}
                    <li class="menu-item-{{ itemName | replace(' ', '-') }} nav-item">
                        <a class="nav-link" href="{{ url_for(path.split('||')[0]) | trim }}" rel="section">
                            {{ __('menu.' + name) | replace('menu.', '') }}
                        </a>
                    </li>
                {% endfor %}      
                <li class="menu-item-qrcode nav-item">
                    <a>
                        <img src="{{ url_for(theme.qrcode.image) }}" alt="" width="25px" height="25px" />
                    </a>
                    <div></div>
                </li>
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
