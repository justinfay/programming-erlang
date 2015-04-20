-module(date).
-export([test/0, my_date_string/0, my_time_func/1]).
-import(lists, [append/1, map/2]).

test() ->
    % I could do with mocking `timer:sleep` to properly test this.
    true = 10 < my_time_func(sleep(10)),
    true = 999 < my_time_func(sleep(1000)),
    tests_passed.

sleep(MilliSeconds) -> 
    ( fun() -> timer:sleep(MilliSeconds) end ).

my_time_func(Fun) ->
    % return the amount of milliseconds to execute `Fun`.
    {_, _, Start} = now(),
    _ = Fun(),
    {_, _, End} = now(),
    End - Start.

my_date_string() ->
    % Format returned is: YYYY-MM-DD HH:MM:SS
    % Cannot test io:format :(
    io:format(
        '~B-~B-~B ~B:~B:~B',
        append(map(fun (X) -> tuple_to_list(X) end, [date(), time()]))).
