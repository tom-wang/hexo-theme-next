<div class="row">
    <div class="col-md-3 col-sm-12">
        <div class="mod-side-sec products">
            <div class="mod-side-sec-hd">
                <h2>开源组件</h2>
            </div>
            <div class="mod-side-sec-bd">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <div class="swiper-slide" style="background-image:url(/images/blog/vassonic_product.png)"></div>
                        <div class="swiper-slide" style="background-image:url(/images/blog/vassonic_product.png)"></div>
                        <div class="swiper-slide" style="background-image:url(/images/blog/vassonic_product.png)"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mod-side-sec archives">
            <div class="mod-side-sec-hd">
                <h2>归档</h2>
            </div>
            <div class="mod-side-sec-bd">
            {{
             list_archives({
                type: 'yearly'
             }) 
            }}
            </div>
        </div>
        <div class="mod-side-sec friendlinks">
            <div class="mod-side-sec-hd">
                <h2>友链</h2>
            </div>
            <div class="mod-side-sec-bd">
                <ul class="mod-side-list">
                    <li><a href="//isux.tencent.com/" title="ISUX">ISUX</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-9 col-sm-12">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm">
                    <nav class="cates">
                        <ul>
                            {% if page.category %}
                            <li class="cate-menu-item button"><a href="/" class="cate-menu-link">全部文章</a></li>
                            {% else %}
                            <li class="cate-menu-item active button"><a href="/" class="cate-menu-link">全部文章</a></li>
                            {% endif %}
                            {% for cat in site.categories %}
                                {% if cat.name === page.category %}
                                <li class="cate-menu-item active button"><a href="{{ url_for(cat.path) }}" class="cate-menu-link">{{ cat.name }}</a></li>
                                {% else %}
                                <li class="cate-menu-item button"><a href="{{ url_for(cat.path) }}" class="cate-menu-link">{{ cat.name }}</a></li>
                                {% endif %}
                            {% endfor %}
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="row">
                <!-- 左图右文 -->
                {% for post in page.posts %} 
                <div class="mb-3 col-lg-3 col-md-6 col-sm-12">
                    <a href="{{ url_for(post.path) }}">
                        <div class="row m-0 limg-rdesc">
                            <div class="col-12 post-thumb">
                                <div style="background-image:url({{ url_for(post.path+post.thumb) }})"></div>
                            </div>
                            <div class="col-12 my-auto text-left post-info">
                                <div>
                                    <div class="right-desc">
                                        <p class="line-num">{{ post.title }}</p>
                                        <p>by {{ post.author }} @{{ post.date|date('Y-m-d') }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                {% endfor %}
                <!-- 左图右文 -->
            </div>
        </div>
        <!-- 分页 -->
        <nav class="pager">
            <a href="{{ url_for(page.prev_link) }}">上一页</a>
            <a href="{{ url_for(page.next_link) }}">下一页</a>
        </nav>
    </div>

</div>
