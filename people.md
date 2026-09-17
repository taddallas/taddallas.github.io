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

<main class="page-shell page-shell--wide">
  <h1 class="page-title">Lab members</h1>

  {% for z in site.data.people %}
  {% include person.html %}
  {% endfor %}

  <h1 class="page-title">Helminth team</h1>

  <div class="team-grid">
  {% for a in site.data.worm %}
  {% include worm.html %}
  {% endfor %}
  </div>

  <h1 class="page-title">Alumni</h1>
  {% for q in site.data.alumni %}
  {% include alumni.html %}
  {% endfor %}
</main>


</body>
