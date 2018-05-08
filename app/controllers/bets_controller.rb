#
class BetsController < ApplicationController
  before_action :find_game

  def create
    @team_id = bet_params[:team_id].to_i
    @amount = bet_params[:amount].to_i

    if @game.closes_at < Time.zone.now
      flash[:error] = 'The time period for bets has expired'
      return redirect_to user_path(current_user)
    elsif current_user.balance < @amount
      flash[:error] = 'Insuficient funds'
      return redirect_to user_path(current_user)
    elsif @game.home_team_id != @team_id && @game.away_team_id != @team_id
      flash[:error] = 'Invalid team'
      return redirect_to user_path(current_user)
    end

    result = place_bet
    if result.http_code == 200
      save_bet
    else
      flash[:error] = 'A problem occured while placing the bet. Try again later'
      redirect_to user_path(current_user)
    end
  end

  private

  def bet_params
    params.permit(:game_id, :team_id, :amount, :authenticity_token)
  end

  def find_game
    @game = Game.find(bet_params[:game_id])
    return unless @game.blank?

    flash[:error] = 'Invalid game'
    redirect_to user_path(current_user)
  end

  def place_bet
    transaction_name =
      if @amount == 20
        'Wager High'
      elsif @amount == 5
        'Wager Medium'
      else
        'Wager Low'
      end

    transactions = OSTKitService.new.transactions
    transactions.execute(from_uuid: current_user.wallet,
                         to_uuid: @game.wallet,
                         transaction_kind: transaction_name)
  end

  def save_bet
    Bet.create(user: current_user,
               game: @game,
               amount: @amount,
               team_id: @team_id)
  end
end
