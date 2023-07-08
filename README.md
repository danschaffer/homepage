## Source for danschaffer.info

# technologies
- written in [jekyll](https://jekyllrb.com/)
- theme is [Hally](https://jekyllthemes.io/theme/hally-masonry-jekyll-theme)

# local development

- to build the page locally run
```
docker build -t jekyll .
docker run jekyll -v $(pwd):/app jekyll
```

- to run locally
```
docker build -t jekyll .
docker run -p 4000:4000 -v $(pwd):/app jekyll bundle exec jekyll serve --host 0.0.0.0
```
- then browse to or open [https://localhost:4000](https://localhost:4000)

# adding content
- for a post create
- Each entry uses markdown, I find this page useful for [markdown cheatsheet](https://learn-the-web.algonquindesign.ca/topics/markdown-yaml-cheat-sheet/#yaml)

# hosted
- the page is hosted on aws: as [https://danschaffer.info](https://danschaffer.info)
- to sync 
```
cd _site
aws s3 sync . s3://www.danschaffer.info
aws cloudfront create-invalidation --distribution-id E1IJN3GI590RST --paths "/*"
```
