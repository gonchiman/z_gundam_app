class CreateCompatibilityBonuses < ActiveRecord::Migration[8.1]
  def change
    create_table :compatibility_bonuses do |t|
      t.references :crew_member, null: false, foreign_key: true
      t.references :mobile_suit, null: false, foreign_key: true
      t.integer :bonus_power, null: false, default: 0
      t.string :description

      t.timestamps
    end

    add_index :compatibility_bonuses,
      [ :crew_member_id, :mobile_suit_id ],
      unique: true,
      name: "index_compatibility_bonuses_on_crew_and_mobile_suit"
  end
end
