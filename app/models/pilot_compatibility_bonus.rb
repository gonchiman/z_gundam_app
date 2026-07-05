class PilotCompatibilityBonus < ApplicationRecord
  belongs_to :source_crew_member, class_name: "CrewMember"
  belongs_to :target_crew_member, class_name: "CrewMember"

  validates :bonus_power, numericality: { only_integer: true }
  validates :source_crew_member_id, uniqueness: { scope: :target_crew_member_id }
end
