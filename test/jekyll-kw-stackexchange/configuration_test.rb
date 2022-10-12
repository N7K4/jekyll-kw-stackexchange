# frozen_string_literal: true

require_relative '../test_helper'
require 'jekyll-kw-stackexchange/configuration'

module Jekyll
  module KargWare
    module StackExchange
      # Test the StackExchange configuration
      class ConfigurationTest < Minitest::Test
        def test_default_configuration
          configuration = Jekyll::KargWare::StackExchange::Configuration.new({})

          assert_equal 14_754_800, configuration.user_id
          assert_equal 'https://api.stackexchange.com/2.3', configuration.api_baseurl
        end

        def test_type_error_in_configuration
          configuration = Jekyll::KargWare::StackExchange::Configuration.new('TypeError!')

          assert_equal 14_754_800, configuration.user_id
          assert_equal 'https://api.stackexchange.com/2.3', configuration.api_baseurl
        end

        def test_configuration_change_user_id
          configuration = Jekyll::KargWare::StackExchange::Configuration.new('user_id' => 2022)

          assert_equal 2_022, configuration.user_id
          assert_equal 'https://api.stackexchange.com/2.3', configuration.api_baseurl
        end

        def test_configuration_change_api_baseurl
          configuration = Jekyll::KargWare::StackExchange::Configuration.new('api_baseurl' => 'https://api.stackexchange.com/1.0')

          assert_equal 14_754_800, configuration.user_id
          assert_equal 'https://api.stackexchange.com/1.0', configuration.api_baseurl
        end

        def test_configuration_change_all
          configuration = Jekyll::KargWare::StackExchange::Configuration.new({ 'user_id' => 42, 'api_baseurl' => 'https://api.stackexchange.com/9.9.9' })

          assert_equal 42, configuration.user_id
          assert_equal 'https://api.stackexchange.com/9.9.9', configuration.api_baseurl
        end
      end
    end
  end
end
