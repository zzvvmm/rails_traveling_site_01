class CreateHastags < ActiveRecord::Migration[5.2]
  def change
    create_table :hastags do |t|
      t.string :title

      t.timestamps
    end
  end
end
