# frozen_string_literal: true

# $LOAD_PATH.unshift File.expand_path('../lib', __dir__)
# require 'jekyll/<Company | pascalcase>/<Project | pascalcase>'
# require 'jekyll/<Company | pascalcase>/<Project | pascalcase>/configuration

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
