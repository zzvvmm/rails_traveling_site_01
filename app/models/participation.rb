class Participation < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  enum accepted: {request: 0, join: 1}
end
