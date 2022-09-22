class Games::PlayController < ApplicationController
  before_action :load_game

  def index
  end

  private

  def load_game
    @game = Game.find(params[:game_id])
    @game_person = @game.game_people.find(params[:game_person_id])
  end
end
