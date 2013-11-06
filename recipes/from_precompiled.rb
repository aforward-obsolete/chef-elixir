
package "zip"

filename = "v#{node[:elixir][:version]}.zip"
src_dir = "#{node[:elixir][:install_dir]}/elixir"

cookbook_file "#{node[:elixir][:install_dir]}/#{filename}" do
  source filename
  owner 'root'
  group 'root'
  mode '0644'
end

execute "remove old version" do
  command "rm -rf #{src_dir}"
  only_if { `iex -v | grep #{node[:elixir][:version]}`.strip.empty? }
end

execute "unzip #{filename}" do
  command "unzip #{filename} -d elixir"
  cwd "#{node[:elixir][:install_dir]}"
  user 'root'
  group 'root'
  not_if { File.exists?(src_dir) }
end

include_recipe "elixir::install"