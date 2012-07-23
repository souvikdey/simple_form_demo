set :application, "simple_form_demo"

# RVM integration
# http://beginrescueend.com/integration/capistrano/
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, "ruby-1.9.3-p194"
set :rvm_type, :user

# Bundler integration (bundle install)
# http://gembundler.com/deploying.html
require "bundler/capistrano"
set :bundle_without,  [:development, :test]

set :user, "deploy"
set :deploy_to, "/var/www/apps/#{application}"
set :use_sudo, false

# Must be set for the password prompt from git to work
# http://help.github.com/deploy-with-capistrano/
default_run_options[:pty] = true
set :scm, :git
set :repository, "git@github.com:andrebras/#{application}.git"
set :branch, "master"
set :deploy_via, :remote_cache

# Multiple Stages Without Multistage Extension
# https://github.com/capistrano/capistrano/wiki/2.x-Multiple-Stages-Without-Multistage-Extension
desc "Deploy using internal address"
task :internal do
  server "192.168.3.21", :app, :web, :db, :primary => true
end

desc "Deploy using external address"
task :external do
  server "XXX.XXX.XXX.XXX", :app, :web, :db, :primary => true
end

# http://modrails.com/documentation/Users%20guide%20Nginx.html#capistrano
namespace :deploy do
  desc "Start server"
  task :start, :roles => :app do
    run "#{try_sudo} touch #{File.join(release_path,'tmp','restart.txt')}"
  end

  # not supported by Passenger server
  task :stop, :roles => :app do
  end

  desc "Restart server"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(release_path,'tmp','restart.txt')}"
  end

  desc "Symlink shared configs and folders on each release."
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    #run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end

  desc "Execute migrations"
  task :migrate, :roles => :db do
    run "bundle exec rake db:migrate"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'

