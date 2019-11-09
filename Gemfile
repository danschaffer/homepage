source "https://rubygems.org"
gem "jekyll", "~> 3.3"
gem "alembic-jekyll-theme"
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
end

install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end
