require 'rails_helper'

describe 'Forecast API' do
  it 'sends a list of forcasts' do
    create_list(:forecast, 5)

    get '/api/v1/forecast'

    expect(response).to be_successful

    forecasts = JSON.parse(response.body)

    expect(forecasts.count).to eq(5)
  end

  # it 'sends forcast information for one city' do
  #   id = create(:forecast).id
  #   get "/api/v1/forecast/#{id}"
  #
  #   forecast = JSON.parse(response.body)
  #
  #   expect(response).to be_successful
  #   expect(forecast["id"].to eq(id))
  # end
end
