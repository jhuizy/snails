class CreateGamePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :game_people do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true
      t.text :snake, null: false
      t.integer :direction, null: false
      t.string :color, null: false

      t.timestamps
    end
  end
end
