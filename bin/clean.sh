#!/bin/bash
set -e

rm -rf public/posts
rm -f public/svg/*.svg
rm -f public/*.js
rm -f public/*.css
find public -name *.html ! -name google*.html -delete
