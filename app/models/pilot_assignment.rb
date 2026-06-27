class PilotAssignment < ApplicationRecord
  belongs_to :warship
  belongs_to :crew_member
  belongs_to :mobile_suit, optional: true

  validate :crew_member_must_be_pilot_available

  private

  def crew_member_must_be_pilot_available
    return if crew_member.blank?

    unless crew_member.role_type == "pilot_only" || crew_member.role_type == "captain_and_pilot"
      errors.add(:crew_member_id, "must be pilot available")
    end
  end
end