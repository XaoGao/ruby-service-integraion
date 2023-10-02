require_relative "../lib/service_integration"
require "factory_bot"
require "database_cleaner-sequel"
require "webmock/rspec"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include FactoryBot::Syntax::Methods

  FactoryBot.definition_file_paths = ["./spec/factories"]

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.before do
    DatabaseCleaner[:sequel].db = DB
    DatabaseCleaner[:sequel].strategy = :transaction
  end

  config.before do
    DatabaseCleaner[:sequel].start
  end

  config.after do
    DatabaseCleaner[:sequel].clean
  end
end
