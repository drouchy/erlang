-module(math_functions).
-export([odd/1, even/1, filter/2, filter2/2, split/1, split2/1, split3/1]).

even(X) -> (X rem 2) =:= 0.
odd(X)  -> not even(X).

filter(_,[]) -> [];
filter(F,L)  -> [ X || X <- L, F(X) ].

split(L)  -> { filter(fun(X) -> even(X) end, L), filter(fun(X) -> odd(X) end, L) }.
split2(L) -> { filter(fun even/1, L), filter(fun odd/1, L) }.

split3(L)                -> split3(L, [], []).
split3([], Even, Odd)    -> {Even, Odd};
split3([H|T], Even, Odd) ->
  Predicate = even(H),
  if
    Predicate -> split3(T, [H|Even], Odd);
    true      -> split3(T, Even, [H|Odd])
  end.

filter2(_,[])     -> [];
filter2(F,[H|T])  ->
  Predicate = F(H),
  if
      Predicate -> [H | filter2(F,T)];
      true      -> filter2(F,T)
  end.