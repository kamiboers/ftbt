module WelcomeHelper

def return_page_content(user, spotify_logged_in, fitbit_logged_in)
  name = ", #{user.name}" if user
  fitbit_content if !fitbit_logged_in
  spotify_content(name) if fitbit_logged_in
end

def spotify_content(name=nil)
    @title = "Hey#{name}"
    @link_text = "Please sign into "
    @link_image = "spotify-sym.png"
    @path = "/auth/spotify"
    @name = " Spotify"
    @link_size = "30"
end

def fitbit_content
    @title = "Welcome to Fitbeat"
    @link_text = "Sign in with "
    @link_image = "fitbit-sym.png"
    @path = "/auth/fitbit_oauth2"
    @name = " Fitbit"
    @link_size = "70"
end

end