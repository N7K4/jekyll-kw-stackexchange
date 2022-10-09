# frozen_string_literal: true

require 'test_helper'
require 'jekyll-kw-stackexchange/version'

module Jekyll
  module KargWare
    module StackExchange
      class GeneralTest < Minitest::Test
        def test_that_it_has_a_rubygem_name
          refute_nil Jekyll::KargWare::StackExchange::RUBYGEM_NAME
        end

        def test_that_it_has_a_version_number
          refute_nil Jekyll::KargWare::StackExchange::VERSION
        end
      end
    end
  end
end
