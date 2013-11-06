default[:rebar][:install_dir] = "/usr/local/src"
default[:rebar][:bin_dir] = "/usr/local/bin"
default[:rebar][:git_repo] = "git://github.com/basho/rebar.git"

default[:exenv][:install_dir] = "/home/#{node[:runas][:user]}/.exenv"
default[:exenv][:git_repo] = "git://github.com/mururu/exenv.git"
default[:exenv][:bin_dir] = "/home/deployer/.exenv/bin"

default[:elixir_build][:install_dir] = "#{node[:exenv][:install_dir]}/plugins/elixir-build"
default[:elixir_build][:git_repo] = "git://github.com/mururu/elixir-build.git"

default[:elixir][:install_dir] = "/usr/local/src"
default[:elixir][:bin_dir] = "/usr/local/bin"
default[:elixir][:mode] = "precompiled" # [ "git","tar","precompiled" ]
default[:elixir][:version] = "0.11.0"

# 5 are failing, should report
default[:elixir][:run_tests] = false

# NOT ABLE TO REACH https://github.com/elixir-lang/elixir.git
default[:elixir][:git_url] = "git://github.com/elixir-lang/elixir.git"

