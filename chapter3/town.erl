%%% Pogramming Erlang chapter 2 excercises.
-module('town').
-export([new_house/2,
         get_number/1,
         get_rooms/1,
         new_street/1,
         build_house/2,
         get_capacity/1,
         test/0]).

new_house(Number, Rooms) ->
    {house, {number, Number}, {rooms, Rooms}}.

get_number(House) ->
    {house, {number, Number}, {_, _}} = House,
    Number.

get_rooms(House) ->
    {house, {_, _}, {rooms, Rooms}} = House,
    Rooms.

new_street(Name) ->
    {street, {name, Name}, {houses, []}}.

build_house(Street, House) ->
    {street, {name, Name}, {houses, Houses}} = Street,
    {street, {name, Name}, {houses, [House | Houses]}}.

get_capacity(Street) ->
    {street, {_, _}, {houses, Houses}} = Street,
    lists:sum([Rooms || {house, {_, _}, {rooms, Rooms}} <- Houses]).

test() ->
    House1 = new_house(10, 5),
    House2 = new_house(15, 1),
    Street = new_street("drive street"),
    NewStreet = build_house(Street, House1),
    NewerStreet = build_house(NewStreet, House2),
    Capacity = get_capacity(NewerStreet),
    true = Capacity =:= 6.
