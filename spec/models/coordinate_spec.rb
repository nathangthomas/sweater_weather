require 'rails_helper'

RSpec.describe Coordinates do
  it 'exists' do

    attrs = {coordinates: "39.7392358,-104.990251"}
    coordinates = Coordinates.new(attrs)

    expect(coordinates).to be_a Coordinates
    expect(coordinates.coordinates).to eq(attrs[:coordinates])

  end
end
