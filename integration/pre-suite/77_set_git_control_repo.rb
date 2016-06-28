#Init
git_repo_path = '/git_repos'
git_repo_name = 'environments'
git_control_remote = File.join(git_repo_path, "#{git_repo_name}.git")


step 'clone repo for Nerissa'
on(master, "git clone #{git_control_remote} /root/local_clone")

puts <<-EOS
Master hostname = #{master.hostname}
Please SSH to this host

code_dir = '/etc/puppetlabs/code'
This is the directory that r10k will deploy to

Control Repo local clone = /root/local_clone
This is the local clone of the control repo
When you have make changes don't forget to push your branch upstream before you attempt to deploy

Deploy a single branch
'r10k deploy environment <branch_name>'

Deploy all the branches
'r10k deploy environment'

First challenge: add the motd module to the production env and deploy
1. Create a file /root/local_clone/Puppetfile with the following contents

mod puppetlabs-motd

2. Add the file with git
3. Commit the file with git
4. Push the production branch to the origin remote
5. Use the r10k CLI to deploy the production environment
6. View the module downloaded by r10k in the code-dir
7. Profit!
EOS

require 'pry'; binding.pry