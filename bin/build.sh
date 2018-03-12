#!/bin/bash
set -e

# Build Javascript
docker-compose run --rm node-service yarn run bash -c "./bin/build-node.sh"

# Build HTML
docker-compose run --rm \
  -e JS_MD5="$(md5sum public/blog.js | cut -c1-32)" \
  -e CSS_MD5="$(md5sum public/blog.css | cut -c1-32)" \
  -e SVG_MD5="$(md5sum public/svg/icons.svg | cut -c1-32)" \
  jekyll-service jekyll build

docker-compose run --rm node-service yarn run bash -c "
  html-minifier -c html-minifier.conf --input-dir _site --output-dir public
"
