require 'rubygems'
require 'spork'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do  
  require 'rails/application'
  require 'rails/mongoid'
  Spork.trap_class_method(Rails::Mongoid, :load_models)
  Spork.trap_method(Rails::Application, :reload_routes!)
  
  require File.expand_path "../../config/environment", __FILE__
  require 'rspec/rails'
  
  RSpec.configure do |config|
    config.mock_with :rspec
    config.include  Devise::TestHelpers, :type => :controller
    config.include  Warden::Test::Helpers, :type => :request

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.orm = "mongoid"
    end

    config.before(:each) do
      DatabaseCleaner.clean
    end

    config.after :type => :request do
      Warden.test_reset!
    end  
  end
end

Spork.each_run do
  load "#{Rails.root}/config/routes.rb"
  Dir["#{File.dirname(__FILE__)}/fabricators/**/*.rb"].each { |f| require f }
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
end
