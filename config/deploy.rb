# config valid for current version and patch releases of Capistrano
lock "~> 3.13.0"

set :application, 'pipelinetracker'

set :repo_url, 'git@github.pie.apple.com:cervera/pipelinetracker.git'

set :ssh_options, { :forward_agent => true }
#set :ssh_options, { :forward_agent => false }

# Default branch is :master
set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/pipelinetracker'
set :keep_releases, 5

# Set the rails environment to production
set :rails_env, 'production'

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

#From old deploy.rb file, not sure if they work in new format
# set :ssh_options, { :forward_agent => true }
# set :user, "adm1n"
# set :group, "adm1n"
set :use_sudo, false
#set :shared_children, shared_children + %w{public/uploads}


# Default value for :linked_files is []
set :linked_files, %w{config/master.key}
# set :linked_files, %w{config/database.yml}
# set :linked_files, %w{config/application.yml, config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# capistrano-rvm
#set :rvm_type, :system                     # Defaults to: :auto
#set :rvm_ruby_version, '2.3.4-p310'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here
      # run "cp #{shared_path}/config/database.yml #{latest_release}/config/"
      # execute :ln "-sf #{current_path}/public/ #{deploy_to}"
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end



  # desc 'Runs rake db:seed for SeedMigrations data'
  # task :seed => [:set_rails_env] do
  #   on primary fetch(:migration_role) do
  #     within release_path do
  #       with rails_env: fetch(:rails_env) do
  #         execute :rake, "db:seed"
  #       end
  #     end
  #   end
  # end

  # after 'deploy:migrate', 'deploy:seed'

  

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      #within release_path do
        #execute :rake, 'cache:clear'
      #end
    end
  end

end

