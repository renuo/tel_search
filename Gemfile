# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in tel_search.gemspec
gemspec

gem "rake", "~> 13.0"
gem "rspec", "~> 3.0"
gem "nokogiri"

group :test, :development do
  gem "standard"
end

group :test do
  gem "vcr"
  gem "webmock"
end
