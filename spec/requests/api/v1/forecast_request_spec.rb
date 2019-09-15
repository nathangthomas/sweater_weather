require 'rails_helper'

describe 'Forecast API' do
  it 'sends a list of forcasts' do
    create_list(:forecast, 5)

    get '/api/v1/forecast'

    expect(response).to be_successful

    forecasts = JSON.parse(response.body)

    expect(forecasts.count).to eq(5)
  end

  it 'sends forcast information for one city' do
    id = create(:forecast).id
    get "/api/v1/forecast/#{id}"

    forecast = JSON.parse(response.body)

    expect(response).to be_successful
    expect(forecast["id"]).to eq(id)
  end

  it 'can create a new forecast' do
    forecast_params = {city: 'Denver', state: 'CO', country: 'USA', temperature: '80', high: 120, low: 65, humidity: 10, visibility: 90, uv_index: 2}

    post "/api/v1/forecast", params: {forecast: forecast_params}

    forecast = Forecast.last

    expect(response).to be_successful
    expect(forecast.city).to eq(forecast_params[:city])
  end

  it 'can update an existing forecast' do
    id = create(:forecast).id
    previous_city = Forecast.last.city
    forecast_params = forecast_params = {city: 'Boulder'}

    put "/api/v1/forecast/#{id}", params: {forecast: forecast_params}
    forecast = Forecast.find_by(id: id)

    expect(response).to be_successful
    expect(forecast.city).to_not eq(previous_city)
    expect(forecast.city).to eq('Boulder')
  end

  it 'can destroy a forecast' do

    forecast = create(:forecast)

    expect(Forecast.count).to eq(1)

    delete "/api/v1/forecast/#{forecast.id}"

    expect(response).to be_successful
    expect(Forecast.count).to eq(0)
    expect{Forecast.find(forecast.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
