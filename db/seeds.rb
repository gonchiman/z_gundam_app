# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"

CSV.foreach(Rails.root.join("db/csv/crew_members.csv"), headers: true, encoding: "bom|utf-8") do |row|
  crew_member = CrewMember.find_or_initialize_by(name: row["name"])

  crew_member.gender = row["gender"]
  crew_member.rank = row["rank"]
  crew_member.role_type = row["role_type"]
  crew_member.hire_cost = row["hire_cost"]
  crew_member.combat_power = row["combat_power"]

  crew_member.save!
end

CSV.foreach(Rails.root.join("db/csv/mobile_suits.csv"), headers: true, encoding: "bom|utf-8") do |row|
  mobile_suit = MobileSuit.find_or_initialize_by(name: row["name"])

  mobile_suit.purchase_cost = row["purchase_cost"].to_i
  mobile_suit.combat_power = row["combat_power"].to_i

  mobile_suit.save!
end

CSV.foreach(Rails.root.join("db/csv/compatibility_bonuses.csv"), headers: true, encoding: "bom|utf-8") do |row|
  crew_member = CrewMember.find_by!(name: row["crew_member_name"])
  mobile_suit = MobileSuit.find_by!(name: row["mobile_suit_name"])

  compatibility_bonus = CompatibilityBonus.find_or_initialize_by(
    crew_member: crew_member,
    mobile_suit: mobile_suit
  )

  compatibility_bonus.bonus_power = row["bonus_power"].to_i

  compatibility_bonus.save!
end
