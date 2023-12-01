class ScoreUpdatesChannel < ApplicationCable::Channel
  def subscribed
     stream_from "score_updates"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
