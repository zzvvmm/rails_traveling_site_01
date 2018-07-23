class Trip < ApplicationRecord
  belongs_to :place

  has_many :participations, dependent: :destroy
  has_many :members, through: :participations,
    class_name: User.name, foreign_key: "user_id"
end
