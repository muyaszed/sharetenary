class AddColumnToSubItem < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_items, :story, :text
  end
end
