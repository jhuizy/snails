class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end
