# frozen_string_literal: true

module Jekyll
  module KargWare
    module StackExchange
      # StackExchange configuration class
      class Configuration
        attr_accessor :user_id, :api_baseurl

        DEFAULT_CONFIG = {
          'user_id' => 14_754_800,
          'api_baseurl' => 'https://api.stackexchange.com/2.3'
        }.freeze

        def initialize(options)
          options = generate_option_hash(options)

          @user_id = options['user_id']
          @api_baseurl = options['api_baseurl']
        end

        private

        def generate_option_hash(options)
          DEFAULT_CONFIG.merge(options)
        rescue TypeError
          DEFAULT_CONFIG
        end
      end
    end
  end
end
