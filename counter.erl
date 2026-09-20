-module(counter).
-export([start/0, loop/1]).

start() -> register(counter, spawn(?MODULE, loop, [0])), counter ! {increment, 5}, timer:sleep(50), counter ! value, timer:sleep(50), counter ! stop.
loop(Value) -> receive
    {increment, Amount} when is_integer(Amount) -> loop(Value + Amount);
    value -> io:format("Contador: ~p~n", [Value]), loop(Value);
    stop -> io:format("Contador detenido~n");
    _ -> loop(Value)
end.
