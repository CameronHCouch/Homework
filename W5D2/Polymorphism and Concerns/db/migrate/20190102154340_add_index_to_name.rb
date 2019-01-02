class AddIndexToName < ActiveRecord::Migration[5.1]
  def change
    add_index :toys, :name, unique: true
  end
end
