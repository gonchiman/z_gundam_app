class CaptainCompatibilityBonus < ApplicationRecord
  self.table_name = "captain_compatibility_bonuses"

  belongs_to :captain_crew_member, class_name: "CrewMember"
  belongs_to :target_crew_member, class_name: "CrewMember"

  validates :bonus_power, numericality: { only_integer: true }
  validates :captain_crew_member_id, uniqueness: { scope: :target_crew_member_id }
end
