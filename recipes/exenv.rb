
git "#{node[:exenv][:install_dir]}" do
  repository "#{node[:exenv][:git_repo]}"
  reference "master"
  user node[:runas][:user]
  group node[:runas][:group]
  depth 1
  notifies :run, "execute[exenv make]"
end

execute "exenv make" do
  command [
    "echo 'export PATH=\"$HOME/.exenv/bin:$PATH\"' >> /home/#{node[:runas][:user]}/.bash_profile",
    "echo 'eval \"$(exenv init -)\"' >> /home/#{node[:runas][:user]}/.bash_profile"
    ].join(" && ")
  user node[:runas][:user]
  group node[:runas][:group]
  action :nothing
  notifies :run, "execute[exenv update]"
  only_if { `cat ~/.bashrc | grep .exenv`.strip == "" }
end

execute "exenv update" do
  command "#{node[:exenv][:bin_dir]}/exenv rehash"
  user node[:runas][:user]
  group node[:runas][:group]
  action :nothing
end

directory "#{node[:exenv][:install_dir]}/plugins" do
  recursive true
  user node[:runas][:user]
  group node[:runas][:group]
end

git "#{node[:elixir_build][:install_dir]}" do
  repository "#{node[:elixir_build][:git_repo]}"
  reference "master"
  user node[:runas][:user]
  group node[:runas][:group]
  depth 1
end