class AddUserToWarships < ActiveRecord::Migration[8.1]
  def change
    add_reference :warships, :user, foreign_key: true
  end
end
