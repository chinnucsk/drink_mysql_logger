%%%-------------------------------------------------------------------
%%% File    : drink_mysql_logger_app.erl
%%% Author  : Dan Willemsen <dan@csh.rit.edu>
%%% Purpose : 
%%%
%%%
%%% edrink, Copyright (C) 2010 Dan Willemsen
%%%
%%% This program is free software; you can redistribute it and/or
%%% modify it under the terms of the GNU General Public License as
%%% published by the Free Software Foundation; either version 2 of the
%%% License, or (at your option) any later version.
%%%
%%% This program is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%%% General Public License for more details.
%%%                         
%%% You should have received a copy of the GNU General Public License
%%% along with this program; if not, write to the Free Software
%%% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
%%% 02111-1307 USA
%%%
%%%-------------------------------------------------------------------

-module (drink_mysql_logger_app).
-behaviour (application).

-export ([start/2, stop/1]).

start(_Type, StartArgs) ->
	case drink_mysql_logger_sup:start_link(StartArgs) of
        {ok, Sup} ->
            drink_mysql_log:initialize(),
            drink_log:register_log_provider(drink_mysql_log),
            {ok, Sup};
        Else ->
            Else
    end.

stop(_State) ->
	ok.
