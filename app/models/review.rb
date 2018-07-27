class Review < ApplicationRecord
  belongs_to :user
  scope :order_review, ->{order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  has_many :hastag_posts, dependent: :destroy
  has_many :hastags, through: :hastag_posts
end
