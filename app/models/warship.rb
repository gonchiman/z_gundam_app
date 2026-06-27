class Warship < ApplicationRecord
  belongs_to :captain, class_name: "CrewMember", optional: true

  has_many :mobile_suits
  has_many :pilot_assignments
end