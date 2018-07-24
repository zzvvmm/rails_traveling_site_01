class HastagPost < ApplicationRecord
  belongs_to :hastag
  belongs_to :review
end
