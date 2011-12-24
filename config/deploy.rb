require 'capistrano'
require 'capistrano-vexxhost'

ssh_options[:forward_agent] = true

# Account Settings
set :user, "zoody"
set :password, "Rav8K51z5f"
set :domain, "www.zoodysoft.com"
set :mount_path, "/news439"
set :application, "news439"
set :project, "zoody_news439"
set :applicationdir, "/home/zoody/apps/news439"

set :scm_username, "sivakrishnar"
set :scm_password, "101439siva"
set :repository, "git@github.com:sivakrishnar/zoody_news439.git"
set :scm, :git
role :db, domain, :primary=>true
default_run_options[:pty] = true
set :deploy_via, :remote_cache
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true