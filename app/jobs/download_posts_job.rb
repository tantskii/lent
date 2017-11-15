class DownloadPostsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    num = Post.download_posts

    puts "Job is done #{num}"
  end
end