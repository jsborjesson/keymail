require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start 'rails'

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

require "factories"

Turn.config.natural = true

DatabaseCleaner.strategy = :transaction

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class Minitest::Spec
  include ActiveSupport::Testing::Assertions # assert_difference etc...
  include ActiveSupport::Testing::SetupAndTeardown # before, after

  # Support rspec-style context-blocks
  class << self
    alias_method :context, :describe
  end

  before { DatabaseCleaner.start }
  after { DatabaseCleaner.clean }
end

# A bit more dry validation tests
#     m = Message.create(text: '')
#     m.must_have_invalid :text
module Minitest::Assertions
  def assert_has_invalid(field, model)
    model.must_be :invalid?
    model.errors[field].must_be :present?
  end
end
ActiveRecord::Base.infect_an_assertion :assert_has_invalid, :must_have_invalid

class Proc
    infect_an_assertion :assert_difference, :must_change
    infect_an_assertion :assert_no_difference, :wont_change
end

# Make the controller methods (get, post etc...) work
class ControllerSpec < Minitest::Spec
  include Rails.application.routes.url_helpers
  include ActionController::TestCase::Behavior

  before do
    @routes = Rails.application.routes
  end
end
Minitest::Spec.register_spec_type(/Controller$/, ControllerSpec)

# Set up Capybara
require 'capybara/rails'
class AcceptanceSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Capybara::Email::DSL

  # before do
  #   @routes = Rails.application.routes
  # end

end
MiniTest::Spec.register_spec_type(/Integration$/, AcceptanceSpec)
