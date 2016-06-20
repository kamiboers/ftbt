Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit_oauth2, ENV['FITBIT_ID'], ENV['FITBIT_SECRET'], redirect_uri: 'http://localhost:8080/auth/fitbit_oauth2/callback', scope: 'activity location settings weight profile heartrate sleep'
end