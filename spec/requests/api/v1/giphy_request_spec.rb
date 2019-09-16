require 'rails_helper'

describe 'GiphyController' do
   it 'sends a list of gifs for each days weather' do
    create_list(:gif, 14)

    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful
    giphs = JSON.parse(response.body)

    expect(:gify.count).to eq(14)
  end
end
