class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id', optional: true

  has_many :bets
  has_many :users, through: :bets

  enum state: { created: 0, archived: 1, completed: 2 }

  def generate_awards!
    return if self.completed?
    total_waged = self.bets.sum(:amount)
    winners_total = self.bets.where(team: self.winner).sum(:amount)

    winners = update_own_bets total_waged, winners_total
    SendAwardsJob.perform_later winners
    self.state = :completed
    self.save!
  end

  private

  def update_own_bets(total_waged, winners_total)
    winners = []
    self.bets.each do |bet|
      if bet.team_id == self.winner_id
        share = bet.amount / winners_total
        award = share * total_waged
        bet.state = :won
        bet.award = award
        bet.save!
        winners << bet.id
      else
        bet.state = :lost
        bet.save!
      end
    end
    winners
  end
end
