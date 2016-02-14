class PlayersController < ApplicationController
  before_action :require_user, only: [:edit, :update, :destroy, :new, :create]

  def index
    @players = Player.all
  end

  def show
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def new
  end

  def create
    @player = Player.create(player_params)

    if @player.save
      redirect_to root_url, :notice => "Pelaaja luotu!"
    else
      render 'new'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to root_url
  end

  private
    def player_params
      params.require(:player).permit(:name, :games, :goals, :points, :assists, :plus, :minus, :vom)
    end
end
