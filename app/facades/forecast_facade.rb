class ForecastFacade

  def initialize(location)
    @location = location
  end

  def forecast_data
    forecast_service.forecast_data
  end

  def forecast
    attrs = {todays_high: todays_high,
    todays_low: todays_low,
    todays_summary: [:hourly][:summary],
    todays_icon: [:hourly][:icon],
    tonights_summary: tonights_summary,
    current_summary: [:currently][:summary],
    current_icon: [:currently][:icon],
    current_temp: [:currently][:temperature],
    current_precip_probability: [:currently][:precipProbability],
    currently_feels_like: [:currently][:apparentTemperature],
    current_humidity: [:currently][:humidity],
    current_visibility: [:currently][:visibility],
    current_uv_index: [:currently][:uvIndex],
    hourly_summary: [:hourly][:data][:summary],
    hourly_icon: [:hourly][:data][:icon],
    hourly_temp: [:hourly][:data][:temperature],
    hourly_precip_probability: [:hourly][:data][:precipProbability],
    hourly_apparent_temp: [:hourly][:data][:apparentTemperature],
    hourly_humidity: [:hourly][:data][:humidity],
    hourly_visibility: [:hourly][:data][:visibility],
    hourly_uv_index: [:hourly][:data][:uvIndex]}

    Forecast.new(attrs)
  end

  private

  def service
    @_service ||= ForecastService.new(@location)
  end
end
