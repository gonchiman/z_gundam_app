class CrewMember < ApplicationRecord
  has_many :pilot_assignments
  has_many :compatibility_bonuses, dependent: :destroy
  has_many :source_pilot_compatibility_bonuses,
    class_name: "PilotCompatibilityBonus",
    foreign_key: :source_crew_member_id,
    dependent: :destroy
  has_many :target_pilot_compatibility_bonuses,
    class_name: "PilotCompatibilityBonus",
    foreign_key: :target_crew_member_id,
    dependent: :destroy
  has_many :captain_compatibility_bonuses,
    class_name: "CaptainCompatibilityBonus",
    foreign_key: :captain_crew_member_id,
    dependent: :destroy
  has_many :target_captain_compatibility_bonuses,
    class_name: "CaptainCompatibilityBonus",
    foreign_key: :target_crew_member_id,
    dependent: :destroy

  has_one_attached :image
  has_one_attached :captain_warship_image
end
