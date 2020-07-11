---
title:  Jekyll themes
date:   2019-11-09 13:30:00 -0400
layout: post
image: /images/jekyll.png
tags: Jekyll
---
I wanted to configure a jekyll theme besides minima to get more functionality.  I found most themes did not support jekyll 4.0 yet so I just switched down the jekyll 3.3 and most custom themes started working.
First I edited the Gemfile installing alembic and downgrading jenkins.
```
gem "jekyll", "~> 3.3"
gem "alembic-jekyll-theme", "~> 3.3"
```
The I reloaded the Gemfile and rebuild the site.
```
bundle install
bundle exec jekyll build
```
Then I had to make just a few _config.yml changes to updated the theme. The baseurl was not an obvious change.  Also it made more sense to only allow one category per host.  
```
baseurl: ""
theme: alembic-jekyll-theme
```
I may be able to find better themes but learned by switching from the default minima them.  Next I hope to add more images to the jekyll site.
