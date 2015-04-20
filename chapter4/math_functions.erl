-module(math_functions).
-export([even/1, odd/1, test/0, filter/2, split/1, split_accum/1]).

test() ->
   false = even(1),
   true = even(2),
   true = odd(3),
   false = odd(4),
   [] = filter(even, []),
   [0, 2, 4, 6, 8, 10] = filter(fun (X) -> even(X) end, lists:seq(0, 10)),
   [1, 3, 5, 7, 9] = filter(fun (X) -> odd(X) end, lists:seq(0, 10)),
   {[0,2,4,6,8,10], [1,3,5,7,9]} = split(lists:seq(0, 10)),
   {[0,2,4,6,8,10], [1,3,5,7,9]} = split_accum(lists:seq(0, 10)),
   true = split(lists:seq(0, 1000)) =:= split_accum(lists:seq(0, 1000)),
   tests_passed.

even(X) ->
    X rem 2 =:= 0.

odd(X) ->
    X rem 2 =:= 1.

filter(_, []) -> [];
filter(F, L) ->
    [X || X <- L, F(X)].

split(L) ->
    {filter(fun (X) -> even(X) end, L), filter( fun(X) -> odd(X) end, L)}.

split_accum(L) -> split_accum(L, [], []).
split_accum([], Even, Odd) ->
    {lists:reverse(Even), lists:reverse(Odd)};
split_accum([H|T], Even, Odd) ->
    case even(H) of
        true -> split_accum(T, [H|Even], Odd);
        false -> split_accum(T, Even, [H|Odd])
    end.
