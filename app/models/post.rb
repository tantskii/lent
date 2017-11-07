require 'open-uri'

class Post < ApplicationRecord
  belongs_to :source
  
  def self.download_posts
    sources = Source.all

    sources.each do |source|
      Post.create_posts_by(source)
    end
  end

  # TODO сделать эту операцию в один запрос к БД
  def exist_in_db?
    if Post.find_by(title: title, description: description, link: link, 
                    pub_date: pub_date)
      return true
    end
    
    false  
  end  

  private

  def self.create_posts_by(source)
    posts = []
    rss   = SimpleRSS.parse open(source.link)

    rss.items.each do |item|
      posts << self.create_post(item, source.id)
    end

    posts
  end

  def self.create_post(item, source_id)
    item.title       = item.title.force_encoding('utf-8') unless item.title.nil?
    item.link        = item.link.force_encoding('utf-8') unless item.link.nil?
    item.description = item.description.force_encoding('utf-8') unless item.description.nil?

    hash = {
        title:       item.title,
        link:        item.link,
        description: item.description,
        pub_date:    item.pubDate,
        source_id:   source_id
    }

    new_post = Post.new(hash)

    new_post.save unless new_post.exist_in_db?
  end
end
