class User < ActiveRecord::Base
  has_one :spotify_credential
  has_one :fitbit_credential
  has_many :playlists

  def self.login_with_fitbit(auth)
    user = find_or_create_by( name: auth[:info][:name] )
    user.create_or_update_fitbit_credential(auth)
    return user  
  end

  def add_data_from_spotify(auth)
    add_email_to_attributes(auth)
    create_or_update_spotify_credential(auth)
  end

  def create_or_update_fitbit_credential(auth)
    FitbitCredential.find_or_initialize_by( uid: auth[:uid] ).update_attributes!(
                      token: auth[:credentials][:token],
                      refresh_token: auth[:credentials][:refresh_token],
                      expiration_date: Time.at(auth[:credentials][:expires_at].to_i),
                      user_id: id )
  end

  def create_or_update_spotify_credential(auth)
    SpotifyCredential.find_or_initialize_by( uid: auth[:uid] ).update_attributes!(
                      token: auth[:credentials][:token],
                      refresh_token: auth[:credentials][:refresh_token],
                      expiration_date: Time.at(auth[:credentials][:expires_at].to_i),
                      user_id: id )
  end

  def add_email_to_attributes(auth)
    update!( email: auth[:info][:email] )
  end

  def verify_spotify_token
    response = refresh_spotify_token if spotify_credential.expiration_date < DateTime.now
    update_spotify_credentials(response) if response
    return self
  end

  def verify_fitbit_token
    response = refresh_fitbit_token if fitbit_credential.expiration_date < DateTime.now
    update_fitbit_credentials(response) if response
    return self
  end

  def fitbit_data
    raw_data = FitbitService.get_heart_data(fitbit_credential.uid, fitbit_credential.token)
    
    parsed_data = HeartDataParser.new(raw_data)
    response = parsed_data.day_array.last if parsed_data.day_array
  end

  def refresh_spotify_token
    response = SpotifyService.get_refresh_token(spotify_credential.refresh_token)
  end

  def refresh_fitbit_token
    response = FitbitService.get_refresh_token(fitbit_credential.refresh_token)
  end

  def update_spotify_credentials(response)
    spotify_credential.update!(token: response["access_token"], expiration_date: (DateTime.now + 1.hour))
    spotify_credential.update!(refresh_token: response["refresh_token"]) if response['refresh_token']
  end

  def update_fitbit_credentials(response)
    fitbit_credential.update!(token: response["access_token"], expiration_date: (DateTime.now + 1.hour))
    fitbit_credential.update!(refresh_token: response["refresh_token"]) if response['refresh_token']
  end

end
