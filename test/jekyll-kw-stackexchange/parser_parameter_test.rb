# frozen_string_literal: true

# rubocop:disable Naming/VariableNumber
# rubocop:disable Naming/MethodName

require_relative '../test_helper'
require 'jekyll-kw-stackexchange/parser_parameter'

module Jekyll
  module KargWare
    module StackExchange
      class ParserParameterTest < Minitest::Test
        def test_ctor_default
          sut = ParserParameter.new

          assert_equal ParserParameter.se_key_default, sut.se_key
          assert_equal ParserParameter.se_type_default, sut.se_type
          assert_equal ParserParameter.se_id_default, sut.se_id
        end

        # def test_ctor_argument_error
        #   assert_raises ArgumentError do
        #     ParserParameter.new('40w')
        #   end
        # end

        def test_self_get_ids_nil
          sut = ParserParameter.get_ids(nil)
          assert_nil sut
        end

        def test_self_get_keys_nil
          sut = ParserParameter.get_keys(nil)
          assert_nil sut
        end

        def test_self_get_types_nil
          sut = ParserParameter.get_types(nil)
          assert_nil sut
        end

        def test_self_get_ids_empty
          sut = ParserParameter.get_ids('')
          assert_nil sut
        end

        def test_self_get_keys_empty
          sut = ParserParameter.get_keys('')
          assert_nil sut
        end

        def test_self_get_types_empty
          sut = ParserParameter.get_types('')
          assert_nil sut
        end

        def test_self_get_ids
          sut = ParserParameter.get_ids('123 123,456 .987 44.55 0123 abc 1!2 @444 666! 6-7 A1B2C3 Abc 5@7 888 999')
          assert_equal ['123', '888', '999'], sut
        end

        def test_self_str_to_filtered_arr_ids
          sut = ParserParameter.str_to_filtered_arr('123 123,456 .987 44.55 0123 abc 1!2 @444 666! 6-7 A1B2C3 Abc 5@7 888 999', ParserParameter.regex_filter_ids)
          assert_equal ['123', '888', '999'], sut
        end

        def test_self_get_keys
          sut = ParserParameter.get_keys('a a1a bb a!a a@a a?a ccc 123 123,456 .987 44.55 0123 abc 1!2 @444 666! 6-7 A1B2C3 Abc 5@7 888 999')
          assert_equal ['a', 'bb', 'ccc', 'abc', 'Abc'], sut
        end

        def test_self_str_to_filtered_arr_keys
          sut = ParserParameter.str_to_filtered_arr('a a1a bb a!a a@a a?a ccc 123 123,456 .987 44.55 0123 abc 1!2 @444 666! 6-7 A1B2C3 Abc 5@7 888 999', ParserParameter.regex_filter_keys)
          assert_equal ['a', 'bb', 'ccc', 'abc', 'Abc'], sut
        end

        def test_self_get_types
          sut = ParserParameter.get_types('@ @@ ! ? ?? @ @2 !! a a1a bb a!a a@a a?a ccc 123 123,456 .987 44.55 0123 abc 1!2 @444 666! 6-7 A1B2C3 Abc 5@7 888 999 1@2 @12 @ ? ?? !')
          assert_equal ['@', '!', '?', '@', '@', '?', '!'], sut
        end

        def test_self_str_to_filtered_arr_types
          sut = ParserParameter.str_to_filtered_arr('@ @@ ! ? ?? @ @2 !! a a1a bb a!a a@a a?a ccc 123 123,456 .987 44.55 0123 abc 1!2 @444 666! 6-7 A1B2C3 Abc 5@7 888 999 1@2 @12 @ ? ?? !', ParserParameter.regex_filter_types)
          assert_equal ['@', '!', '?', '@', '@', '?', '!'], sut
        end

        def test_ctor_init_nil
          sut = ParserParameter.new
          sut.init(nil)

          assert_equal ParserParameter.se_key_default, sut.se_key
          assert_equal ParserParameter.se_type_default, sut.se_type
          assert_equal ParserParameter.se_id_default, sut.se_id
        end

        def test_ctor_init_empty
          sut = ParserParameter.new
          sut.init('')

          assert_equal ParserParameter.se_key_default, sut.se_key
          assert_equal ParserParameter.se_type_default, sut.se_type
          assert_equal ParserParameter.se_id_default, sut.se_id
        end

        def test_ctor_with_init_ticket_123456
          sut = ParserParameter.new
          sut.init('123456')

          assert_equal ParserParameter.se_key_default, sut.se_key
          assert_equal ParserParameter.se_type_default, sut.se_type
          assert_equal 123_456, sut.se_id
        end

        def test_ctor_with_init_ticket_123456_abc_answer
          sut = ParserParameter.new
          sut.init('123456 abc !')

          assert_equal 'ABC', sut.se_key
          assert_equal '!', sut.se_type
          assert_equal 123_456, sut.se_id
        end

        def test_ctor_with_init_ticket_answer_123456_abc
          sut = ParserParameter.new
          sut.init('! 123456 abc')

          assert_equal 'ABC', sut.se_key
          assert_equal '!', sut.se_type
          assert_equal 123_456, sut.se_id
        end

        def test_ctor_with_init_ticket_answer_abc_123456
          sut = ParserParameter.new
          sut.init('! abc 123456')

          assert_equal 'ABC', sut.se_key
          assert_equal '!', sut.se_type
          assert_equal 123_456, sut.se_id
        end

        def test_ctor_with_init_network_abc_uppercase
          sut = ParserParameter.new
          sut.init('ABC')

          assert_equal 'ABC', sut.se_key
          assert_equal ParserParameter.se_type_default, sut.se_type
          assert_equal ParserParameter.se_id_default, sut.se_id
        end

        def test_ctor_with_init_network_abc_mixedcase
          sut = ParserParameter.new
          sut.init('aBc')

          assert_equal 'ABC', sut.se_key
          assert_equal ParserParameter.se_type_default, sut.se_type
          assert_equal ParserParameter.se_id_default, sut.se_id
        end

        def test_ctor_with_init_network_a1b2c_uppercase
          sut = ParserParameter.new
          sut.init('A1B2C')

          assert_equal ParserParameter.se_key_default, sut.se_key
          assert_equal ParserParameter.se_type_default, sut.se_type
          assert_equal ParserParameter.se_id_default, sut.se_id
        end

        def test_ctor_with_init_question
          sut = ParserParameter.new
          sut.init('?')

          assert_equal ParserParameter.se_key_default, sut.se_key
          assert_equal '?', sut.se_type
          assert_equal ParserParameter.se_id_default, sut.se_id
        end

        def test_ctor_with_init_answer
          sut = ParserParameter.new
          sut.init('!')

          assert_equal 'SO', sut.se_key
          assert_equal '!', sut.se_type
          assert_equal 63_914_419, sut.se_id
        end

        def test_ctor_with_init_user
          sut = ParserParameter.new
          sut.init('@')

          assert_equal 'SO', sut.se_key
          assert_equal '@', sut.se_type
          assert_equal 63_914_419, sut.se_id
        end

        def test_ctor_with_init_AU_user_123
          sut = ParserParameter.new
          sut.init('A1B2 A?C @ 123 AU foobar 555 !')

          assert_equal 'AU', sut.se_key
          assert_equal '@', sut.se_type
          assert_equal 123, sut.se_id
        end
      end
    end
  end
end

# rubocop:enable Naming/VariableNumber
# rubocop:enable Naming/MethodName
