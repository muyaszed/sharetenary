class RenameColumnDescInItemToLocation < ActiveRecord::Migration[5.1]
  def change
  	rename_column :items, :desc, :location
  end
end
