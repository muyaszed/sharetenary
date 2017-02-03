class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :day
      t.text :desc
      t.belongs_to :itenary, index: true
      t.timestamps
    end
  end
end
