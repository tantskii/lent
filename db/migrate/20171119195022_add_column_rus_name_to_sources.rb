class AddColumnRusNameToSources < ActiveRecord::Migration[5.1]
  def change
    add_column :sources, :rus_name, :string
  end
end
