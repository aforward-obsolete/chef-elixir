

[  "precise", "oneiric", "natty", "maverick", "lucid", "wheezy", "squeeze" ].each do |lib|
  execute "Add erlang library #{lib} /etc/apt/sources.list" do
    command "echo \"deb http://binaries.erlang-solutions.com/debian #{lib} contrib\" >> /etc/apt/sources.list"
    only_if do
      is_correct_lib = `cat /etc/apt/sources.list | grep #{lib}`.strip != "" 
      is_not_installed = `cat /etc/apt/sources.list | grep "deb http://binaries.erlang-solutions.com/debian #{lib} contrib"`.strip == ""
      is_correct_lib && is_not_installed
    end
  end
end

execute "Add erlang public key" do
  command "wget -O - http://binaries.erlang-solutions.com/debian/erlang_solutions.asc | sudo apt-key add -"
end

execute "apt-get --assume-yes update"
execute "apt-get --assume-yes install esl-erlang"
