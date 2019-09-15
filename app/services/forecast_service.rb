class ForecastService

  def coordinates_data
    data = get_json("/maps/api/geocode/json?")
    data[:results][0][:geometry][:location].values.join(",")
  end

  def forecast_data
    darksky_data
  end

private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    @_conn ||= Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_API_KEY"]
      faraday.params["address"] = 'denver'
      #replace 'denver' with variable for dynamic forcast search
      faraday.adapter Faraday.default_adapter
    end
  end

  def darksky_data
    response = Faraday.get("https://api.darksky.net/forecast/#{ENV["DARK_SKY_API_KEY"]}/#{coordinates_data}?exclude=minutely,alerts,flags")
    JSON.parse(response.body, symbolize_names: true)
  end

end
