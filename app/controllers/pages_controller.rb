class PagesController < ApplicationController
include WelcomeHelper

def welcome
  redirect_to dashboard_path if user_logged_in
  return_page_content(current_user, session[:spotify], session[:fitbit])
end

def dashboard
  redirect_to root_url if !current_user
  refresh_tokens_as_necessary
  @heart_day = current_user.fitbit_data
end

private

def user_logged_in
  current_session_has_login_info
end

def current_user_has_credentials
  (current_user != nil ) && (current_user.fitbit_credential != nil) && (current_user.spotify_credential != nil)
end

def current_session_has_login_info
  ( current_user ) && ( session[:fitbit] ) && ( session[:spotify] )
end

end