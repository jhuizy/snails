class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.belongs_to :player_one, null: false, foreign_key: { to_table: :people }
      t.belongs_to :player_two, null: false, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
