class Game < ApplicationRecord
  belongs_to :player_one, class_name: 'Person'
  belongs_to :player_two, class_name: 'Person'
end
