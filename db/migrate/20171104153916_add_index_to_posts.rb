class AddIndexToPosts < ActiveRecord::Migration[5.1]
  def change
    add_index :posts, [:title, :description, :pub_date, :link], unique: true
  end
end
