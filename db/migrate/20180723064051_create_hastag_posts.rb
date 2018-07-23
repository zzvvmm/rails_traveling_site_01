class CreateHastagPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hastag_posts do |t|
      t.integer :review_id
      t.integer :hastag_id

      t.timestamps
    end
  end
end
