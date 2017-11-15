class DownloadPosts
  @queue = :lent_download_posts

  def self.perform
    num = Post.download_posts

    puts "Job is done #{num}"
  end
end