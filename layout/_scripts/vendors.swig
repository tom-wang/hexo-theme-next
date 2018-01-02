{% set js_vendors = {} %}
{% set js_vendors.jquery      = 'jquery/index.js?v=2.1.3' %}

{% if theme.canvas_nest %}
  {% set js_vendors.canvas_nest  = 'canvas-nest/canvas-nest.min.js' %}
{% endif %}

{% if theme.three_waves %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.three_waves  = 'three/three-waves.min.js' %}
{% endif %}

{% if theme.canvas_lines %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.canvas_lines  = 'three/canvas_lines.min.js' %}
{% endif %}

{% if theme.canvas_sphere %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.canvas_sphere  = 'three/canvas_sphere.min.js' %}
{% endif %}

{% if theme.canvas_ribbon.enable and theme.scheme === 'Pisces'%}
  {% set js_vendors.canvas_ribbon  = 'canvas-ribbon/canvas-ribbon.js' %}
{% endif %}

{% for name, internal in js_vendors %}
  {% set internal_script = url_for(theme.vendors._internal) + '/' + internal %}
  {% if name == 'canvas_ribbon' %}
    <script id="ribbon" type="text/javascript" size="{{ theme.canvas_ribbon.size }}" alpha="{{ theme.canvas_ribbon.alpha }}"  zIndex="{{theme.canvas_ribbon.zIndex }}" src="{{ theme.vendors[name] | default(internal_script) }}"></script>
  {% else %}
    <script type="text/javascript" src="{{ theme.vendors[name] | default(internal_script) }}"></script>
  {% endif %}
{% endfor %}
