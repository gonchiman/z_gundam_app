class CreatePilotAssignments < ActiveRecord::Migration[8.1]
  def change
    create_table :pilot_assignments do |t|
      t.references :warship, null: false, foreign_key: true
      t.references :crew_member, null: false, foreign_key: true
      t.integer :mobile_suit_id

      t.timestamps
    end
  end
end
