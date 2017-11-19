class AddIndexesToRusNameToSources < ActiveRecord::Migration[5.1]
  def change
    add_index :sources, 'lower(rus_name) varchar_pattern_ops',
      name: 'sources_on_rus_name_idx'

    add_index :sources, :rus_name, unique: true
  end
end
