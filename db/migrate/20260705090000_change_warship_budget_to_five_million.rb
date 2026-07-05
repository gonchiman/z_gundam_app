class ChangeWarshipBudgetToFiveMillion < ActiveRecord::Migration[8.1]
  def up
    change_column_default :warships, :budget, from: 1000000, to: 5000000
    execute "UPDATE warships SET budget = 5000000"
  end

  def down
    change_column_default :warships, :budget, from: 5000000, to: 1000000
    execute "UPDATE warships SET budget = 1000000"
  end
end
