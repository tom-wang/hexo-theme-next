{% macro render(post) %}
    <div class="col-md-6">
        <a href="{{ url_for(post.path or post.link) }}" itemprop="url">
            <div class="rect-ph rect-ph-30" style="background-size:cover;background-image:url({{ url_for(post.path+post.thumb) }})">
                <div></div>
            </div>
            <div class="post-layout-text">
                <p class="line-num">{{ (post.title or post.link)| default(__('post.untitled')) }}</p>
                <p>
                    {% for i,cat in post.categories %}
                        {% if loop.first %}
                        <a class="c-2bb494" href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
                        {% endif %}
                    {% endfor %} 
                    <span datetime="{{ moment(post.date).format() }}" content="{{ date(post.date, config.date_format) }}">{{ date(post.date, 'MM-DD') }}</span>
                </p>
            </div>
        </a>
    </div>
{#
  <article class="post post-type-{{ post.type | default('normal') }}" itemscope itemtype="http://schema.org/Article">
    <header class="post-header">

      <{% if theme.seo %}h3{% else %}h2{% endif %} class="post-title">
        {% if post.link %}
          <a class="post-title-link post-title-link-external" 
          target="_blank" 
          href="{{ url_for(post.link) }}" itemprop="url">
            {{ post.title or post.link }}
            <i class="fa fa-external-link"></i>
          </a>
        {% else %}
            <a class="post-title-link" href="{{ url_for(post.path) }}" itemprop="url">
              {% if post.type === 'picture' %}
                {{ post.content }}
              {% else %}
                <span itemprop="name">{{ post.title | default(__('post.untitled')) }}</span>
              {% endif %}
            </a>
        {% endif %}
      </{% if theme.seo %}h3{% else %}h2{% endif %}>

      <div class="post-meta">
        <time class="post-time" itemprop="dateCreated"
              datetime="{{ moment(post.date).format() }}"
              content="{{ date(post.date, config.date_format) }}" >
          {{ date(post.date, 'MM-DD') }}
        </time>
      </div>

    </header>
  </article>
#}
{% endmacro %}
