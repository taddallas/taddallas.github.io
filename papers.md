---
layout: empty
title: Papers
description: Scientific currency
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

{% for p in site.data.papers %}
{% include paper.html %}
{% endfor %}

</body>
