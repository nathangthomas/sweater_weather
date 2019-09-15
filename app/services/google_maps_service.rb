class GoogleMapsService

  def coordinates_data
    data = get_json("/maps/api/geocode/json?")
    data[:results][0][:geometry][:location].values.join(",")
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
      faraday.adapter Faraday.default_adapter
    end
  end
end
