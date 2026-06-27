class CreateCrewMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :crew_members do |t|
      t.string :name
      t.string :gender
      t.string :rank
      t.string :role_type

      t.timestamps
    end
  end
end
