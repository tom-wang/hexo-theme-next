<div class="row container-mod">
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="mod-side-sec products">
            <div class="mod-side-sec-hd">
                <h2>服务/产品</h2>
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
                <ul class="mod-side-list">
                  {% set year %}
                  {% set count = 0 %}
                  {% for post in page.posts %}
                    {# Show year #}
                    {% set post.year = date(post.date, 'YYYY') %}
                    {% if post.year !== year %}
                      {% if year %}
                          <li><a href="{{ url_for('archives/' + year) }}">{{ year }}（{{ count }}）</a></li>
                          {% set count = 0 %}
                      {% endif %}
                      {% set year = post.year %}
                    {% else %}
                      {% set count += 1 %}
                    {% endif %}
                    {# endshow #}
                  {% endfor %}
                  {% if year %}
                      <li><a href="{{ url_for('archives/' + year) }}">{{ year }}（{{ count }}）</a></li>
                  {% endif %}
                </ul>
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
                <li class="cate-menu-item active"><a href="/index.html" class="cate-menu-link">全部文章</a></li>
                <li class="cate-menu-item"><a href="/cates/Web开发/index.html" class="cate-menu-link">Web开发</a></li>
                <li class="cate-menu-item"><a href="/cates/移动开发/index.html" class="cate-menu-link">移动开发</a></li>
                <li class="cate-menu-item"><a href="/cates/H5游戏开发/index.html" class="cate-menu-link">后台技术</a></li>
            </ul>
        </nav>
        <!-- 左图右文 -->
        {% for post in page.posts %} 
        {% if loop.index <= 600 %}
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

</div>
