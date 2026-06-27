class MobileSuit < ApplicationRecord
  belongs_to :warship

  has_one :pilot_assignment
end