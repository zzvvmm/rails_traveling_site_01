class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.integer :trip_id
      t.integer :place_id
    end
  end
end
