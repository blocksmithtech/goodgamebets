#
class Bet < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :team

  enum state: { placed: 0, lost: 1, won: 2 }
end
