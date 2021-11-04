# frozen_string_literal: true

require 'minitest/autorun'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)
  end
end

DatabaseCleaner.strategy = :transaction
module Minitest
  class Spec
    before :each do
      DatabaseCleaner.start
    end

    after :each do
      DatabaseCleaner.clean
    end
  end
end

module ActionDispatch
  class IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end
