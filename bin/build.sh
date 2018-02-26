#!/bin/bash
set -e

# Build Javascript
webpack --mode production

# Build CSS
node-sass sass/blog.scss | \
  postcss -o public/blog.css

# Build SVGs
svgstore icons/*.svg | \
  svgo -i - -o - --disable=cleanupIDs --disable=removeUselessDefs > public/svg/icons.svg

# Build HTML
docker run --rm -v ${PWD}/jekyll:/usr/src/blog \
  -e JS_MD5="$(md5sum public/blog.js | cut -c1-32)" \
  -e CSS_MD5="$(md5sum public/blog.css | cut -c1-32)" \
  -e SVG_MD5="$(md5sum public/svg/icons.svg | cut -c1-32)" \
  html-builder jekyll build && \
  html-minifier -c html-minifier.conf --input-dir jekyll/_site --output-dir public
