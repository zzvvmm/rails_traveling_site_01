class Review < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :hastag_posts, dependent: :destroy
  has_many :hastag, throuh: :hastag_posts
end
