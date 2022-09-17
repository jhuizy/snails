class GameJob < ApplicationJob
  queue_as :default

  def perform(game)
    GameUpdater.new(game).perform
  end
end
