class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :begin_id
      t.integer :destination_id
      t.integer :user_id
      t.text :plant
      t.text :expense

      t.timestamps
    end
  end
end
