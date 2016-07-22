Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit_oauth2, ENV['FITBIT_ID'], ENV['FITBIT_SECRET'], redirect_uri: 'http://localhost:8080/auth/fitbit_oauth2/callback', scope: 'activity location settings weight profile heartrate sleep'
  provider :spotify, ENV['SPOTIFY_ID'], ENV['SPOTIFY_SECRET'], redirect_uri: 'https://localhost:8080/auth/spotify/callback', scope: 'playlist-read-private playlist-modify-private playlist-modify-public streaming user-read-email user-top-read'
end