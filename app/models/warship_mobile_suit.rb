class WarshipMobileSuit < ApplicationRecord
  belongs_to :warship
  belongs_to :mobile_suit

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :mobile_suit_id, uniqueness: {
    scope: :warship_id,
    message: "はこの戦艦ですでに購入されています"
  }
  validate :purchase_cost_must_fit_budget

  private

  def purchase_cost_must_fit_budget
    return if warship.blank? || mobile_suit.blank?

    cost = additional_purchase_cost
    return if cost <= 0

    if cost > warship.remaining_budget
      errors.add(:base, "Budget exceeded")
    end
  end

  def additional_purchase_cost
    previous_quantity = quantity_in_database.to_i
    added_quantity = quantity.to_i - previous_quantity

    mobile_suit.purchase_cost.to_i * added_quantity
  end
end
