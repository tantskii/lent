class AddBtreeIndexToSources < ActiveRecord::Migration[5.1]
  def change
    add_index :sources, 'lower(name) varchar_pattern_ops', name: 'sources_on_name_idx'
  end
end
