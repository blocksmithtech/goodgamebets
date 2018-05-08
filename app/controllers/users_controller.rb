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
    now = Time.zone.now
    @amount = @user.balance
    @active_games = Game.where('closes_at > ?', now)
    @active_bets = current_user.bets
  end

end
