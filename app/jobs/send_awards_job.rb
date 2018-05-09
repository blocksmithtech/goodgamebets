class SendAwardsJob < ApplicationJob
  queue_as :default

  def perform(winners)
    puts 'Starting ordering the transactions'
    bets = Bet.includes(:user, :game).where(id: winners)
    bets.each do |bet|
      ExecuteTransactionJob.perform_later(bet.user.wallet,
                                          bet.game.wallet,
                                          bet.award)
    end
    puts 'All Transactions ordered'
  end
end
