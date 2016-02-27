-module(string_calculator_tests).
-include_lib("eunit/include/eunit.hrl").

it_returns_0_for_empty_string_test() ->
    ?_assertEqual(0, string_calculator:add("")).

it_returns_same_digit_as_given_test_() ->
    [
        ?_assertEqual(1, string_calculator:add("1")),
        ?_assertEqual(2, string_calculator:add("2")),
        ?_assertEqual(3, string_calculator:add("3"))
    ].

it_sum_digits_between_commas_test_() ->
    [
        ?_assertEqual(3, string_calculator:add("1,2")),
        ?_assertEqual(4, string_calculator:add("1,3")),
        ?_assertEqual(2, string_calculator:add("1,1")),
        ?_assertEqual(3, string_calculator:add("1,1,1")),
        ?_assertEqual(123, string_calculator:add("1,2,120"))
    ].

it_allows_add_method_to_handle_new_lines_between_numbers_test_() ->
    [
        ?_assertEqual(6, string_calculator:add("1\n2,3")),
        ?_assertEqual(8, string_calculator:add("3\n2\n3"))
    ].

it_allows_to_support_different_delimeters_test_() ->
    [
        ?_assertEqual(3, string_calculator:add("//;\n1;2")),
        ?_assertEqual(3, string_calculator:add("//a\n1a2"))
    ].
