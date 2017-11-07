class CreateSourcesUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :sources, :users do |t|
      t.index :source_id
      t.index :user_id
    end
  end
end
