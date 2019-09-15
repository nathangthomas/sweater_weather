class DarkSkyService

  def forecast_data
    data = get_json("/forecast/")
  end


  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    @_conn ||= Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.params["key"] = ENV["DARK_SKY_API_KEY"]
      faraday.params["coordinates"] =  services.coordinates_data
      faraday.params["exclude"] = "minutely,alerts,flags"
      faraday.adapter Faraday.default_adapter
    end
  end
end
