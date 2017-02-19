% erlc hello.erl
% erl -noshell -s hello start -s init stop
% rm hello.beam

% Module and file name should be the same
% It should start with lower case letter
-module(hello).
-export([start/0]).

start() ->
	io:fwrite("Hello world!\n").

