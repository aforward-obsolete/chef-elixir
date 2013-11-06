include_recipe "elixir::erlang"
include_recipe "elixir::from_#{node[:elixir][:mode]}"
include_recipe("elixir::rebar")