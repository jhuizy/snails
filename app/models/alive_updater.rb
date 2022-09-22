class AliveUpdater
  attr_reader :game_people

  def initialize(game_people)
    @game_people = game_people 
  end

  def perform
    GamePerson.where(id: dead_people).update_all(is_alive: false)
  end

  private

  def dead_people
    game_people.reject do |game_person|
      game_person.is_dead? || (game_person.snake[:blocks] & blocks).empty?
    end
  end

  def blocks
    @blocks ||= game_people.flat_map do |game_person|
      game_person.snake[:blocks]
    end
  end
end