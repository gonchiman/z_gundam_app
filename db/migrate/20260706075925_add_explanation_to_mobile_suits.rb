class AddExplanationToMobileSuits < ActiveRecord::Migration[8.1]
  def change
    add_column :mobile_suits, :explanation, :text
  end
end
