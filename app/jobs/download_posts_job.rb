class DownloadPostsJob < ApplicationJob
  queue_as :lent_download_posts

  def perform(*args)
    num = Post.download_posts

    puts "Job is done #{num}"
  end
end