# require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :stages, %w(production)
set :default_stage, "production"
set :repository,  "git@github.com:balticit/velican.git"
set :scm, :git
set :application, "velican"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

role :web, "velican.bender.srv.balticit.ru"
role :app, "velican.bender.srv.balticit.ru"
role :db,  "velican.bender.srv.balticit.ru", :primary => true

set :user, 'rvm_user'
set :deploy_via, :remote_cache
set :use_sudo, false

set :rvm_type, :user
set :rvm_ruby_string, 'ruby-1.9.3-head'
require "rvm/capistrano"

set :deploy_to, "/var/www/#{application}"
set :rails_env, "production"
set :branch, "master"
set :keep_releases, 10

after "deploy:restart","deploy:cleanup"

before "bundle:install", "deploy:remove_assets_folder"
before "deploy:finalize_update", "shared:symlinks"
after "shared:symlinks", "db:create"
before "unicorn:reload", "unicorn:stop"

if ENV['test']
  after "deploy:update_code", 'unicorn:stop'
  after "deploy:update_code", "db:load_sample"
end

namespace :deploy do
  task :remove_assets_folder, roles: :app do
    run "cd #{latest_release} && rm -rf public/assets && mkdir public/assets"
  end
end

namespace :shared do
  task :symlinks, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
    run "ln -nfs #{shared_path}/config/rvmrc #{latest_release}/.rvmrc"
  end
end

namespace :db do
  task :create, :roles => :app do
    run "cd #{latest_release}; RAILS_ENV=#{rails_env} bundle exec rake db:create"
  end

  task :seed, :roles => :app do
    run "cd #{latest_release}; RAILS_ENV=#{rails_env} bundle exec rake db:seed"
  end

  task :load_sample, :roles => :app do
    run "cd #{latest_release}; RAILS_ENV=#{rails_env} bundle exec rake db:drop db:create db:migrate db:seed db:load_sample --trace"
  end
end


require 'capistrano-unicorn'

namespace :unicorn do
  desc 'Reload unicorn'
  task :reload, :roles => :app, :except => {:no_release => true} do
    config_path = "#{current_path}/config/unicorn/#{rails_env}.rb"
    if remote_file_exists?(unicorn_pid)
      logger.important("Stopping...", "Unicorn")
      run "kill -s USR2 `cat #{unicorn_pid}`"
    else
      logger.important("No PIDs found. Starting Unicorn server...", "Unicorn")
      if remote_file_exists?(config_path)
        run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec unicorn -c #{config_path} -E #{rails_env} -D"
      else
        logger.important("Config file for \"#{unicorn_env}\" environment was not found at \"#{config_path}\"", "Unicorn")
      end
    end
  end
end
