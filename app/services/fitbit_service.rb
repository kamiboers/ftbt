class FitbitService

  def self.get_heart_data(uid, token)
    conn = Faraday.new(url: "https://api.fitbit.com") do |f|
      f.request  :url_encoded             # form-encode POST params
      f.response :logger                  # log requests to STDOUT
      f.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|
        req.url "1/user/#{uid}/activities/heart/date/today/1w.json"
        req.headers["Authorization"] = "Bearer #{token}"
    end

  end

  def self.get_refresh_token(token)
    auth_code = Base64.strict_encode64("#{ENV['FITBIT_ID']}:#{ENV['FITBIT_KEY']}")
    HTTParty.post "https://api.fitbit.com/oauth2/token", 
                   headers: {"Authorization" => "Basic #{auth_code}"}, 
                   body:  {grant_type: 'refresh_token', refresh_token: token}
  end
end