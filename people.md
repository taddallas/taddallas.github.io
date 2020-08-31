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

<h1> Lab members </h1>

{% for z in site.data.people %}
{% include person.html %}
{% endfor %}



<h1> Alumni </h1>
{% for q in site.data.alumni %}
{% include alumni.html %}
{% endfor %}


</body>

