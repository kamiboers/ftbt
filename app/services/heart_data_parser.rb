class HeartDataParser
  attr_reader :day_array

  def initialize(data)
      data = JSON.parse(data.body)
      
      parse_data(data['activities-heart']) if data && data['activities-heart']
  end

  def parse_data(data)
    
    @day_array = data.map { |day| FitbitDay.new(day) if day_data_exists?(day) }.compact
  end

  def day_data_exists?(day)
    day['value']['heartRateZones'].last['caloriesOut'] && day['value']['restingHeartRate']
  end

end