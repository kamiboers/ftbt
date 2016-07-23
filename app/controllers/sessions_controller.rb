class SessionsController < ApplicationController

  def create
    current_user = User.login_with_fitbit(request.env['omniauth.auth'])
    session[:user_id] = current_user.id
    session[:fitbit] = true
    redirect_to root_url
  end

  def complete
    current_user.add_data_from_spotify(request.env['omniauth.auth'])
    session[:user_id] = current_user.id
    session[:spotify] = true
    redirect_to dashboard_path, success: "Welcome to Fitbeat, #{current_user.name}"
  end

  def destroy
    session.clear
    redirect_to root_url, notice: "Successfully Signed Out"
  end

end