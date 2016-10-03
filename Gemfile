source 'https://rubygems.org'

ruby File.read(File.expand_path('../.ruby-version', __FILE__)).chomp

gem 'dotenv-rails'
gem 'redcarpet'
gem 'coffee-rails'

gem 'rails'
gem 'pg'
gem 'puma'
gem 'pry-rails'

gem 'devise'
#gem 'doorkeeper'
gem 'faraday'
gem 'hashie'
gem 'oj'

gem 'hamlit'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'bootstrap-sass'
#gem 'simple_form'
gem 'rollbar'

group :production do
  gem 'newrelic_rpm'
  gem 'airbrake'
end

group :development, :test do
  gem 'capistrano', '~>3.6'
  gem 'byebug'
  gem 'rubocop'
  gem 'scss_lint', require: false
end

group :development do
  gem 'listen'
end

group :test do
  gem 'capybara'
  gem 'minitest-reporters'
  gem 'simplecov'
  gem 'simplecov-rcov'
end
