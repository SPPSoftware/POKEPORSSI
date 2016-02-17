class Goalie < ActiveRecord::Base
  has_many :player_associations

  has_many :game_goalie_scores, :through => :player_associations
  has_many :season_goalie_scores, :through => :player_associations
end
