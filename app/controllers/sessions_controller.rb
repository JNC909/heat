class SessionsController < ApplicationController
  def new
    @meetings = Meeting.all
    @events = Event.all
    @links = Link.all
  end

  def create
    @meetings = Meeting.all
    @events = Event.all
    @links = Link.all
    if params[:password] == 'TxAMHeat#2k13'
      session[:authenticated] = true
      redirect_to meetings_path, notice: 'Successfully authenticated.'
    else
      flash.now[:alert] = 'Invalid password'
      render :new
    end
  end

  def update_password
    if current_user && params[:oldPassword] == current_user.password
      if params[:newPassword] == params[:confirmNewPassword]
        current_user.password = params[:newPassword]
        if current_user.save
          redirect_to root_path, notice: 'Password updated successfully.'
        else
          redirect_to change_password_path, alert: 'Failed to update password.'
        end
      else
        redirect_to change_password_path, alert: 'New passwords do not match.'
      end
    else
      redirect_to change_password_path, alert: 'Old password is incorrect.'
    end
  end  

  def change_password
    redirect_to new_user_session_path unless current_user
  end
end
