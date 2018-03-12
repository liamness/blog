#!/bin/bash
set -e

# Run in container to get around permissions issues
docker-compose run node-service bash -c "
  rm -rf public/posts
  rm -f public/svg/*.svg
  rm -f public/*.js
  rm -f public/*.css
  find public -name *.html ! -name google*.html -delete
"
