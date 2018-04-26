class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :wallet
      t.datetime :closes_at
      t.datetime :played_at
      t.string :gametype
      t.string :stream_url
      t.integer :home_team
      t.integer :away_team
      t.integer :winner

      t.timestamps
    end
  end
end
