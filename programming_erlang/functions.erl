-module(functions).
-export([hypot/2]).

hypot(X,Y) -> math:sqrt(X*X + Y*Y).