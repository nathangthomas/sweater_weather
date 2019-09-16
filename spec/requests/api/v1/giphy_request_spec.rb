require 'rails_helper'

describe 'GiphyController' do
   it 'sends a list of gifs for each days weather' do
    create_list(:gif, 14)

    # stub_gifs_api_calls

    stub_request(:get, "https://api.giphy.com/v1/gifs/search?api_key=l1RMz2nBcSsGN8n7HhFAHAdviLXs6nvS&limit=1&q='Mostly%20cloudy%20throughout%20the%20day.'").to_return(status: 200, body: File.read("./fixtures/gif.json"), headers: {})


    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful
    gifs = JSON.parse(response.body)

    expect(gifs.count).to eq(14)
  end
end
