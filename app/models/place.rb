class Place < ApplicationRecord
  has_many :trips, foreign_key: "destination_id"
end
