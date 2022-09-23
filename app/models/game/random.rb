module Game::Random
  extend ActiveSupport::Concern

  HEIGHT = 500
  WIDTH = 500

  def next_x
    next_random(WIDTH)
  end

  def next_y
    next_random(HEIGHT)
  end

  private

  def next_random(max)
    rand(0..(max / 10)) * 10
  end
end