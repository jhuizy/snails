class Game < ApplicationRecord
  HEIGHT = 500
  WIDTH = 500

  has_many :game_people
  has_many :people, through: :game_people
end
