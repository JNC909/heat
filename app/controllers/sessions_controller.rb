class SessionsController < ApplicationController
  def new; end

  def create
    if params[:password] == 'TxAMHeat#2k13'
      session[:authenticated] = true
      redirect_to meetings_path, notice: 'Successfully authenticated.'
    else
      flash.now[:alert] = 'Invalid password'
      render :new
    end
  end
end
