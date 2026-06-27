class PilotAssignment < ApplicationRecord
  belongs_to :warship
  belongs_to :crew_member
  belongs_to :mobile_suit, optional: true
end