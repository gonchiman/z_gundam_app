class AddCostAndPowerToCrewMembers < ActiveRecord::Migration[8.1]
  def change
    add_column :crew_members, :hire_cost, :integer
    add_column :crew_members, :combat_power, :integer
  end
end
