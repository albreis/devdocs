#!/bin/bash
URL="https://docs.ersolucoesweb.com.br/"
exec 1> sitemap-index.xml
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<!-- generator="Milkys Sitemap Generator, https://github.com/mcmilk/sitemap-generator" -->'
echo '<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
for i in $(seq 1 430); do
  echo "<sitemap>"
  echo "<loc>${URL}/sitemaps/sitemap-${i}.xml</loc>"
  echo "</sitemap>"
done
echo "</sitemapindex>"