class UserMailer < ApplicationMailer

  def reward_notification
    @bet = Bet.includes(:game, :user, :team).where(id: params[:bet_id]).take!
    mail(to: @bet.user.email, subject: "Reward for you bet on #{@bet.team.name}")
  end
end
