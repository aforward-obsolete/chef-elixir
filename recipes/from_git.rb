
src_dir = "#{node[:elixir][:install_dir]}/elixir"

git "#{src_dir}" do
  repository "#{node[:elixir][:git_url]}"
  action :sync
  notifies :run, "execute[elixir make]", :immediately
end

include_recipe "elixir::install"