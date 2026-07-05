class CrewMember < ApplicationRecord
  has_many :pilot_assignments

  has_one_attached :image
  has_one_attached :captain_warship_image
end
