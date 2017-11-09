{% if theme.index_opensource.enabled %}
<div class="row container-mod">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center text-md-left">
        <h3 class="main-title">开源项目</h3>
        <span class="sub-title cut-line-bottom">OpenSource</span>
        <p class="desc"></p>
    </div>

    <div class="col-md-8 col-sm-12 col-xs-12">
        <div class="row m-md-0 double-row">
            {% for image in theme.index_opensource.images %}
                <div class="pl-sm-3 mb-3 col-md-6 col-sm-12 col-xs-12">
                    <div class="rect-ph">
                        <div>
                            <a href="{{ image.href }}" target="_blank"><img src="{{ url_for('images/opensource/'+image.src) }}" alt="{{ image.alt }}" width="100%"></a>
                        </div>
                    </div>
                </div>
            {% endfor %}
        </div>
    </div>
    <div class="col-12">
        <a href="{{ url_for('opensource') }}">
            <div class="more_plus"><span>MORE</span></div>
        </a>
    </div>
</div>
{% endif %}