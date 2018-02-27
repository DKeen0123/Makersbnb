ENV["ENVIRONMENT"] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'rspec'
require 'rake'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = MakersBnb

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner.start
    Property.create(email: 'test@example.com', url: "https://i.imgur.com/rE8X4ir.jpg")
    User.create(name: "mike", email: "mike@test.com", password:"123")
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
