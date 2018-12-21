class AddIndextoEmail < ActiveRecord::Migration[5.2]
  def change
  end
  add_index :users, :email, unique: true
end
