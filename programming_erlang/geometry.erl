-module(geometry).
-export([area/1, perimeter/1]).

area({rectangle, Width, Height})    -> Width * Height;
area({square, Side})                -> Side * Side;
area({right_angled_triangle, X, Y}) -> area({rectangle, X,Y})/2;
area({circle, Radius})              -> 3.14159 * Radius * Radius.

perimeter({rectangle, Width, Height})    -> Width * 2 + Height * 2;
perimeter({square, Side})                -> Side * 4;
perimeter({right_angled_triangle, X, Y}) -> X + Y + functions:hypot(X, Y);
perimeter({circle, Radius})              -> 3.1459 * Radius.