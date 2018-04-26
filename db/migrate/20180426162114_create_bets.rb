class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :amount
      t.integer :team_id

      t.timestamps
    end
  end
end
