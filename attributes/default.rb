default[:elixir][:install_dir] = "/usr/local/src"
default[:elixir][:bin_dir] = "/usr/local/bin"
default[:elixir][:version] = "0.11.0" # use "git" for latest

# 5 are failing, should report
default[:elixir][:run_tests] = false

# NOT ABLE TO REACH https://github.com/elixir-lang/elixir.git
default[:elixir][:git_url] = "git://github.com/elixir-lang/elixir.git"

