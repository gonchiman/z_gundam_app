class AddCostAndPowerToMobileSuits < ActiveRecord::Migration[8.1]
  def change
    add_column :mobile_suits, :purchase_cost, :integer
    add_column :mobile_suits, :combat_power, :integer
  end
end
