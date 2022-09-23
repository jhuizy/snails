class GamePerson
  module Snake
    extend ActiveSupport::Concern

    included do
      serialize :snake, Hash
      enum direction: %i(up down left right)

      validates :direction, presence: true
      validates :color, presence: true
      validates :snake, presence: true

      after_initialize :set_defaults, if: :new_record?
    end

    def move
      add_new_block
      remove_last_block
    end

    def eat
      add_new_block
    end

    def reset
      set_defaults
    end

    def in_bounds?
      last_block[:x] < Game::WIDTH && last_block[:x] > 0 && last_block[:y] < Game::HEIGHT && last_block[:y] > 0
    end

    private

    def set_defaults
      assign_attributes(
        snake: { blocks: [{x: game.next_x, y: game.next_y}] },
        direction: :down,
        color: '#000000',
        is_alive: true
      )
    end

    def remove_last_block
      blocks.pop
    end

    def add_new_block
      blocks.unshift(next_block) 
    end

    def next_block
      { x: first_block[:x] + next_x, y: first_block[:y] + next_y }
    end
    
    def first_block
      @first_block ||= blocks.first
    end

    def last_block
      @last_block ||= blocks.last
    end

    def next_x
      {
        up: 0,
        down: 0,
        left: -10,
        right: 10
      }[direction.to_sym]
    end

    def next_y
      {
        up: -10,
        down: 10,
        left: 0,
        right: 0
      }[direction.to_sym]
    end

    def blocks
      @blocks ||= snake[:blocks]
    end
  end
end