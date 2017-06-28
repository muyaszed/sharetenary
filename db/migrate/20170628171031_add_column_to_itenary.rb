class AddColumnToItenary < ActiveRecord::Migration[5.1]
  def change
    add_column :itenaries, :total_cost, :string
  end
end
