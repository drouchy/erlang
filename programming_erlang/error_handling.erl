-module(error_handling).
-export([read_file/1]).

read_file(FileName) ->
  read_file_or_raise(file:read_file(FileName)).

read_file_or_raise({error, Error}) -> throw(Error);
read_file_or_raise({ok, Content})  -> Content.