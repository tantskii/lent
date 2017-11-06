require 'open-uri'

class Post < ApplicationRecord
  
  def self.download_posts
    links = Source.all.map(&:link)

    links.each do |link|
      Post.create_posts_by(link)
    end
  end

  def self.create_posts_by(link)
    posts = []
    rss   = SimpleRSS.parse open(link)

    rss.items.each do |item|
      posts << self.create_post(item)
    end

    posts
  end

  def self.create_post(item)
    item.title       = item.title.force_encoding('utf-8') unless item.title.nil?
    item.link        = item.link.force_encoding('utf-8') unless item.link.nil?
    item.description = item.description.force_encoding('utf-8') unless item.description.nil?

    hash = {
        title:       item.title,
        link:        item.link,
        description: item.description,
        pub_date:    item.pubDate,
    }

    count = 0

    new_post = Post.new(hash)

    new_post.save unless new_post.exist_in_db?
  end

  # TODO сделать эту операцию в один запрос к БД
  def exist_in_db?
    if Post.find_by(title: title, description: description, link: link, pub_date: pub_date)
      return true
    end
    
    false  
  end  
end
