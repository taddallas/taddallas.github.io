---
layout: empty
title: People
description: 
---

<head>
   {% include header.html %}
</head>

<style>
.container2{
    width:100%;
    display:block;
    font-size:0;
}
</style>



<body>

<div class="top-bar pure-menu pure-menu-open pure-menu-horizontal">
  {% include nav.html %}
</div>


<br/>
<br/>

<h1> Lab members </h1>

{% for z in site.data.people %}
{% include person.html %}
{% endfor %}

<br/>
<br/>


<h1> Helminth team </h1>

<br/>
<br/>



<div class="container2">
{% for a in site.data.worm %}
{% include worm.html %}
{% endfor %}
</div>





<br/>
<br/>


<h1> Alumni </h1>
{% for q in site.data.alumni %}
{% include alumni.html %}
{% endfor %}


</body>

