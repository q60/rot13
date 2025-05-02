-module(rot13).

-export([main/1]).

rotate({K, V}) ->
    A = lists:member(V, lists:seq($A, $M)),
    B = lists:member(V, lists:seq($N, $Z)),
    if
        A ->
            K + 13;
        B ->
            K - 13;
        true ->
            K
    end.

main(_) ->
    Text = string:trim(io:get_line("Enter string to encode:\n")),
    List = lists:zip(Text, string:to_upper(Text)),
    Encoded = lists:map(fun rotate/1, List),
    io:format("Encoded string:~n~ts~n", [Encoded]).
