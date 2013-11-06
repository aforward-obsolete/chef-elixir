
git "#{node[:rebar][:install_dir]}/rebar" do
  repository "#{node[:rebar][:git_repo]}"
  reference "master"
  user 'root'
  group 'root'
  depth 1
  notifies :run, "execute[install_rebar]"
end

execute "install_rebar" do
  cwd "#{node[:rebar][:install_dir]}/rebar"
  command "./bootstrap"
  # action :nothing
end

link "#{node[:rebar][:bin_dir]}/rebar" do
  to "#{node[:rebar][:install_dir]}/rebar/rebar"
end
