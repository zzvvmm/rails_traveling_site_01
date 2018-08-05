class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
      t.string :topic
      t.integer :slug

      t.timestamps
    end
  end
end
