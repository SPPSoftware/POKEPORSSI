class GoaliesController < ApplicationController
before_action :require_user, only: [:edit, :update, :destroy, :new, :create]
  def index
    @goalies = Goalie.all
  end

  def show
  end

  def edit
    @goalie = Goalie.find(params[:id])
  end

  def update
    @goalie = Goalie.find(params[:id])

    if @goalie.update(goalie_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def new
  end

  def create
    @goalie = Goalie.create(goalie_params)

    if @goalie.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @goalie = Goalie.find(params[:id])
    @goalie.destroy

    redirect_to root_url
  end

  private
    def goalie_params
      params.require(:goalie).permit(:name, :games, :saves, :assists, :wins, :ties, :losses)
    end
end
