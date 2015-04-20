-module(mybif).
-export([my_tuple_to_list/1, test/0]).

my_tuple_to_list(Tuple) ->
    [element(I, Tuple) || I <- lists:seq(1, tuple_size(Tuple))]. 

test() ->
    [1, 2, 3, 4] = my_tuple_to_list({1, 2, 3, 4}),
    [] = my_tuple_to_list({}),
    [foobar] = my_tuple_to_list({foobar}),
    [foobar, 1, 2, -1, -2] = my_tuple_to_list({foobar, 1, 2, -1, -2}),
    tests_worked.
