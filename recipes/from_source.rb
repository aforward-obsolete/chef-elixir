
src_dir = "#{node[:elixir][:install_dir]}/elixir"


git "#{src_dir}" do
  repository "#{node[:elixir][:git_url]}"
  action :sync
  notifies :run, "execute[elixir make test]", :immediately
end

execute "elixir make test" do
  command "make test"
  cwd "#{node[:elixir][:install_dir]}/elixir"
  only_if { node[:elixir][:run_tests] }
  action :nothing
end

%w(iex elixir elixirc mix).each do |app|
  link "#{node[:elixir][:bin_dir]}/#{app}" do
    to "#{src_dir}/bin/#{app}"
  end
end

