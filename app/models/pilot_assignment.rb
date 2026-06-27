class PilotAssignment < ApplicationRecord
  belongs_to :warship
  belongs_to :crew_member
end
