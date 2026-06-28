class CrewMember < ApplicationRecord
  has_many :pilot_assignments

  has_one_attached :image
end