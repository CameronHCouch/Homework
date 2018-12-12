class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :address, null: false
      t.string :residents,
      t.timestamps
    end
  end
end
