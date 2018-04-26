class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team'
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner'

  has_many :bets
  has_many :users, through: :bets
end
