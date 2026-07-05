class CreatePilotCompatibilityBonuses < ActiveRecord::Migration[8.1]
  def change
    create_table :pilot_compatibility_bonuses do |t|
      t.references :source_crew_member, null: false, foreign_key: { to_table: :crew_members }
      t.references :target_crew_member, null: false, foreign_key: { to_table: :crew_members }
      t.integer :bonus_power, null: false, default: 0

      t.timestamps
    end

    add_index :pilot_compatibility_bonuses,
      [ :source_crew_member_id, :target_crew_member_id ],
      unique: true,
      name: "index_pilot_compatibility_bonuses_on_source_and_target"
  end
end
