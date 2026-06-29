class Warship < ApplicationRecord
  belongs_to :captain, class_name: "CrewMember", optional: true
  belongs_to :user, optional: true

  has_many :pilot_assignments, dependent: :destroy

  has_one_attached :image

  validate :captain_must_be_available

  private

  def captain_must_be_available
    return if captain_id.blank?

    unless captain.role_type == "captain_only" || captain.role_type == "captain_and_pilot"
      errors.add(:captain_id, "must be captain available")
    end
  end
end