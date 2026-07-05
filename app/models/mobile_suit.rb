class MobileSuit < ApplicationRecord
  has_many :pilot_assignments
  has_many :warship_mobile_suits, dependent: :destroy
  has_many :warships, through: :warship_mobile_suits

  has_one_attached :image
end