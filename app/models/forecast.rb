class Forecast
  attr_reader :todays_high, :todays_low, :todays_summary, :todays_icon, :tonights_summary, :current_summary, :current_icon, :current_temp, :current_precip_probability, :currently_feels_like, :current_humidity, :current_visibility, :current_uv_index, :hourly_summary, :hourly_icon, :hourly_temp, :hourly_precip_probability, :hourly_apparent_temp, :hourly_humidity, :hourly_visibility, :hourly_uv_index


  def initialize(data = {})
    @todays_high = todays_high
    @todays_low = todays_low
    @todays_summary = data[:hourly][:summary]
    @todays_icon = data[:hourly][:icon]
    @tonights_summary = tonights_summary

    @current_summary = data[:currently][:summary]
    @current_icon = data[:currently][:icon]
    @current_temp = data[:currently][:temperature]
    @current_precip_probability = data[:currently][:precipProbability]
    @currently_feels_like = data[:currently][:apparentTemperature]
    @current_humidity = data[:currently][:humidity]
    @current_visibility = data[:currently][:visibility]
    @current_uv_index = data[:currently][:uvIndex]

    @hourly_summary = data[:hourly][:data][:summary]
    @hourly_icon = data[:hourly][:data][:icon]
    @hourly_temp = data[:hourly][:data][:temperature]
    @hourly_precip_probability = data[:hourly][:data][:precipProbability]
    @hourly_apparent_temp = data[:hourly][:data][:apparentTemperature]
    @hourly_humidity = data[:hourly][:data][:humidity]
    @hourly_visibility = data[:hourly][:data][:visibility]
    @hourly_uv_index = data[:hourly][:data][:uvIndex]
  end

  def todays_high
  end

  def todays_low
  end

  def tonights_summary
  end

end
