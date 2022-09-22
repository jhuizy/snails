class SnakeChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "snake_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    game_id = data['gameId']
    game_person_id = data['gamePersonId']
    if data['alive'].present? 
      GameJob.perform_later(game_id)
    elsif direction = data['direction']
      GamePerson.find(game_person_id).update(direction: direction.to_sym)
      GameJob.perform_later(game_id)
    elsif data['reset'].present?
      GamePerson.find(game_person_id).tap(&:reset).save!
    end
  end
end
