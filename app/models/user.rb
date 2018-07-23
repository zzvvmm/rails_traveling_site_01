class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :reviews, dependent: :destro
  has_many :trips, through: :participations
end
