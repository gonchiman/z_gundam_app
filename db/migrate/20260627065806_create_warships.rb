class CreateWarships < ActiveRecord::Migration[8.1]
  def change
    create_table :warships do |t|
      t.string :name
      t.integer :captain_id

      t.timestamps
    end
  end
end
