class CreateWarshipMobileSuits < ActiveRecord::Migration[8.1]
  def change
    create_table :warship_mobile_suits do |t|
      t.references :warship, null: false, foreign_key: true
      t.references :mobile_suit, null: false, foreign_key: true

      t.timestamps
    end

    execute <<~SQL.squish
      INSERT INTO warship_mobile_suits (warship_id, mobile_suit_id, created_at, updated_at)
      SELECT DISTINCT warship_id, mobile_suit_id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
      FROM pilot_assignments
      WHERE mobile_suit_id IS NOT NULL
    SQL

    add_index :warship_mobile_suits, [:warship_id, :mobile_suit_id], unique: true
  end
end
