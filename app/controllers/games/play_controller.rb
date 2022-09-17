class Games::PlayController < ApplicationController
  before_action :load_game

  def index
  end

  def create
    direction = params[:direction]
    player_id = params[:person_id]
    @game.move!(player_id, direction)
    ActionCable.server.broadcast('snake_channel', message: (render @person))
    head :ok
  end

  private

  def load_game
    @game = Game.find(params[:game_id])
  end
end
