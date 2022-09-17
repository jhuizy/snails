class Game < ApplicationRecord
  has_many :game_people
  has_many :people, through: :game_people
end
