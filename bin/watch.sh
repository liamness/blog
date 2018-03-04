#!/bin/bash
set -e

function clean_up {
  kill $(jobs -p)
  exit
}

trap clean_up SIGINT

# Watch Javascript
webpack --mode development --watch &

# Watch CSS
function build_css {
  node-sass sass/blog.scss | \
    postcss -o public/blog.css
}

build_css

while
  inotifywait -qr -e close_write sass
do
  build_css
done &

# Watch SVGs
function build_svgs {
  svgstore icons/*.svg | \
    svgo -i - -o - --disable=cleanupIDs --disable=removeUselessDefs > public/svg/icons.svg
}

build_svgs

while
  inotifywait -qr -e close_write icons
do
  build_svgs
done &

# Watch HTML
docker run --rm -v ${PWD}:/usr/src/blog \
  html-builder jekyll build --source jekyll --destination public --watch &

# Start Server
browser-sync start --no-open --no-ui --no-notify --server 'public' --files 'public' &

wait
