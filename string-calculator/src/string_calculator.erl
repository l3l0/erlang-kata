-module(string_calculator).
-export([add/1]).

add("") -> 0;
add(String) when length(String) == 1 -> element(1, string:to_integer(String));

add(String) ->
    case string:str(String, "//") == 1 of
        true ->
            Delimeter = string:substr(String, 3, 1),
            NumberString = string:substr(String, 5);
        false ->
            Delimeter = ",",
            NumberString = String
    end,
    NormalizedString = re:replace(NumberString, "\n", Delimeter, [global, {return, list}]),
    sum(string:tokens(NormalizedString, Delimeter)).

sum(Numbers) -> sum(Numbers, 0).

sum([A|B], Number) -> sum(B, element(1, string:to_integer(A)) + Number);
sum([], Number) -> Number.
