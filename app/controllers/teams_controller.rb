class TeamsController < ApplicationController
  
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  def index
    @teams = Team.all
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
    
    if @team.save
      redirect_to teams_url
    else 
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @team.update(team_params)
      redirect_to teams_url
    else
      render :edit
    end
  end
  
  def destroy
    @team.destroy
    
    redirect_to teams_url, notice: "Game was successfully destroyed"
  end
  
  private
  
  def set_team
    @team = Team.find(params[:id])
  end
  
  def team_params
    params.require(:team).permit(:teamname, :teamalias)
  end
  
end
