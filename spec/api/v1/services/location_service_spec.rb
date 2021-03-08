require 'rails_helper'

describe 'LocationService' do
  it '.location_details' do
    location = "Denver, CO"
    data = LocationService.location_details(location)
    results = data[:results]

    expect(results).to be_an(Array)
    expect(results[0][:locations]).to be_an(Array)
    expect(results[0][:locations][0][:latLng]).to be_a(Hash)
    expect(results[0][:locations][0][:latLng][:lat]).to be_a(Float)
    expect(results[0][:locations][0][:latLng][:lng]).to be_a(Float)
  end
end
