
src_dir = "#{node[:elixir][:install_dir]}/elixir"


git "#{src_dir}" do
  repository "#{node[:elixir][:git_url]}"
  action :sync
  notifies :run, "execute[elixir make]"
end

execute "elixir make" do
  # currently make test fails some specs -- so just make
  command "make"
  cwd "#{node[:elixir][:install_dir]}/elixir"
  action :nothing
end

%w(iex elixir elixirc mix).each do |app|
  link "#{node[:elixir][:bin_dir]}/#{app}" do
    to "#{src_dir}/bin/#{app}"
  end
end

