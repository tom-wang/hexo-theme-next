{% macro render(is_post) %}
  {# 汉堡按钮 #}
  {#
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>
  #}
  <div class="col-md-3 d-none d-lg-block">
  <aside id="sidebar" class="sidebar">
    
    {# 移动端渲染#}
    {#
    {% if theme.sidebar.onmobile %}
      <div id="sidebar-dimmer"></div>
    {% endif %}
    #}

    <div class="sidebar-inner">

      {# 不显示！ 是否显示侧边栏顶部菜单 #}
      {% set display_toc = is_post and theme.toc.enable or is_page and theme.toc.enable %}
      {% if false and display_toc and toc(page.content).length > 1 %}
        <ul class="sidebar-nav motion-element">
          {# 文章目录 #}
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap">
            {{ __('sidebar.toc') }}
          </li>
          {# 站点概览 #}
          <li class="sidebar-nav-overview" data-target="site-overview-wrap">
            {{ __('sidebar.overview') }}
          </li>
        </ul>
      {% endif %}
      
      {# 不显示！ 站点概览 #}
      {% if false %}
      <section class="site-overview-wrap sidebar-panel{% if not display_toc or toc(page.content).length <= 1 %} sidebar-panel-active{% endif %}">
        <div class="site-overview">
          <div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">
            {% if theme.avatar %}
              <img class="site-author-image" itemprop="image"
                src="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}"
                alt="{{ theme.author }}" />
            {% endif %}
              <p class="site-author-name" itemprop="name">{{ theme.author }}</p>
              <p class="site-description motion-element" itemprop="description">{#
            #}{% if theme.seo %}{#
              #}{{ theme.signature }}{#
            #}{% else %}{#
              #}{{ theme.description }}{#
            #}{% endif %}{#
            #}</p>
          </div>

          <nav class="site-state motion-element">
            {% if config.archive_dir != '/' and site.posts.length > 0 %}
              <div class="site-state-item site-state-posts">
              {% if theme.menu.archives %}
                <a href="{{ url_for(theme.menu.archives).split('||')[0] | trim }}">
              {% else %}
                <a href="{{ url_for(config.archive_dir) }}">
              {% endif %}
                  <span class="site-state-item-count">{{ site.posts.length }}</span>
                  <span class="site-state-item-name">{{ __('state.posts') }}</span>
                </a>
              </div>
            {% endif %}

            {% if site.categories.length > 0 %}
              {% set categoriesPageQuery = site.pages.find({type: 'categories'}, {lean: true}) %}
              {% set hasCategoriesPage = categoriesPageQuery.length > 0 %}
              <div class="site-state-item site-state-categories">
                {% if hasCategoriesPage %}<a href="{{ url_for(categoriesPageQuery[0].path) }}">{% endif %}
                  <span class="site-state-item-count">{{ site.categories.length }}</span>
                  <span class="site-state-item-name">{{ __('state.categories') }}</span>
                {% if hasCategoriesPage %}</a>{% endif %}
              </div>
            {% endif %}

            {% if site.tags.length > 0 %}
              {% set tagsPageQuery = site.pages.find({type: 'tags'}, {lean: true}) %}
              {% set hasTagsPage = tagsPageQuery.length > 0 %}
              <div class="site-state-item site-state-tags">
                {% if hasTagsPage %}<a href="{{ url_for(tagsPageQuery[0].path) }}">{% endif %}
                  <span class="site-state-item-count">{{ site.tags.length }}</span>
                  <span class="site-state-item-name">{{ __('state.tags') }}</span>
                {% if hasTagsPage %}</a>{% endif %}
              </div>
            {% endif %}

          </nav>

          {% if theme.rss %}
            <div class="feed-link motion-element">
              <a href="{{ url_for(theme.rss) }}" rel="alternate">
                <i class="fa fa-rss"></i>
                RSS
              </a>
            </div>
          {% endif %}

          <div class="links-of-author motion-element">
            {% if theme.social %}
              {% for name, link in theme.social %}
                <span class="links-of-author-item">
                  <a href="{{ link.split('||')[0] | trim }}" target="_blank" title="{{ name }}">
                    {% if theme.social_icons.enable %}
                      <i class="fa fa-fw fa-{{ link.split('||')[1] | trim | default('globe') }}"></i>{#
                  #}{% endif %}{#
                    #}{% if not theme.social_icons.icons_only %}{#
                      #}{{ name }}{#
                    #}{% endif %}{#
                #}</a>
                </span>
              {% endfor %}
            {% endif %}
          </div>

          {% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'zero': 1} %}
          {% if theme.creative_commons in cc %}
            <div class="cc-license motion-element" itemprop="license">
              <a href="https://creativecommons.org/{% if theme.creative_commons === 'zero' %}publicdomain/zero/1.0{% else %}licenses/{{ theme.creative_commons }}/4.0{% endif %}/" class="cc-opacity" target="_blank">
                <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.svg" alt="Creative Commons" />
              </a>
            </div>
          {% endif %}

          {# Blogroll #}
          {% if theme.links %}
            <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.links_layout | default('inline') }}">
              <div class="links-of-blogroll-title">
                <i class="fa  fa-fw fa-{{ theme.links_icon | default('globe') | lower }}"></i>
                {{ theme.links_title }}
              </div>
              <ul class="links-of-blogroll-list">
                {% for name, link in theme.links %}
                  <li class="links-of-blogroll-item">
                    <a href="{{ link }}" title="{{ name }}" target="_blank">{{ name }}</a>
                  </li>
                {% endfor %}
              </ul>
            </div>
          {% endif %}

          {% include '../_custom/sidebar.swig' %}
        </div>
      </section>
      {% endif %}
      
      {# 不显示！ 文章目录 #}
      {% if false and display_toc and toc(page.content).length > 1 %}
      <!--noindex-->
        <section class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
          <div class="post-toc">
            {% if page.toc_number === undefined %}
              {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}
            {% else %}
              {% set toc = toc(page.content, { "class": "nav", list_number: page.toc_number }) %}
            {% endif %}

            {% if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {% endif %}

          </div>
        </section>
      <!--/noindex-->
      {% endif %}

      {# 不显示！ 回到顶部 #}
      {% if false and theme.sidebar.b2t %}
        <div class="back-to-top">
          <i class="fa fa-arrow-up"></i>
          {% if theme.sidebar.scrollpercent %} {# 显示浏览百分比 #}
            <span id="scrollpercent"><span>0</span>%</span>
          {% endif %}
        </div>
      {% endif %}
      
      {% for item in theme.sidebar.items %}
      <div class="sidebar-block motion-element">
        <div>{{ item.title }}</div>
        <div>
            <ul>
                {% for _item in site[item.type] %}
                {% if loop.index < 11 %}
				<li>
				    <a href="{{ url_for(_item.path) }}">{{ _item.title }}</a>
				</li>
                {% endif %}
                {% endfor %}
			</ul>
        </div>
      </div>
      {% endfor %}
      
    </div>
  </aside>
  </div>
{% endmacro %}
