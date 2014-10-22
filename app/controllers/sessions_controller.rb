class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    session[:password] = params[:password]
    if session[:password] == "secrete"
      redirect_to root_path, notice: "Successfully logged in"
    else
      flash.now.alert = "Password is invalid"
      render "new"
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path, notice: "Successfully logged out"
  end
    
end
