class AddConferenceToGames < ActiveRecord::Migration
  def change
    add_column :games, :winconf, :string
  end
end
