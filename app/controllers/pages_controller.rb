class PagesController < ApplicationController

  def index
    @players = Player.all
    @goalies = Goalie.all
  end
end
