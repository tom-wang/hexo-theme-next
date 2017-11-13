{% if theme.index_blog.enabled %}
<div class="text-center row container-mod">
    <div class="col-12 title-center-container">
        <h3 class="main-title">博客</h3>
        <span class="sub-title">Blog</span>
    </div>
    
    <!-- 左图右文 -->
    {# |groupBy('key') is invalid #}
    {% for post in page.posts %} 
    {% if loop.index <= 6 %}
    <div class="mb-3 col-lg-4 col-md-6 col-sm-12">
        <a href="{{ url_for(post.path) }}" target="_blank">
            <div class="row m-0 limg-rdesc">
                <div class="col-4 m-auto">
                    {% if post.thumb %}
                    <div class="square-ph" style="background-size:cover;background-image:url({{ url_for(post.path+post.thumb) }})">
                    {% else %}
                    <div class="square-ph">
                    {% endif %}
                        <div>
                        </div>
                    </div>
                </div>
                <div class="col-8 pl-0 my-auto text-left">
                    <div class="rect-ph">
                        <div class="right-desc">
                            <p class="line-num">{{ post.title }}</p>
                            <p>
                            {% for i,cat in post.categories %}
                                {% if loop.first %}
                                {{ cat.name }}
                                {# <label class="label-hollow label-hollow-gray"></label> #}
                                {% endif %}
                            {% endfor %}
                            <span>{{ post.date|date('Y-m-d') }}</span>
                            </p>
                            <p>{{ post.author }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    {% endif %}
    {% endfor %}
    <!-- 左图右文 -->

    {#
    <!-- 左图右文 -->
    {% for image in theme.index_blog.images %} 
    <div class="mb-3 col-lg-4 col-md-6 col-sm-12">
        <a href="{{ url_for(image.href) }}" target="_blank">
            <div class="row m-0 limg-rdesc">
                <div class="col-4 m-auto">
                    <div class="square-ph">
                        <div>
                            <img src="{{ url_for('images/blog/'+image.src) }}" alt="{{ image.title }}" width="100%">
                        </div>
                    </div>
                </div>
                <div class="col-8 pl-0 my-auto text-left">
                    <div class="rect-ph">
                        <div class="right-desc">
                            <p class="line-num">{{ image.title }}</p>
                            <p>{{ image.tag }}<span>{{ image.date }}</span></p>
                            <p>{{ image.author }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    {% endfor %}
    <!-- 左图右文 -->
    #}

    <div class="col-12 more_plus_wrapper">
        <a href="{{ url_for('posts') }}">
            <div class="more_plus"><span>MORE</span></div>
        </a>
    </div>
</div>
{% endif %}