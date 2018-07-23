class Hastag < ApplicationRecord
  has_many :hastag_posts, dependent: :destroy
  has_many :review, throuh: :hastag_posts
end
