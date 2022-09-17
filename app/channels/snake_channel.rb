class SnakeChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "snake_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    GameJob.perform_later(Game.last.id)
  end
end
