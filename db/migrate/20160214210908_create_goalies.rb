class CreateGoalies < ActiveRecord::Migration
  def change
    create_table :goalies do |t|
      t.string :name
      t.integer :games
      t.integer :saves
      t.integer :assists
      t.integer :wins
      t.integer :ties
      t.integer :losses

      t.timestamps null: false
    end
  end
end
