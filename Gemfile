source 'https://rubygems.org'

ruby "2.3.1"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use JWT authentication. Read more how to use: https://www.sitepoint.com/introduction-to-using-jwt-in-rails/
gem 'jwt'
# Use rack-cors. Read more: https://github.com/cyu/rack-cors
gem 'rack-cors', :require => 'rack/cors'
# Use Rails Admin. Read more: https://github.com/sferik/rails_admin
gem 'rails_admin', '~> 1.0'
# Use carrierwave for file upload solution
gem 'carrierwave', '0.10.0'
# Upload files encoded as base64 to carrierwave.
gem 'carrierwave-base64', '~> 2.3.2'
# Use mini magick photo resizing
gem 'mini_magick', '4.5.1'
# Use fog for AWS S3
gem 'fog', '~> 1.36.0'
# Use sidekiq for background processing
gem 'sidekiq'
# Use sinatra from source baceuse of dependency issues
gem 'sinatra', github: 'sinatra/sinatra'
# Whenever gem for cron job
gem 'whenever', require: false
# Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem "figaro"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Pry is a powerful alternative to the standard IRB shell for Ruby
  gem 'pry'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
