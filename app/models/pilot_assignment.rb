class PilotAssignment < ApplicationRecord
  belongs_to :warship
  belongs_to :crew_member
  belongs_to :mobile_suit, optional: true

  validate :crew_member_must_be_pilot_available
  validate :mobile_suit_must_be_available_for_warship
  validate :hire_cost_must_fit_budget
  validates :crew_member_id, uniqueness: {
    scope: :warship_id,
    message: "はこの戦艦にすでに登録されています"
  }

  def combat_power
    return 0 if mobile_suit.blank?

    crew_member.combat_power.to_i + mobile_suit.combat_power.to_i
  end

  private

  def crew_member_must_be_pilot_available
    return if crew_member.blank?

    unless crew_member.role_type == "pilot_only" || crew_member.role_type == "captain_and_pilot"
      errors.add(:crew_member_id, "must be pilot available")
    end
  end

  def mobile_suit_must_be_available_for_warship
    return if mobile_suit_id.blank? || warship.blank?

    warship_mobile_suit = warship.warship_mobile_suits.find_by(mobile_suit_id: mobile_suit_id)

    if warship_mobile_suit.blank?
      errors.add(:mobile_suit_id, "must be purchased by this warship")
      return
    end

    assigned_count = warship.pilot_assignments
      .where(mobile_suit_id: mobile_suit_id)
      .where.not(id: id)
      .count

    if assigned_count >= warship_mobile_suit.quantity
      errors.add(:mobile_suit_id, "is not available")
    end
  end

  def hire_cost_must_fit_budget
    return if warship.blank? || crew_member.blank?

    if additional_hire_cost > warship.remaining_budget
      errors.add(:base, "Budget exceeded")
    end
  end

  def additional_hire_cost
    previous_crew_member = CrewMember.find_by(id: crew_member_id_in_database)
    crew_member.hire_cost.to_i - previous_crew_member&.hire_cost.to_i
  end
end
