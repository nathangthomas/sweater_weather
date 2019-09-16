class Api::V1::GifsController < ApplicationController
  def index
    forecast = ForecastService.new(@coordinates)

    forecast.hourly_summary.map do |summary|
      response = Faraday.get "https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_API_KEY"]}=#{summary}&limit=1"
      JSON.parse(response.body, symbolize_names: true)
    end

   render json: GifSerializer.new(Gif.all)
  end

private

#add search params for locaton to controller to allow user to search by location

end
