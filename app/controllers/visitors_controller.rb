class VisitorsController < ApplicationController

  def index
    @game = Game.where("closes_at > ?", Time.zone.now).take
  end
end
