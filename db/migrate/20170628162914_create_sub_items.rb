class CreateSubItems < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_items do |t|
      t.string :start_time
      t.string :end_time
      t.string :attraction
      t.string :duration
      t.string :cost
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
