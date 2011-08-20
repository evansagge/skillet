require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.orm = "mongoid"

Before do
  DatabaseCleaner.clean
end