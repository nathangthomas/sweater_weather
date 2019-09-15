require 'rails_helper'

describe 'Forecast API' do
  it 'sends forecast information for a city' do
    create(:forecast)

  get '/api/v1/forecast?location=denver,co'

  expect(response).to be_successful

  forecasts = JSON.parse(response.body)

  end
end
