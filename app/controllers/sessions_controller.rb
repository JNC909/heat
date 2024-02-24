class SessionsController < ApplicationController
  def new
    # This action might be empty if you're just showing the form
  end

  def create
    # Hardcoded check for username and password
    if params[:session][:username] == "admin" && params[:session][:password] == "password"
      # Successful login
      # Here you can set the session or redirect as needed
      session[:user_id] = 1 # Hardcoded user ID, in a real scenario, this would be the user's ID from the database
      flash[:success] = "You have successfully logged in."
      redirect_to root_path # Or whatever path you want to redirect to after login
    else
      # Login failed
      flash.now[:danger] = "Invalid email/password combination."
      render 'new'
    end
  end

  def destroy
    # Log out logic
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
end

