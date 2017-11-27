<div class="text-center row container-mod">
    <div class="row col-lg-9 col-md-6 col-sm-12">
        <!-- 左图右文 -->
        {% for post in page.posts %} 
        {% if loop.index <= 600 %}
        <div class="mb-3 col-lg-4 col-md-6 col-sm-12">
            <a href="{{ url_for(post.path) }}">
                <div class="row m-0 limg-rdesc">
                    <div class="col-12 post-thumb">
                        <div style="height:100%;background-size:cover;background-image:url({{ url_for(post.path+post.thumb) }})"></div>
                    </div>
                    <div class="col-12 my-auto text-left post-info">
                        <div>
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
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12">
    hello
    </div>
</div>
