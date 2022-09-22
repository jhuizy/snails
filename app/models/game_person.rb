class GamePerson < ApplicationRecord
  include Snake

  belongs_to :game
  belongs_to :person

  delegate :name, to: :person, prefix: true

  def is_dead?
    !is_alive?
  end
end
