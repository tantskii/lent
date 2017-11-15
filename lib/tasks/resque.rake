require 'resque/tasks'
require 'resque/scheduler/tasks'
require "#{Rails.root}/app/workers/download_posts.rb"

task "resque:setup" => :environment

namespace :resque do
  task :setup_schedule => :setup do
    require 'resque-scheduler'
    
    Resque.schedule = {
      DownloadPosts: {
        every: '2h',
      }
    }
    # Resque.schedule = YAML.load_file('config/scheduler.yml')
  end

  # somehow scheduler task need to be separated from setup_scheduler
  task :scheduler => :setup_schedule
end