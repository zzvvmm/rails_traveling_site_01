class User < ApplicationRecord
  has_many :chatrooms, through: :messages
  has_many :comments, dependent: :destroy
  has_many :messages
  has_many :participations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :trips, through: :participations
end
