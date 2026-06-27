class CreateMobileSuits < ActiveRecord::Migration[8.1]
  def change
    create_table :mobile_suits do |t|
      t.string :name
      t.references :warship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
