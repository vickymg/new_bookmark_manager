ENV["RACK_ENV"] = "test"

require 'capybara/rspec'
require './app/models/link'
require './app/app'
require 'tilt/erb'

Capybara.app = BookmarkManager

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
