class Person < ApplicationRecord
  has_many :game_people
  has_many :games, through: :game_people

  validates :name, presence: true
end
