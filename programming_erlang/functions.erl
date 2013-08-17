-module(functions).
-export([hypot/2, temp_convert/1]).

temp_convert({c, Temp}) -> { f, 32 + Temp*9/5};
temp_convert({f, Temp}) -> { c, (Temp-32)*5/9}.

hypot(X,Y) -> math:sqrt(X*X + Y*Y).