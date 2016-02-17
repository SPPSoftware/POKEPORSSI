class Player < ActiveRecord::Base
  has_many :player_associations

  has_many :game_scores, :through => :player_associations
  has_many :game_player_scores, :through => :player_associations
  has_many :season_player_scores, :through => :player_associations
end
