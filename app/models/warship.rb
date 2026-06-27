class Warship < ApplicationRecord
  belongs_to :captain, class_name: "CrewMember", optional: true

  has_many :pilot_assignments, dependent: :destroy
end