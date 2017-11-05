class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.timestamp :pub_date
      t.string :link

      t.timestamps
    end
  end
end
