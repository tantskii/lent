class AddIndexToSources < ActiveRecord::Migration[5.1]
  def change
    add_index :sources, :name, unique: true
    add_index :sources, :link, unique: true
  end
end
