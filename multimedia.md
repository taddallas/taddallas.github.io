---
layout: empty
title: Multimedia
description: Videos and such
---

<head>
   {% include header.html %}
</head>

<body>
  <div class="top-bar pure-menu pure-menu-open pure-menu-horizontal">
     {% include nav.html %}
  </div>

<br/>
<br/>
<br/>
<br/>


{% for p in site.data.multimedia %}
{% include multimedia.html %}
{% endfor %}

</body>
