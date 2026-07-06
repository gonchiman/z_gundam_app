class AddExplanationToCrewMembers < ActiveRecord::Migration[8.1]
  def change
    add_column :crew_members, :explanation, :text
  end
end
