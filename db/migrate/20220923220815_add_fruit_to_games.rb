class AddFruitToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :fruit, :text
  end
end
