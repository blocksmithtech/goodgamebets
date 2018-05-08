class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
    @amount = @user.balance
    @active_bets = current_user.bets.joins(:game).where(games: { played_at: nil })
    @past_bets = current_user.bets.joins(:game).where('games.played_at != ?', nil)
  end

end
