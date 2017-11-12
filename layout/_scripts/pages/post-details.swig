<script type="text/javascript" src="{{ url_for(theme.js) }}/src/scrollspy.js?v={{ theme.version }}"></script>
<script type="text/javascript" src="{{ url_for(theme.js) }}/src/post-details.js?v={{ theme.version }}"></script>
{% if page.post_bootom !== false and theme.custom_setting.post_bottom_enable %}
  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/post-bottom.js?v={{ theme.version }}"></script>
{% endif %}