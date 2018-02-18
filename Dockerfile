FROM jekyll/jekyll:3.7.2

RUN mkdir -p /usr/src/blog

WORKDIR /usr/src/blog

RUN chown -R jekyll /usr/src/blog
