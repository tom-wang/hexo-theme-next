{%
  set scripts = [
    'src/vas-common.js',
  ]
%}

{% for script in scripts %}
  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ script }}?v={{ theme.version }}"></script>
{% endfor %}
{% if page.type %}
<script type="text/javascript" src="{{ url_for(theme.js) }}/src/{{ page.type }}.js?v={{ theme.version }}"></script>
{% endif %}
