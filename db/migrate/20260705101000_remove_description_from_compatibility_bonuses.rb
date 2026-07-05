class RemoveDescriptionFromCompatibilityBonuses < ActiveRecord::Migration[8.1]
  def change
    remove_column :compatibility_bonuses, :description, :string if column_exists?(:compatibility_bonuses, :description)
  end
end
