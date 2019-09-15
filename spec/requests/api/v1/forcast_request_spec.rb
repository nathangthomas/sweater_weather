require 'rails_helper'

describe 'Forecast API' do
  it 'sends forcast information for a city' do
    create(:forcast)

  get '/api/v1/forcast?location=denver,co'

  expect(response).to be_successful
  end
end
