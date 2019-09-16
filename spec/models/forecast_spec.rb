require 'rails_helper'

RSpec.describe Forecast do
  it 'exists' do
    # attrs = {
    # todays_high: 100,  todays_low: 50, todays_summary: "The weather can't make up it's mind", todays_icon: 'sunny',  tonights_summary: "Expect freezing temperatures.",  current_summary: "Hot", current_icon: 'sunny', current_temp: 99, current_precip_probability: 10, currently_feels_like: 120, current_humidity: 2, current_visibility: 80, current_uv_index: 50, hourly_summary: 'Still Hot', hourly_icon: 'sunny', hourly_temp: 99,  hourly_precip_probability: 10, hourly_apparent_temp: 120, hourly_humidity: 2, hourly_visibility: 80, hourly_uv_index: 50
    # }

    data = facade.forecast

    forecast = Forcast.new(data)

    expect(forecast).to be_a Foreacast
    expect(forecast.currqqqent_temp).to eq(attrs[:current_temp])
    binding.pry

  end
end
