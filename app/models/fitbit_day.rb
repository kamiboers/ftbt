class FitbitDay
  attr_reader :date, :rest, :low, :med, :high, :rest_rate
  
  def initialize(day)
    @date = Date.parse(day['dateTime'])
    @rest = day['value']['heartRateZones'].first['caloriesOut'].to_i
    @low = day['value']['heartRateZones'][1]['caloriesOut'].to_i
    @med = day['value']['heartRateZones'][2]['caloriesOut'].to_i
    @high = day['value']['heartRateZones'].last['caloriesOut'].to_i
    @rest_rate = day['value']['restingHeartRate']
  end

end