#!/bin/bash
set -e

# Build Javascript
webpack --mode production &

# Build CSS
node-sass sass/blog.scss |
postcss -o public/blog.css &

# Build SVGs
svgstore icons/*.svg | \
svgo -i - -o - --disable=cleanupIDs --disable=removeUselessDefs > public/icons.svg &

# Wait for all those things to finish
for job in `jobs -p`
do
    wait $job
done
