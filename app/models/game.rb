class Game < ApplicationRecord
  HEIGHT = 500
  WIDTH = 500

  include Random
  include Fruit

  has_many :game_people
  has_many :people, through: :game_people
end
