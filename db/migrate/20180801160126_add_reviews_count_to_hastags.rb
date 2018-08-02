class AddReviewsCountToHastags < ActiveRecord::Migration[5.2]
  def change
    add_column :hastags, :reviews_count, :integer, default: 0
  end
end
