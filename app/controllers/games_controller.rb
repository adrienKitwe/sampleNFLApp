class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  
  
  def show  
  end
  
  def index
    @games = Game.all
  end
  
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    
    if @game.save
      redirect_to @game, notice: "Game was successfully created"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @game.update(game_params)
      redirect_to @game, notice: "Game was successfully updated"
    else
      render 'edit'
    end
  end
  
  def destroy
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed'
  end
  
  private
  
    def set_game
      @game = Game.find(params[:id])
    end
  
    def game_params
      params.require(:game).permit(:superbowl, :winner, :winscore, :opponent, :oppscore, :gamedate, :winconf )
    end
    
    helper_method :admin?
  
    protected
      
    def admin?
      session[:password] == "secrete"
    end
  
    def authorize
      unless admin?
        flash[:error] = "unauthorized access"
        redirect_to root_path
        false
      end
    end
end
