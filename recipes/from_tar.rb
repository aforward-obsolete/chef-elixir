
name = "elixir-#{node[:elixir][:version]}"
filename = "#{name}.tar.gz"
src_dir = "#{node[:elixir][:install_dir]}/elixir"

cookbook_file "#{node[:elixir][:install_dir]}/#{filename}" do
  source filename
  owner 'root'
  group 'root'
  mode '0644'
end

execute "tar zxfv #{filename}" do
  command "tar zxfv #{filename}; mv ./#{name} ./elixir"
  cwd "#{node[:elixir][:install_dir]}"
  user 'root'
  group 'root'
  not_if { File.exists?("#{src_dir}") }
  notifies :run, "execute[elixir make]", :immediately
end

include_recipe "elixir::install"