# frozen_string_literal: true

# $LOAD_PATH.unshift File.expand_path('../lib', __dir__)
# require 'jekyll/KargWare/StackExchange'
# require 'jekyll/KargWare/StackExchange/configuration

require 'simplecov'
require 'simplecov-html'
require 'simplecov_json_formatter'
SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::JSONFormatter
  ]
)
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
