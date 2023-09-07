source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.7", ">= 7.0.7.2"
gem "bcrypt", "3.1.18"
gem 'bootstrap4-kaminari-views'
gem "faker"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem 'ransack'
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem 'kaminari'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "jsbundling-rails"
gem "cssbundling-rails"

# fly.io
gem "dockerfile-rails", ">= 1.5", :group => :development
gem "sentry-ruby", "~> 5.10"
gem "sentry-rails", "~> 5.10"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
