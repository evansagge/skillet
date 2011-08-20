source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'
gem 'mongoid', '~> 2.1'
gem 'bson_ext'

gem 'devise'

gem 'slim'
gem 'slim-rails'
gem 'simple_form'
gem 'show_for'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
  gem 'compass', :git => 'git://github.com/chriseppstein/compass.git', :branch => 'rails31'
end

gem 'jquery-rails'

# Use unicorn as the web server
gem 'unicorn'

group :development do
  gem 'capistrano'
  gem 'thin'
  gem 'ruby-debug19', :require => 'ruby-debug'
  
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-pow'
  
  gem 'growl'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rspec-rails', '~> 2.6'
  gem 'fabrication'
  gem 'forgery'
  gem 'database_cleaner'
  
  gem 'capybara'
  # gem 'webrat'
  
  gem 'spork'
end