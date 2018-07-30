class Trip < ApplicationRecord
  belongs_to :place, foreign_key: "destination_id"

  has_many :participations, dependent: :destroy
  has_many :members, through: :participations,
    class_name: User.name, foreign_key: "user_id"

  accepts_nested_attributes_for :place, reject_if: :all_blank

  validates :name, presence: true, length:
    {maximum: Settings.trip.name.maximum}
end
