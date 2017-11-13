class AddGinIndexToPosts < ActiveRecord::Migration[5.1]
  def change
    add_index :posts, "to_tsvector('russian', title || ' ' || description)", using: :gin, name: 'posts_idx'
  end
end
