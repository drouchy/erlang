-module(shopping).
-export([cost/1, default_basket/0, total/1, total2/1]).

default_basket() -> [{oranges,4}, {newspaper,1}, {apples, 10}, {pears,6}, {milk,3}].

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apples)    -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7.

total([])              -> 0;
total([{What, N} | T]) -> cost(What) * N + total(T).

total2(Products) -> lists:sum([cost(What) * N || {What, N} <- Products]).