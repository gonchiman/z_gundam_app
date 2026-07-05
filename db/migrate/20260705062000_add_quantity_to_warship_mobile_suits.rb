class AddQuantityToWarshipMobileSuits < ActiveRecord::Migration[8.1]
  def change
    add_column :warship_mobile_suits, :quantity, :integer, null: false, default: 1
  end
end
