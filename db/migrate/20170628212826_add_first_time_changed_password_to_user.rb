class AddFirstTimeChangedPasswordToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :first_time_password_changed, :boolean, default: false
  end
end
