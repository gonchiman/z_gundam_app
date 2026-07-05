class Warship < ApplicationRecord
  belongs_to :captain, class_name: "CrewMember", optional: true
  belongs_to :user, optional: true

  has_many :pilot_assignments, dependent: :destroy
  has_many :warship_mobile_suits, dependent: :destroy
  has_many :mobile_suits, through: :warship_mobile_suits

  has_one_attached :image
  has_one_attached :main_image  # 詳細ページ用

  validate :captain_must_be_available
  validate :total_cost_must_not_exceed_budget

  def total_combat_power
    pilot_assignments.includes(:crew_member, :mobile_suit).sum(&:combat_power)
  end

  def captain_cost
    captain&.hire_cost.to_i
  end

  def pilot_cost
    pilot_assignments.includes(:crew_member).sum do |pilot_assignment|
      pilot_assignment.crew_member.hire_cost.to_i
    end
  end

  def mobile_suit_cost
    warship_mobile_suits.includes(:mobile_suit).sum do |warship_mobile_suit|
      warship_mobile_suit.mobile_suit.purchase_cost.to_i * warship_mobile_suit.quantity.to_i
    end
  end

  def total_cost
    captain_cost + pilot_cost + mobile_suit_cost
  end

  def remaining_budget
    budget.to_i - total_cost
  end

  private

  def captain_must_be_available
    return if captain_id.blank?

    unless captain.role_type == "captain_only" || captain.role_type == "captain_and_pilot"
      errors.add(:captain_id, "must be captain available")
    end
  end

  def total_cost_must_not_exceed_budget
    if total_cost > budget.to_i
      errors.add(:base, "Budget exceeded")
    end
  end
end
