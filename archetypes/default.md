---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
url: "{{.File.BaseFileName}}"
---

