class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :superbowl
      t.string :winner
      t.integer :winscore
      t.string :opponent
      t.integer :oppscore
      t.date :gamedate

      t.timestamps
    end
  end
end
