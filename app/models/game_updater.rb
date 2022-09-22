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
    move!
    update_alive!
  end

  def update_alive!
    AliveUpdater.new(game_people).perform
  end

  def move!
    game_people.find_each do |game_person|
      game_person.tap(&:move).save!
    end
  end

  def game_json
    game_people.select(&:is_alive?).map do |game_person|
      { name: game_person.person_name, color: game_person.color, snake: game_person.snake }
    end.to_json
  end

  def game_people
    game.game_people
  end

  def game
    Game.includes(:game_people).find(game_id)
  end
end