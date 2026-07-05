class WarshipMobileSuit < ApplicationRecord
  belongs_to :warship
  belongs_to :mobile_suit

  validates :mobile_suit_id, uniqueness: {
    scope: :warship_id,
    message: "はこの戦艦ですでに購入されています"
  }
end
