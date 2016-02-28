-module(string_calculator).
-export([add/1]).

add("") -> 0;
add(String) when length(String) == 1 -> convert_to_int(String);

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
    Numbers = string:tokens(NormalizedString, Delimeter),
    sum(Numbers).

sum(Numbers) ->
    NegativeNumbers = lists:filter(fun (Number) -> convert_to_int(Number) < 0 end, Numbers),
    case length(NegativeNumbers) > 0 of
	true ->
            throw({negatives_not_allowed, NegativeNumbers});
	false ->
            sum(Numbers, 0)
    end.

sum([A|B], Number) -> sum(B, convert_to_int(A)  + Number);
sum([], Number) -> Number.

convert_to_int(Number) ->
    element(1, string:to_integer(Number)).
