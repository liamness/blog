# [liamness.co.uk](https://liamness.co.uk)

This is the source for my blog. It uses the static site generator [
jekyll](https://jekyllrb.com) to generate the html, and a bunch of patched-together node cli tools to do everything else.

## Getting Started

Install docker and yarn somehow. Then do these things:

```bash
docker build -t html-builder .
yarn build
```

## To Do

Need to make a more development-friendly build process, with hot reloading etc
