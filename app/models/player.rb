class Player < ApplicationRecord
  after_update :broadcast_score_update

  def broadcast_score_update
    ActionCable.server.broadcast('score_updates', { player_id: id, batting_stats: batting_stats, bowling_stats: bowling_stats })
  end
end
