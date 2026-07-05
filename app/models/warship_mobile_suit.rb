class WarshipMobileSuit < ApplicationRecord
  belongs_to :warship
  belongs_to :mobile_suit

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :mobile_suit_id, uniqueness: {
    scope: :warship_id,
    message: "はこの戦艦ですでに購入されています"
  }
end
