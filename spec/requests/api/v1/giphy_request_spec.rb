require 'rails_helper'

describe 'GiphyController' do
   it 'sends a list of gifs for each days weather' do
    create_list(:gif, 14)

    stub_request(:get, "https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_API_KEY"]}&q=Partly%20Cloudy&limit=1").to_return(status: 200, body: File.read("./fixtures/gif.json"), headers: {})

    stub_request(:get, "https://api.darksky.net/forecast/#{GOOGLE_API_KEY}/39.7392358,-104.990251?exclude=minutely,alerts,flags").to_return(status: 200, body: File.read("./fixtures/hourly_forecast.json"), headers: {})

    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful
    gifs = JSON.parse(response.body)

    expect(gifs.count).to eq(1)

  end
end
