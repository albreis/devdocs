#!/bin/bash

# url configuration
URL="https://docs.ersolucoesweb.com.br/"

# values: always hourly daily weekly monthly yearly never
FREQ="weekly"

# begin new sitemap
exec 1> sitemap.xml

# print head
echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<!-- generator="Milkys Sitemap Generator, https://github.com/mcmilk/sitemap-generator" -->'
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'

# print urls
IFS=$'\r\n'
find docs -type f | \
while read -r line; do
  DATE=$(date)
  FILE=$(echo "$line" | cut -c 6-900)
  FILE=$(echo "$FILE" | sed s/".html"//)
  echo "<url>"
  echo " <loc>${URL}${FILE}</loc>"
  echo " <lastmod>$DATE</lastmod>"
  echo " <changefreq>$FREQ</changefreq>"
  echo "</url>"
done

# print foot
echo "</urlset>"