class CreateCaptainCompatibilityBonuses < ActiveRecord::Migration[8.1]
  def change
    create_table :captain_compatibility_bonuses do |t|
      t.references :captain_crew_member, null: false, foreign_key: { to_table: :crew_members }
      t.references :target_crew_member, null: false, foreign_key: { to_table: :crew_members }
      t.integer :bonus_power, null: false, default: 0

      t.timestamps
    end

    add_index :captain_compatibility_bonuses,
      [ :captain_crew_member_id, :target_crew_member_id ],
      unique: true,
      name: "index_captain_compatibility_bonuses_on_captain_and_target"
  end
end
