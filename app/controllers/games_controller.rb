class GamesController < ApplicationController
  def index
    @active_games = Game.where('closes_at > ?', Time.zone.now)
    @closed_games = []
    @past_games = []
  end
end
