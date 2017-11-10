{% if theme.index_blog.enabled %}
<div class="text-center row container-mod">
    <div class="col-12 title-center-container">
        <h3 class="main-title">博客</h3>
        <span class="sub-title">Blog</span>
    </div>
    
    <!-- 左图右文 -->
    {# |groupBy('key') is invalid #}
    {#
    {% for post in page.posts %} 
    {% if post.index_show_order>0 %}
    <div class="mb-3 col-lg-4 col-md-6 col-sm-12" data-order="{{ post.index_show_order }}">
        <div class="row m-0 limg-rdesc">
            <div class="col-4 m-auto">
                <div class="square-ph">
                    <div>
                        <a href="{{ url_for(post.path) }}" target="_blank"><img src="{{ url_for('images/blog/'+post.index_show_img) }}" alt="{{ post.title }}" width="100%"></a>
                    </div>
                </div>
            </div>
            <div class="col-8 pl-0 my-auto text-left">
                <div class="rect-ph">
                    <div class="right-desc">
                        <p class="line-num">{{ post.title }}</p>
                        <p>{{ post.categories|first }}<span>{{ post.date|date('Y-m-d') }}</span></p>
                        <p>{{ post.author }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {% endif %}
    {% endfor %}#}
    <!-- 左图右文 -->

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

    <div class="col-12 more_plus_wrapper">
        <a href="{{ url_for('blog') }}">
            <div class="more_plus"><span>MORE</span></div>
        </a>
    </div>
</div>
{% endif %}