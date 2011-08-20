require 'rubygems'
require 'spork'

require 'cucumber/rails'

Spork.prefork do
  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false
end

Spork.each_run do
  # This code will be run each time you run your specs.
end

