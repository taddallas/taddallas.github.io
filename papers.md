---
layout: base
title: Papers
description: Scientific currency
---

{% for p in site.data.papers %}
{% include paper.html %}
{% endfor %}
