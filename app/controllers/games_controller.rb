class GamesController < ApplicationController
  def index
    now = Time.zone.now
    @active_games = Game.where('closes_at > ?', now)
    @closed_games = Game.where('closes_at < ?', now).where.not(state: :completed)
    @past_games = Game.where(state: :completed)
  end

  def show
    @game = Game.find(params[:id])
    @user_bets = Bet.where(game: @game, user: current_user) if current_user
  end
end
