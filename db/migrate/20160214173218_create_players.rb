class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :games
      t.integer :goals
      t.integer :points
      t.integer :assists
      t.integer :plus
      t.integer :minus
      t.integer :vom

      t.timestamps null: false
    end
  end
end
