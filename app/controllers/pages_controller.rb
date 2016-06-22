class PagesController < ApplicationController
include WelcomeHelper

def welcome
  redirect_to dashboard_path if user_logged_in
  return_page_content(current_user, session[:spotify], session[:fitbit])
end

def dashboard
  redirect_to root_url if !current_user
  @heart_day = current_user.fitbit_data
end

private

def user_logged_in
  current_user && session[:spotify_login] && session[:fitbit_login]
end

end