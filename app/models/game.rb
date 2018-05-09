class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id', optional: true

  has_many :bets
  has_many :users, through: :bets

  enum state: { created: 0, archived: 1, completed: 2 }
end
