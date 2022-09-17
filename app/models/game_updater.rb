class GameUpdater
  attr_reader :game_id

  def initialize(game_id)
    @game_id = game_id
  end

  def perform
    update
    notify
  end

  private

  def notify
    ActionCable.server.broadcast "snake_channel", message: game_json 
  end

  def update
    game_people.find_each do |game_person|
      game_person.tap(&:move).save!
    end
  end

  def game_json
    game_people.map do |game_person|
      [{ name: game_people.person_name, color: game_people.color, snake: game_people.snake }]
    end.to_json
  end

  def game_people
    game.game_people
  end

  def game
    Game.includes(:game_people).find(game_id)
  end
end