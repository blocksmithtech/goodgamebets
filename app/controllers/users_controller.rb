require 'digest'

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @pic = Digest::MD5.hexdigest(@user.email.downcase)
    @amount = @user.balance
    @active_bets = current_user.bets.joins(:game).where.not(games: { state: :completed })
    @past_bets = current_user.bets.joins(:game).where(games: { state: :completed })
  end

end
