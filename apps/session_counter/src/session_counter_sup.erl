-module(session_counter_sup).
-author('mkorszun@gmail.com').

-behaviour(supervisor).

-export([init/1, start_link/0]).

%% ###############################################################
%% MACROS
%% ###############################################################

-define(CHILD(I, Type), {I, {I, start_link, []}, transient, 5000, Type, [I]}).

%% ###############################################################
%% API
%% ###############################################################

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ###############################################################
%% SUPERVISOR CALLBACKS
%% ###############################################################

init([]) ->
    {ok, { {simple_one_for_one, 5, 10}, [?CHILD(session_counter_gen, worker)]}}.

%% ###############################################################
%% ###############################################################
%% ###############################################################