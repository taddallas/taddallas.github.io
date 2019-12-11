---
layout: empty
title: People
description: 
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

{% for z in site.data.people %}
{% include person.html %}
{% endfor %}

</body>

