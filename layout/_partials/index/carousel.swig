<div id="carousel-index" class="carousel slide show" data-ride="carousel" data-interval="{{ theme.carousel.interval }}">
    <ol class="carousel-indicators">
    {% for image in theme.carousel.images %}
        <li data-target="#carousel-index" data-slide-to="{{ loop.index-1 }}" {% if loop.first %}class="active"{% endif %}></li>
    {% endfor %}
    </ol>
    <div class="carousel-inner align-items-center" role="listbox">
    {% for image in theme.carousel.images %}
        {% if loop.first %}<div class="carousel-item active">{% else %}<div class="carousel-item">{% endif %}
            <a href="{{ url_for(image.href) }}" target="_blank"><img src="{{ url_for('images/carousel/'+image.src) }}" alt="{{ image.alt }}" width="100%"></a>
        </div>
    {% endfor %}
    </div>
    <a class="left carousel-control" href="#carousel-index" role="button" data-slide="prev">
    <span class="icon-prev" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-index" role="button" data-slide="next">
    <span class="icon-next" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
    </a>
</div>