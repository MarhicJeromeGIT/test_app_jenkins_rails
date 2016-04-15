# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'test_app_jenkins'
set :repo_url, 'git@github.com:MarhicJeromeGIT/test_app_jenkins_rails.git'
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/apps/#{fetch(:full_app_name)}"

set :full_app_name, "#{fetch(:application)}"

set :default_stage,   'staging'
set :stages,          %w(staging)

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp


set :user,   'prium'
set :use_sudo,        false

set :keep_releases, 2
# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids public/assets}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  
  desc "Symink shared config files"
  task :symlink_config_files do
    run "#{ try sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
  end
end










