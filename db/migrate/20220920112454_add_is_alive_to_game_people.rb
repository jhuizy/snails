class AddIsAliveToGamePeople < ActiveRecord::Migration[6.1]
  def change
    add_column :game_people, :is_alive, :boolean, null: false, default: true
  end
end
