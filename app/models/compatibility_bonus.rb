class CompatibilityBonus < ApplicationRecord
  belongs_to :crew_member
  belongs_to :mobile_suit

  validates :bonus_power, numericality: { only_integer: true }
  validates :crew_member_id, uniqueness: { scope: :mobile_suit_id }
end
