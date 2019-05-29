source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

#  For jquery
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# For Authentication
gem 'cancancan', '~> 2.3'
gem 'devise', '~> 4.6', '>= 4.6.1'
gem 'omniauth-facebook', '~> 5.0'

# For images
gem 'paperclip', '~> 6.0.0'

# For Editor
gem 'ckeditor'

group :development, :test do
  # Call 'byebug' anywhere in the code to get debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # For testing
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'factory_bot', '~> 5.0', '>= 5.0.2'
  gem 'shoulda-matchers', '~> 4.0', '>= 4.0.1'
  # gem 'capybara', '~> 3.14'

  # For fake data
  gem 'faker', '~> 1.9', '>= 1.9.3'
  # For clean testing DB
  gem 'database_cleaner', '~> 1.7'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console'.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your app running in the background.
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # For DB ERD
  gem 'rails-erd', '~> 1.5', '>= 1.5.2'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
