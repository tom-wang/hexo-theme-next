<div class="container">
    <div class="row">
        <!-- 友情链接 -->
        <div class="col-md-10 col-xs-12 col-sm-12">
            <div>
                <a class="sm-logo" href="#">
                    <img src="{{ url_for(theme.custom_logo.image) }}" alt="" width="100%">
                </a>
            </div>

            <div class="fri-link">
                <ul class="nav">
                    <li>友情链接</li>
                    {% for name,link in theme.links %}
                    <li><a href="{{ link }}" target="_blank">{{ name }}</a></li>
                    {% endfor %}
                </ul>
            </div>

            <div class="copyright">{#
            #}{% set current = date(Date.now(), "YYYY") %}{#
            #}Copyright &copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} - {% endif %}{#
            #}{{ current }} Tencent Inc. All Rights Reserved.
            </div>
        </div>

        <!-- 二维码 -->
        <div class="col-md-2 d-none d-md-block">
            <div class="sm-qrcode square-ph">
                <div>
                    <img src="{{ url_for(theme.footer.qrcode) }}" width="100%">
                </div>
            </div>
            <div class="text-center qrcode-desc">微信公众号：小时光茶社</div>
        </div>
    </div>
</div>