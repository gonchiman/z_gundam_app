class RemoveWarshipFromMobileSuits < ActiveRecord::Migration[8.1]
  def change
    remove_reference :mobile_suits, :warship, null: false, foreign_key: true
  end
end
