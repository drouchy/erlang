-module(dializer_session).
-export([function_1/2]).

function_1(X,Y) ->
  seconds({X,Y}).

seconds({_Year, _Month, _Day, Hour, Min, Sec}) ->
  (Hour * 60 * Min)*60 + Sec.