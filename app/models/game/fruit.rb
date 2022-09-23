module Game::Fruit
  extend ActiveSupport::Concern

  included do
    serialize :fruit, Hash

    validates :fruit, presence: true
  end

  def respawn
    assign_attributes(
      fruit: { x: next_x, y: next_y }
    )
  end
end