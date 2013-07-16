
include_recipe "elixir::erlang"

if node[:elixir][:version] == "git"
  include_recipe "elixir::from_git"
else
  include_recipe "elixir::from_tar"
end