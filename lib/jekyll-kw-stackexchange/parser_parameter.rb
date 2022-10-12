# frozen_string_literal: true

module Jekyll
  module KargWare
    module StackExchange
      # Parameters for parser class
      class ParserParameter
        attr_reader :se_key, :se_type, :se_id

        @@se_key_default = 'SO'
        @@se_type_default = '?'
        @@se_id_default = 63_914_419

        def self.se_key_default
          @@se_key_default
        end

        def self.se_type_default
          @@se_type_default
        end

        def self.se_id_default
          @@se_id_default
        end

        def initialize
          super

          # /[a-zA-Z]/ == A string key of StackExchange Network (default "SO")
          @se_key = @@se_key_default

          # /?|!|@/ == include symbol (default "?")
          # ? -> Question
          # ! -> Answer
          # @ -> User
          @se_type = @@se_type_default

          # /\d/ == A ID of StackExchange ticket (default 63914419)
          @se_id = @@se_id_default
        end

        def self.str_to_filtered_arr(input, filter_regex)
          return nil if input.nil? || input.empty?

          arr = input.split
          arr.select { |v| v =~ filter_regex }
          # arr.grep { filter_regex }
        end

        def self.regex_filter_ids
          # https://stackoverflow.com/a/5917250/10655742
          # (?:^|\s)(\d*\.?\d+|\d{1,3}(?:,\d{3})*(?:\.\d+)?)(?!\S)
          # arr.select{|v| v =~ /(?:^|\s)(\d*\.?\d+|\d{1,3}(?:,\d{3})*(?:\.\d+)?)(?!\S)/}
          ## (?<!\S) to (?!\S) #The whole match must be surrounded by either whitespace or line boundaries. So if you see something bogus like :;:9.:, ignore the 9.
          ## (?=.)             #The whole thing can't be blank.

          # arr.select{|v| v =~ /(\b[\d]+\b)/}

          # (?<!\S)(?=.)([1-9](\d*))?(?!\S) # rubocop:disable Lint/Syntax
          %r{ (?<!\S)(?=.)([1-9](\d*))?(?!\S) }x
        end

        def self.regex_filter_keys
          ## (?<!\S) to (?!\S) #The whole match must be surrounded by either whitespace or line boundaries. So if you see something bogus like :;:9.:, ignore the 9.
          ## (?=.)             #The whole thing can't be blank.

          # arr.select{|v| v =~ /(?<!\S)(?=.)([a-zA-Z]((\w*)|[^!@\?]|(\D*)))?(?!\S)/}
          # rubocop:disable Lint/Syntax
          # (?<!\S)(?=.)([a-zA-Z]([a-zA-Z]*))?(?!\S)
          %r{ (?<!\S)(?=.)([a-zA-Z]([a-zA-Z]*))?(?!\S) }x
          # rubocop:enable Lint/Syntax
        end

        def self.regex_filter_types
          ## (?<!\S) to (?!\S) #The whole match must be surrounded by either whitespace or line boundaries. So if you see something bogus like :;:9.:, ignore the 9.
          ## (?=.)             #The whole thing can't be blank.

          # (?<!\S)(?=.)([!|\?|@]{1})?(?!\S) # rubocop:disable Lint/Syntax
          %r{ (?<!\S)(?=.)([!|\?|@]{1})?(?!\S) }x
        end

        def self.get_ids(input)
          str_to_filtered_arr(input, regex_filter_ids)
        end

        def self.get_keys(input)
          str_to_filtered_arr(input, regex_filter_keys)
        end

        def self.get_types(input)
          str_to_filtered_arr(input, regex_filter_types)
        end

        def init(parameters = nil)
          # Get the ID
          ids = ParserParameter.get_ids(parameters)
          @se_id = ids[0].to_i if !ids.nil? && !ids.first.nil?

          # Get the key, default is "SO"
          keys = ParserParameter.get_keys(parameters)
          @se_key = keys.first.upcase if !keys.nil? && !keys.first.nil?

          # Check SE type (user, answer or question (default))
          types = ParserParameter.get_types(parameters)
          @se_type = types.first if !types.nil? && !types.first.nil?

          # return if parameters.nil?

          # values = parameters.split

          # # [@|\?|!]{1}|\b([a-zA-Z]+)\b|\b([\d]+)\b
          # # SO 123456 ? A1B2C3 A11B22C33 1A2B so ABC?! ??
          # # BAD: ABC?!
          # # BAD: ??

          # # ([@|\?|!]{1})|\b^(?!@)^(?!\?)^(?!!)([a-zA-Z]+)\b|\b([\d]+)\b
          # # SO 123456 @
          # # SO 123456 !
          # # SO 123456 ? A1B2C3 A? A11B22C33 1A2B so ABC?! ?? ?AAA 12345? @12 ?ABC
          # # BAD

          # # (^|[^@|!|\?])\b[a-zA-Z]+\b($|[^@|!|\?])
          # # A1B2 A?C A!C A@C AC? AC! AC@ ?AC !AC @AC @ 123 au AU foobar 555 !
          # # SO 123456 @
          # # SO 123456 !
          # # SO 123456 ? A1B2C3 A? A11B22C33 1A2B so ABC?! ?? ?AAA 12345? @12 ?ABC !DDD

          # # [a-zA-Z]+|(@|!|\?){1}|[\d]+

          # # Get the ID
          # id = values.select{|v| v =~ /\b([\d]+)\b/}[0]
          # # id = values.select{|v| v =~ /[\d]+/}[0]
          # @se_id = id.to_i if id != nil
          # # throw "Missing ID (number) for tag 'stackexchange'" if se_id == nil

          # # Get the TYPE key, default is "SO"
          # key = values.select{|v| v =~ /(^|[^@|!|\?])\b[a-zA-Z]+\b($|[^@|!|\?])/}[0]
          # # key = values.select{|v| v =~ /[a-zA-Z]+/}[0]
          # key == nil ? @se_key = @@se_key_default : @se_key = key.strip
          # @se_key = @se_key.upcase

          # # Check SE type (user, answer or question (default))
          # # type = values.select{|v| v =~ /[@|\?|!]{1}/}[0]
          # # # type = values.select{|v| v =~ /(@|!|\?){1}/}[0]
          # # type == nil ? @se_type = ParserParameter.new.se_type : @se_type = type
          # if values.include? "@"
          #   @se_type = "@"
          # elsif values.include? "!"
          #   @se_type = "!"
          # elsif values.include? "?"
          #   @se_type = "?"
          # end
        end
      end
    end
  end
end
