require 'digest'

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
    @pic = Digest::MD5.hexdigest(@user.email.downcase)
    @amount = @user.balance
    @active_bets = current_user.bets.joins(:game).where.not(games: { state: :completed })
    @past_bets = current_user.bets.joins(:game).where(games: { state: :completed })
  end

end
