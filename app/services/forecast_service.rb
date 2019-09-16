class ForecastService

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def forecast_data
    JSON.parse(response.body, symbolize_names: true)
  end


private

  def response
    Faraday.get "https://api.darksky.net/forecast/#{ENV["DARK_SKY_API_KEY"]}/#{@coordinates}?exclude=minutely,alerts,flags"
    #don't forget to replace coordinates with variable
  end
end

# 39.7392358,-104.990251
