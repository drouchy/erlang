-module(modules).
-export([most_functions/0, most_common_function/0]).

most_functions() ->
  Methods = [ {nb_functions(Name), Name} || Name <- all_modules() ],
  {_, Name} = lists:max(Methods),
  Name.

most_common_function() ->
  Methods = [ module_functions(Module) || Module <- all_modules() ],
  Mapped = count_functions(lists:flatten(Methods)),
  lists:max(Mapped).

nb_functions(Module) ->
  length(module_functions(Module)).

module_functions(Module) ->
  [{exports, Methods},_, _, _] = Module:module_info(),
  [ MethodName || {MethodName, _} <- Methods].

all_modules() ->
  [ Name || {Name,_} <- code:all_loaded() ].

count_functions(Functions) ->
  count_functions(Functions, []).

count_functions([], Map) -> Map;
count_functions([Head|Tail], Map) ->
  Mapped = lists:keytake(Head,2,Map),
  case Mapped of
    false    -> {value,{Count,Name},NewMap} = {value,{0,Head},Map};
    {_,_,_}  -> {value,{Count,Name},NewMap} = Mapped
  end,
  count_functions(Tail, [{Count+1,Name}|NewMap]).