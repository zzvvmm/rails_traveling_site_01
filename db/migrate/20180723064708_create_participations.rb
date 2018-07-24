class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :trip_id
      t.column :accepted, :integer, default: 0

      t.timestamps
    end
  end
end
