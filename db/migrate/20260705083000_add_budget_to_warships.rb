class AddBudgetToWarships < ActiveRecord::Migration[8.1]
  def change
    add_column :warships, :budget, :integer, default: 1000000, null: false
  end
end
