
src_dir = "#{node[:elixir][:install_dir]}/elixir"

execute "elixir make" do
  # currently make test fails some specs -- so just make
  command "make"
  cwd "#{src_dir}"
  action :nothing
end

%w(iex elixir elixirc mix).each do |app|
  link "#{node[:elixir][:bin_dir]}/#{app}" do
    to "#{src_dir}/bin/#{app}"
  end
end

