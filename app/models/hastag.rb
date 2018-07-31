class Hastag < ApplicationRecord
  has_many :hastag_posts, dependent: :destroy
  has_many :review, through: :hastag_posts
end
