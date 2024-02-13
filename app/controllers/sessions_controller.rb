class SessionsController < ApplicationController
  def new
    
  end

  def create
    if params[:session][:username] == "admin" && params[:session][:password] == "password"
      session[:user_id] = 1
      redirect_to root_path, notice: 'Login successful!'
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'Logged out successfully.'
  end
end
