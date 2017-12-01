<div class="row container-mod">
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mod-side-sec products">
            <div class="mod-side-sec-hd">
                <h2>开源组件</h2>
            </div>
            <div class="mod-side-sec-bd">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <div class="swiper-slide">Slide 1</div>
                        <div class="swiper-slide">Slide 2</div>
                        <div class="swiper-slide">Slide 3</div>
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
                    <li><a href="//isux.tencent.com/" target="_blank" title="ISUX">ISUX</a></li>
                    <li><a href="//tgideas.qq.com//" target="_blank" title="TGIdeas">TGIdeas</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row col-lg-9 col-md-6 col-sm-12">
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
        <!-- 左图右文 -->
        {% for post in page.posts %} 
        <div class="mb-3 col-lg-4 col-md-6 col-sm-12 post-item">
            <a href="{{ url_for(post.path) }}">
                <div class="row m-0 limg-rdesc">
                    <div class="col-12 post-thumb">
                        <div style="height:100%;background-size:cover;background-image:url({{ url_for(post.path+post.thumb) }})"></div>
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
        <!-- 分页 -->
        <nav class="pager">
            <a href="{{ url_for(page.prev_link) }}">上一页</a>
            <a href="{{ url_for(page.next_link) }}">下一页</a>
        </nav>
    </div>

</div>
