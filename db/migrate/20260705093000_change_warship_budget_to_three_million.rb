class ChangeWarshipBudgetToThreeMillion < ActiveRecord::Migration[8.1]
  def up
    change_column_default :warships, :budget, from: 5000000, to: 3000000
    execute "UPDATE warships SET budget = 3000000"
  end

  def down
    change_column_default :warships, :budget, from: 3000000, to: 5000000
    execute "UPDATE warships SET budget = 5000000"
  end
end
