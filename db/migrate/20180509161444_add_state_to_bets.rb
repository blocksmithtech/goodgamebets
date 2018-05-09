class AddStateToBets < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :state, :integer, default: 0
    add_column :bets, :award, :integer, default: 0
  end
end
